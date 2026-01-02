import 'dart:convert';
import 'dart:typed_data';
import 'package:google_generative_ai/google_generative_ai.dart';
import 'package:serverpod/serverpod.dart';

/// Gemini AI 서비스 - NSFW 체크, OCR, 자동 태깅 수행
class GeminiService {
  static GeminiService? _instance;
  late GenerativeModel _model;
  late GenerativeModel _visionModel;
  bool _initialized = false;

  GeminiService._();

  static GeminiService get instance {
    _instance ??= GeminiService._();
    return _instance!;
  }

  /// 서비스 초기화 - API 키로 모델 설정
  void initialize(String apiKey) {
    if (_initialized) return;

    _model = GenerativeModel(
      model: 'gemini-1.5-flash',
      apiKey: apiKey,
    );

    _visionModel = GenerativeModel(
      model: 'gemini-1.5-flash',
      apiKey: apiKey,
    );

    _initialized = true;
  }

  /// NSFW 콘텐츠 검사
  Future<NsfwCheckResult> checkNsfw(Uint8List imageBytes) async {
    try {
      final prompt = '''
Analyze this image for NSFW (Not Safe For Work) content.
Check for:
- Sexual or explicit content
- Graphic violence
- Disturbing imagery
- Hate symbols

Respond in JSON format only:
{
  "isNsfw": boolean,
  "confidence": float (0.0 to 1.0),
  "reason": "brief explanation if NSFW"
}
''';

      final content = [
        Content.multi([
          TextPart(prompt),
          DataPart('image/png', imageBytes),
        ])
      ];

      final response = await _visionModel.generateContent(content);
      final text = response.text ?? '{"isNsfw": false, "confidence": 0.0}';

      // JSON 파싱
      final jsonStr = _extractJson(text);
      final json = jsonDecode(jsonStr) as Map<String, dynamic>;

      return NsfwCheckResult(
        isNsfw: json['isNsfw'] as bool? ?? false,
        confidence: (json['confidence'] as num?)?.toDouble() ?? 0.0,
        reason: json['reason'] as String?,
      );
    } catch (e) {
      // 에러 시 안전하게 false 반환
      return NsfwCheckResult(isNsfw: false, confidence: 0.0, reason: 'Error: $e');
    }
  }

  /// OCR - 이미지 내 텍스트 추출
  Future<String?> extractText(Uint8List imageBytes) async {
    try {
      final prompt = '''
Extract all visible text from this image.
If there is no text, respond with "NO_TEXT".
If there is text, return only the extracted text, nothing else.
''';

      final content = [
        Content.multi([
          TextPart(prompt),
          DataPart('image/png', imageBytes),
        ])
      ];

      final response = await _visionModel.generateContent(content);
      final text = response.text?.trim();

      if (text == null || text == 'NO_TEXT' || text.isEmpty) {
        return null;
      }

      return text;
    } catch (e) {
      return null;
    }
  }

  /// 이미지 분석 - 설명 및 태그 생성
  Future<ImageAnalysisResult> analyzeImage(Uint8List imageBytes) async {
    try {
      final prompt = '''
Analyze this meme/image and provide:
1. A brief description (1-2 sentences) of what the meme is about
2. Relevant tags for searching (up to 10 tags)
3. The mood/emotion of the meme

Respond in JSON format only:
{
  "description": "string",
  "tags": ["tag1", "tag2", ...],
  "mood": "string"
}
''';

      final content = [
        Content.multi([
          TextPart(prompt),
          DataPart('image/png', imageBytes),
        ])
      ];

      final response = await _visionModel.generateContent(content);
      final text = response.text ?? '{}';

      final jsonStr = _extractJson(text);
      final json = jsonDecode(jsonStr) as Map<String, dynamic>;

      final tags = (json['tags'] as List<dynamic>?)
              ?.map((e) => e.toString())
              .toList() ??
          [];

      return ImageAnalysisResult(
        description: json['description'] as String? ?? 'A meme image',
        tags: tags,
        mood: json['mood'] as String?,
      );
    } catch (e) {
      return ImageAnalysisResult(
        description: 'Unable to analyze image',
        tags: [],
        mood: null,
      );
    }
  }

  /// JSON 문자열 추출 (마크다운 코드 블록 처리)
  String _extractJson(String text) {
    // ```json ... ``` 형식 처리
    final jsonBlockMatch = RegExp(r'```json?\s*([\s\S]*?)\s*```').firstMatch(text);
    if (jsonBlockMatch != null) {
      return jsonBlockMatch.group(1)!.trim();
    }

    // { ... } 형식 직접 찾기
    final jsonMatch = RegExp(r'\{[\s\S]*\}').firstMatch(text);
    if (jsonMatch != null) {
      return jsonMatch.group(0)!;
    }

    return text;
  }
}

/// NSFW 검사 결과
class NsfwCheckResult {
  final bool isNsfw;
  final double confidence;
  final String? reason;

  NsfwCheckResult({
    required this.isNsfw,
    required this.confidence,
    this.reason,
  });
}

/// 이미지 분석 결과
class ImageAnalysisResult {
  final String description;
  final List<String> tags;
  final String? mood;

  ImageAnalysisResult({
    required this.description,
    required this.tags,
    this.mood,
  });
}
