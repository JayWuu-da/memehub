import 'dart:typed_data';
import 'package:http/http.dart' as http;
import 'package:serverpod/serverpod.dart';
import '../generated/protocol.dart';
import '../services/gemini_service.dart';

/// AI 처리를 위한 Future Call
/// 업로드된 이미지에 대해 NSFW 체크, OCR, 태깅을 수행
class ProcessMemeFutureCall extends FutureCall<MemeProcessRequest> {
  @override
  Future<void> invoke(Session session, MemeProcessRequest? request) async {
    if (request == null) {
      session.log('ProcessMemeFutureCall: No request provided', level: LogLevel.warning);
      return;
    }

    final memeId = request.memeId;
    final storagePath = request.storagePath;

    session.log('Processing meme: $memeId', level: LogLevel.info);

    try {
      // 1. 현재 Meme 조회
      final meme = await Meme.db.findById(session, memeId);
      if (meme == null) {
        session.log('Meme not found: $memeId', level: LogLevel.error);
        return;
      }

      // 2. 상태를 processing으로 업데이트
      await Meme.db.updateRow(
        session,
        meme.copyWith(status: 'processing'),
      );

      // 3. 이미지 다운로드
      final imageBytes = await _downloadImage(meme.storageUrl);
      if (imageBytes == null) {
        await _rejectMeme(session, meme, 'Failed to download image');
        return;
      }

      // 4. Gemini 서비스 초기화 확인
      final geminiApiKey = session.passwords['geminiApiKey'];
      if (geminiApiKey == null) {
        session.log('Gemini API key not configured', level: LogLevel.error);
        await _rejectMeme(session, meme, 'AI service not configured');
        return;
      }
      GeminiService.instance.initialize(geminiApiKey);

      // 5. NSFW 체크
      final nsfwResult = await GeminiService.instance.checkNsfw(imageBytes);
      if (nsfwResult.isNsfw && nsfwResult.confidence > 0.7) {
        session.log('NSFW content detected: ${nsfwResult.reason}', level: LogLevel.warning);
        await _rejectMeme(session, meme, 'NSFW content detected');
        return;
      }

      // 6. OCR 추출
      final ocrText = await GeminiService.instance.extractText(imageBytes);

      // 7. 이미지 분석 (태그 및 설명)
      final analysis = await GeminiService.instance.analyzeImage(imageBytes);

      // 8. Meme 업데이트 - approved 상태로 변경
      await Meme.db.updateRow(
        session,
        meme.copyWith(
          status: 'approved',
          isNsfw: nsfwResult.isNsfw,
          ocrText: ocrText,
          aiDescription: analysis.description,
          tags: analysis.tags,
          updatedAt: DateTime.now(),
        ),
      );

      session.log('Meme $memeId processed successfully', level: LogLevel.info);

      // 9. 트렌딩 업데이트 브로드캐스트 (새 짤 추가 알림)
      await _broadcastNewMeme(session, meme);

    } catch (e, stackTrace) {
      session.log(
        'Error processing meme $memeId: $e',
        level: LogLevel.error,
        stackTrace: stackTrace,
      );

      // 에러 시 rejected 상태로 변경
      final meme = await Meme.db.findById(session, memeId);
      if (meme != null) {
        await _rejectMeme(session, meme, 'Processing error: $e');
      }
    }
  }

  /// 이미지 URL에서 다운로드
  Future<Uint8List?> _downloadImage(String url) async {
    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        return response.bodyBytes;
      }
      return null;
    } catch (e) {
      return null;
    }
  }

  /// Meme을 rejected 상태로 변경
  Future<void> _rejectMeme(Session session, Meme meme, String reason) async {
    await Meme.db.updateRow(
      session,
      meme.copyWith(
        status: 'rejected',
        aiDescription: reason,
        updatedAt: DateTime.now(),
      ),
    );
  }

  /// 새 Meme 추가 브로드캐스트
  Future<void> _broadcastNewMeme(Session session, Meme meme) async {
    try {
      final update = TrendingUpdate(
        memeId: meme.id!,
        storageUrl: meme.storageUrl,
        thumbnailUrl: meme.thumbnailUrl,
        usageCount: meme.usageCount,
        rank: 0, // 새 짤은 아직 순위 없음
        changeType: 'new',
      );

      session.messages.postMessage(
        'trending:updates',
        update,
      );
    } catch (e) {
      session.log('Failed to broadcast new meme: $e', level: LogLevel.warning);
    }
  }
}
