import 'package:serverpod/serverpod.dart';
import '../generated/protocol.dart';

/// Meme 엔드포인트 - 업로드, 검색, 조회 기능 제공
class MemeEndpoint extends Endpoint {
  /// 파일 업로드 URL 생성 (Direct Upload to Cloud Storage)
  /// 실제 GCS 설정이 없는 경우를 위한 간단한 구현
  Future<UploadDescription> createUploadUrl(
    Session session,
    String fileName,
    String fileType,
    int fileSize,
  ) async {
    // 고유한 스토리지 경로 생성
    final timestamp = DateTime.now().millisecondsSinceEpoch;
    final sanitizedName = fileName.replaceAll(RegExp(r'[^a-zA-Z0-9._-]'), '_');
    final storagePath = 'memes/$timestamp-$sanitizedName';

    // 실제 GCS 설정 시 아래 코드 사용
    // final uploadDescription = await session.storage.createDirectFileUploadDescription(
    //   storageId: 'public',
    //   path: storagePath,
    // );

    // 개발용: 로컬 업로드 URL 반환
    return UploadDescription(
      uploadUrl: 'https://storage.googleapis.com/memehub-bucket/$storagePath',
      storagePath: storagePath,
      expiresAt: DateTime.now().add(const Duration(hours: 1)),
    );
  }

  /// 업로드 완료 알림 → Future Call 트리거
  Future<Meme> completeUpload(
    Session session, {
    required String storagePath,
    required String storageUrl,
    required String fileType,
    required int fileSize,
    required int width,
    required int height,
  }) async {
    // 인증된 사용자 확인 (옵션)
    final userId = await _getUserId(session);

    // Meme 레코드 생성
    final meme = Meme(
      userId: userId,
      storageUrl: storageUrl,
      thumbnailUrl: null,
      fileType: fileType,
      fileSize: fileSize,
      width: width,
      height: height,
      ocrText: null,
      aiDescription: null,
      tags: null,
      isNsfw: false,
      status: 'pending',
      usageCount: 0,
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
    );

    final insertedMeme = await Meme.db.insertRow(session, meme);

    // Future Call 스케줄링 - AI 처리
    await session.serverpod.futureCallWithDelay(
      'processMeme',
      MemeProcessRequest(
        memeId: insertedMeme.id!,
        storagePath: storagePath,
      ),
      const Duration(seconds: 1), // 1초 후 처리 시작
    );

    return insertedMeme;
  }

  /// 시맨틱 검색 (태그 + OCR 텍스트 기반)
  Future<List<Meme>> search(
    Session session,
    String query, {
    int limit = 20,
    int offset = 0,
  }) async {
    final queryLower = query.toLowerCase();

    // approved 상태의 Meme만 검색
    // 태그 또는 OCR 텍스트에서 검색어 매칭
    final memes = await Meme.db.find(
      session,
      where: (t) =>
          t.status.equals('approved') &
          (t.ocrText.ilike('%$queryLower%') |
              t.aiDescription.ilike('%$queryLower%')),
      orderBy: (t) => t.usageCount,
      orderDescending: true,
      limit: limit,
      offset: offset,
    );

    return memes;
  }

  /// 인기 (트렌딩) 짤 목록
  Future<List<Meme>> getTrending(
    Session session, {
    int limit = 20,
    int offset = 0,
  }) async {
    // 사용 횟수 기준 정렬
    final memes = await Meme.db.find(
      session,
      where: (t) => t.status.equals('approved'),
      orderBy: (t) => t.usageCount,
      orderDescending: true,
      limit: limit,
      offset: offset,
    );

    return memes;
  }

  /// 최신 짤 목록
  Future<List<Meme>> getLatest(
    Session session, {
    int limit = 20,
    int offset = 0,
  }) async {
    final memes = await Meme.db.find(
      session,
      where: (t) => t.status.equals('approved'),
      orderBy: (t) => t.createdAt,
      orderDescending: true,
      limit: limit,
      offset: offset,
    );

    return memes;
  }

  /// 짤 사용 기록
  Future<void> recordUsage(
    Session session,
    int memeId,
    String source,
  ) async {
    final userId = await _getUserId(session);

    // 사용 기록 저장
    await MemeUsage.db.insertRow(
      session,
      MemeUsage(
        memeId: memeId,
        userId: userId,
        usedAt: DateTime.now(),
        source: source,
      ),
    );

    // Meme의 usageCount 증가
    final meme = await Meme.db.findById(session, memeId);
    if (meme != null) {
      await Meme.db.updateRow(
        session,
        meme.copyWith(
          usageCount: meme.usageCount + 1,
          updatedAt: DateTime.now(),
        ),
      );

      // 트렌딩 업데이트 브로드캐스트
      _broadcastUsageUpdate(session, meme);
    }
  }

  /// 짤 상세 정보
  Future<Meme?> getMeme(Session session, int memeId) async {
    return await Meme.db.findById(session, memeId);
  }

  /// 내가 업로드한 짤 목록
  Future<List<Meme>> getMyMemes(
    Session session, {
    int offset = 0,
    int limit = 20,
  }) async {
    final userId = await _getUserId(session);

    final memes = await Meme.db.find(
      session,
      where: (t) => t.userId.equals(userId),
      orderBy: (t) => t.createdAt,
      orderDescending: true,
      limit: limit,
      offset: offset,
    );

    return memes;
  }

  /// 짤 삭제
  Future<bool> deleteMeme(Session session, int memeId) async {
    final userId = await _getUserId(session);
    final meme = await Meme.db.findById(session, memeId);

    if (meme == null || meme.userId != userId) {
      return false;
    }

    // DB에서 삭제
    await Meme.db.deleteRow(session, meme);
    return true;
  }

  /// 사용자 ID 조회 (인증된 경우)
  Future<int> _getUserId(Session session) async {
    // 인증 모듈이 설정된 경우 실제 사용자 ID 반환
    // 현재는 기본값 반환
    return 1; // TODO: 실제 인증 구현 시 수정
  }

  /// 사용량 업데이트 브로드캐스트
  void _broadcastUsageUpdate(Session session, Meme meme) {
    try {
      session.messages.postMessage(
        'trending:updates',
        TrendingUpdate(
          memeId: meme.id!,
          storageUrl: meme.storageUrl,
          thumbnailUrl: meme.thumbnailUrl,
          usageCount: meme.usageCount + 1,
          rank: 0,
          changeType: 'up',
        ),
      );
    } catch (e) {
      session.log('Failed to broadcast usage update: $e', level: LogLevel.warning);
    }
  }
}
