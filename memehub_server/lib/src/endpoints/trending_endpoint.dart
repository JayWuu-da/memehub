import 'dart:async';
import 'package:serverpod/serverpod.dart';
import '../generated/protocol.dart';

/// 실시간 트렌딩 피드 스트리밍 엔드포인트
class TrendingEndpoint extends Endpoint {
  /// 실시간 트렌딩 업데이트 스트림
  /// 클라이언트가 이 스트림을 구독하면 짤 사용량 변화를 실시간으로 받을 수 있음
  Stream<TrendingUpdate> streamTrending(Session session) async* {
    // 현재 트렌딩 목록 먼저 전송
    final initialTrending = await _getTopTrending(session, limit: 10);
    var rank = 1;
    for (final meme in initialTrending) {
      yield TrendingUpdate(
        memeId: meme.id!,
        storageUrl: meme.storageUrl,
        thumbnailUrl: meme.thumbnailUrl,
        usageCount: meme.usageCount,
        rank: rank++,
        changeType: 'same',
      );
    }

    // MessageCentral 채널 구독을 위한 StreamController
    final controller = StreamController<TrendingUpdate>();

    // 채널 구독
    final subscription = session.messages
        .createStream<TrendingUpdate>('trending:updates')
        .listen((update) {
      controller.add(update);
    });

    // 스트림 종료 시 정리
    try {
      await for (final update in controller.stream) {
        yield update;
      }
    } finally {
      await subscription.cancel();
      await controller.close();
    }
  }

  /// 현재 트렌딩 스냅샷 조회
  Future<List<TrendingUpdate>> getTrendingSnapshot(
    Session session, {
    int limit = 20,
  }) async {
    final memes = await _getTopTrending(session, limit: limit);

    final updates = <TrendingUpdate>[];
    var rank = 1;

    for (final meme in memes) {
      updates.add(TrendingUpdate(
        memeId: meme.id!,
        storageUrl: meme.storageUrl,
        thumbnailUrl: meme.thumbnailUrl,
        usageCount: meme.usageCount,
        rank: rank++,
        changeType: 'same',
      ));
    }

    return updates;
  }

  /// 최근 인기 Meme 조회
  Future<List<Meme>> _getTopTrending(Session session, {int limit = 10}) async {
    return await Meme.db.find(
      session,
      where: (t) => t.status.equals('approved'),
      orderBy: (t) => t.usageCount,
      orderDescending: true,
      limit: limit,
    );
  }
}
