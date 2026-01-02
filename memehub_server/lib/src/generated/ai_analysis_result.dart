/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: implementation_imports
// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: non_constant_identifier_names
// ignore_for_file: public_member_api_docs
// ignore_for_file: type_literal_in_constant_pattern
// ignore_for_file: use_super_parameters
// ignore_for_file: invalid_use_of_internal_member

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod/serverpod.dart' as _i1;
import 'package:memehub_server/src/generated/protocol.dart' as _i2;

/// AI Analysis Result DTO
abstract class AiAnalysisResult
    implements _i1.SerializableModel, _i1.ProtocolSerialization {
  AiAnalysisResult._({
    required this.isNsfw,
    required this.nsfwConfidence,
    this.ocrText,
    this.description,
    this.tags,
  });

  factory AiAnalysisResult({
    required bool isNsfw,
    required double nsfwConfidence,
    String? ocrText,
    String? description,
    List<String>? tags,
  }) = _AiAnalysisResultImpl;

  factory AiAnalysisResult.fromJson(Map<String, dynamic> jsonSerialization) {
    return AiAnalysisResult(
      isNsfw: jsonSerialization['isNsfw'] as bool,
      nsfwConfidence: (jsonSerialization['nsfwConfidence'] as num).toDouble(),
      ocrText: jsonSerialization['ocrText'] as String?,
      description: jsonSerialization['description'] as String?,
      tags: jsonSerialization['tags'] == null
          ? null
          : _i2.Protocol().deserialize<List<String>>(jsonSerialization['tags']),
    );
  }

  bool isNsfw;

  double nsfwConfidence;

  String? ocrText;

  String? description;

  List<String>? tags;

  /// Returns a shallow copy of this [AiAnalysisResult]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  AiAnalysisResult copyWith({
    bool? isNsfw,
    double? nsfwConfidence,
    String? ocrText,
    String? description,
    List<String>? tags,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'AiAnalysisResult',
      'isNsfw': isNsfw,
      'nsfwConfidence': nsfwConfidence,
      if (ocrText != null) 'ocrText': ocrText,
      if (description != null) 'description': description,
      if (tags != null) 'tags': tags?.toJson(),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'AiAnalysisResult',
      'isNsfw': isNsfw,
      'nsfwConfidence': nsfwConfidence,
      if (ocrText != null) 'ocrText': ocrText,
      if (description != null) 'description': description,
      if (tags != null) 'tags': tags?.toJson(),
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _AiAnalysisResultImpl extends AiAnalysisResult {
  _AiAnalysisResultImpl({
    required bool isNsfw,
    required double nsfwConfidence,
    String? ocrText,
    String? description,
    List<String>? tags,
  }) : super._(
         isNsfw: isNsfw,
         nsfwConfidence: nsfwConfidence,
         ocrText: ocrText,
         description: description,
         tags: tags,
       );

  /// Returns a shallow copy of this [AiAnalysisResult]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  AiAnalysisResult copyWith({
    bool? isNsfw,
    double? nsfwConfidence,
    Object? ocrText = _Undefined,
    Object? description = _Undefined,
    Object? tags = _Undefined,
  }) {
    return AiAnalysisResult(
      isNsfw: isNsfw ?? this.isNsfw,
      nsfwConfidence: nsfwConfidence ?? this.nsfwConfidence,
      ocrText: ocrText is String? ? ocrText : this.ocrText,
      description: description is String? ? description : this.description,
      tags: tags is List<String>? ? tags : this.tags?.map((e0) => e0).toList(),
    );
  }
}
