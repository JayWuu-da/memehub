import 'package:serverpod/serverpod.dart';
import '../generated/protocol.dart';

/// Collection 엔드포인트 - 보관함 CRUD 기능
class CollectionEndpoint extends Endpoint {
  /// 보관함 생성
  Future<Collection> create(
    Session session,
    String name, {
    String? description,
  }) async {
    final userId = await _getUserId(session);

    final collection = Collection(
      userId: userId,
      name: name,
      description: description,
      coverMemeId: null,
      memeCount: 0,
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
    );

    return await Collection.db.insertRow(session, collection);
  }

  /// 내 보관함 목록
  Future<List<Collection>> getMyCollections(Session session) async {
    final userId = await _getUserId(session);

    return await Collection.db.find(
      session,
      where: (t) => t.userId.equals(userId),
      orderBy: (t) => t.updatedAt,
      orderDescending: true,
    );
  }

  /// 보관함 상세 정보
  Future<Collection?> getCollection(Session session, int collectionId) async {
    final userId = await _getUserId(session);
    final collection = await Collection.db.findById(session, collectionId);

    if (collection == null || collection.userId != userId) {
      return null;
    }

    return collection;
  }

  /// 보관함 수정
  Future<Collection?> update(
    Session session,
    int collectionId, {
    String? name,
    String? description,
  }) async {
    final userId = await _getUserId(session);
    final collection = await Collection.db.findById(session, collectionId);

    if (collection == null || collection.userId != userId) {
      return null;
    }

    final updated = collection.copyWith(
      name: name ?? collection.name,
      description: description ?? collection.description,
      updatedAt: DateTime.now(),
    );

    return await Collection.db.updateRow(session, updated);
  }

  /// 보관함 삭제
  Future<bool> delete(Session session, int collectionId) async {
    final userId = await _getUserId(session);
    final collection = await Collection.db.findById(session, collectionId);

    if (collection == null || collection.userId != userId) {
      return false;
    }

    // 보관함 내 모든 짤 연결 삭제
    final links = await CollectionMeme.db.find(
      session,
      where: (t) => t.collectionId.equals(collectionId),
    );
    for (final link in links) {
      await CollectionMeme.db.deleteRow(session, link);
    }

    // 보관함 삭제
    await Collection.db.deleteRow(session, collection);
    return true;
  }

  /// 보관함에 짤 추가
  Future<bool> addMeme(Session session, int collectionId, int memeId) async {
    final userId = await _getUserId(session);
    final collection = await Collection.db.findById(session, collectionId);

    if (collection == null || collection.userId != userId) {
      return false;
    }

    // 이미 추가되어 있는지 확인
    final existing = await CollectionMeme.db.findFirstRow(
      session,
      where: (t) =>
          t.collectionId.equals(collectionId) & t.memeId.equals(memeId),
    );

    if (existing != null) {
      return true; // 이미 존재
    }

    // 연결 생성
    await CollectionMeme.db.insertRow(
      session,
      CollectionMeme(
        collectionId: collectionId,
        memeId: memeId,
        addedAt: DateTime.now(),
      ),
    );

    // memeCount 증가
    await Collection.db.updateRow(
      session,
      collection.copyWith(
        memeCount: collection.memeCount + 1,
        coverMemeId: collection.coverMemeId ?? memeId,
        updatedAt: DateTime.now(),
      ),
    );

    return true;
  }

  /// 보관함에서 짤 제거
  Future<bool> removeMeme(Session session, int collectionId, int memeId) async {
    final userId = await _getUserId(session);
    final collection = await Collection.db.findById(session, collectionId);

    if (collection == null || collection.userId != userId) {
      return false;
    }

    final link = await CollectionMeme.db.findFirstRow(
      session,
      where: (t) =>
          t.collectionId.equals(collectionId) & t.memeId.equals(memeId),
    );

    if (link == null) {
      return false;
    }

    await CollectionMeme.db.deleteRow(session, link);

    // memeCount 감소
    await Collection.db.updateRow(
      session,
      collection.copyWith(
        memeCount: collection.memeCount - 1,
        coverMemeId: collection.coverMemeId == memeId ? null : collection.coverMemeId,
        updatedAt: DateTime.now(),
      ),
    );

    return true;
  }

  /// 보관함 내 짤 목록
  Future<List<Meme>> getMemes(
    Session session,
    int collectionId, {
    int offset = 0,
    int limit = 50,
  }) async {
    final userId = await _getUserId(session);
    final collection = await Collection.db.findById(session, collectionId);

    if (collection == null || collection.userId != userId) {
      return [];
    }

    // 연결된 Meme ID 조회
    final links = await CollectionMeme.db.find(
      session,
      where: (t) => t.collectionId.equals(collectionId),
      orderBy: (t) => t.addedAt,
      orderDescending: true,
      limit: limit,
      offset: offset,
    );

    if (links.isEmpty) {
      return [];
    }

    // Meme 정보 조회
    final memeIds = links.map((l) => l.memeId).toList();
    final memes = <Meme>[];

    for (final memeId in memeIds) {
      final meme = await Meme.db.findById(session, memeId);
      if (meme != null) {
        memes.add(meme);
      }
    }

    return memes;
  }

  /// 사용자 ID 조회
  Future<int> _getUserId(Session session) async {
    return 1; // TODO: 실제 인증 구현 시 수정
  }
}
