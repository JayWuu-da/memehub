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
import 'package:serverpod_client/serverpod_client.dart' as _i1;
import 'package:memehub_client/src/protocol/protocol.dart' as _i2;

/// MemeHub Protocol - Meme Model
abstract class Meme implements _i1.SerializableModel {
  Meme._({
    this.id,
    required this.userId,
    required this.storageUrl,
    this.thumbnailUrl,
    required this.fileType,
    required this.fileSize,
    required this.width,
    required this.height,
    this.ocrText,
    this.aiDescription,
    this.tags,
    required this.isNsfw,
    required this.status,
    required this.usageCount,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Meme({
    int? id,
    required int userId,
    required String storageUrl,
    String? thumbnailUrl,
    required String fileType,
    required int fileSize,
    required int width,
    required int height,
    String? ocrText,
    String? aiDescription,
    List<String>? tags,
    required bool isNsfw,
    required String status,
    required int usageCount,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) = _MemeImpl;

  factory Meme.fromJson(Map<String, dynamic> jsonSerialization) {
    return Meme(
      id: jsonSerialization['id'] as int?,
      userId: jsonSerialization['userId'] as int,
      storageUrl: jsonSerialization['storageUrl'] as String,
      thumbnailUrl: jsonSerialization['thumbnailUrl'] as String?,
      fileType: jsonSerialization['fileType'] as String,
      fileSize: jsonSerialization['fileSize'] as int,
      width: jsonSerialization['width'] as int,
      height: jsonSerialization['height'] as int,
      ocrText: jsonSerialization['ocrText'] as String?,
      aiDescription: jsonSerialization['aiDescription'] as String?,
      tags: jsonSerialization['tags'] == null
          ? null
          : _i2.Protocol().deserialize<List<String>>(jsonSerialization['tags']),
      isNsfw: jsonSerialization['isNsfw'] as bool,
      status: jsonSerialization['status'] as String,
      usageCount: jsonSerialization['usageCount'] as int,
      createdAt: _i1.DateTimeJsonExtension.fromJson(
        jsonSerialization['createdAt'],
      ),
      updatedAt: _i1.DateTimeJsonExtension.fromJson(
        jsonSerialization['updatedAt'],
      ),
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  /// User who uploaded this meme
  int userId;

  /// Storage paths
  String storageUrl;

  String? thumbnailUrl;

  /// File metadata
  String fileType;

  int fileSize;

  int width;

  int height;

  /// AI-generated content
  String? ocrText;

  String? aiDescription;

  List<String>? tags;

  /// Content moderation
  bool isNsfw;

  String status;

  /// Usage tracking
  int usageCount;

  /// Timestamps
  DateTime createdAt;

  DateTime updatedAt;

  /// Returns a shallow copy of this [Meme]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  Meme copyWith({
    int? id,
    int? userId,
    String? storageUrl,
    String? thumbnailUrl,
    String? fileType,
    int? fileSize,
    int? width,
    int? height,
    String? ocrText,
    String? aiDescription,
    List<String>? tags,
    bool? isNsfw,
    String? status,
    int? usageCount,
    DateTime? createdAt,
    DateTime? updatedAt,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'Meme',
      if (id != null) 'id': id,
      'userId': userId,
      'storageUrl': storageUrl,
      if (thumbnailUrl != null) 'thumbnailUrl': thumbnailUrl,
      'fileType': fileType,
      'fileSize': fileSize,
      'width': width,
      'height': height,
      if (ocrText != null) 'ocrText': ocrText,
      if (aiDescription != null) 'aiDescription': aiDescription,
      if (tags != null) 'tags': tags?.toJson(),
      'isNsfw': isNsfw,
      'status': status,
      'usageCount': usageCount,
      'createdAt': createdAt.toJson(),
      'updatedAt': updatedAt.toJson(),
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _MemeImpl extends Meme {
  _MemeImpl({
    int? id,
    required int userId,
    required String storageUrl,
    String? thumbnailUrl,
    required String fileType,
    required int fileSize,
    required int width,
    required int height,
    String? ocrText,
    String? aiDescription,
    List<String>? tags,
    required bool isNsfw,
    required String status,
    required int usageCount,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) : super._(
         id: id,
         userId: userId,
         storageUrl: storageUrl,
         thumbnailUrl: thumbnailUrl,
         fileType: fileType,
         fileSize: fileSize,
         width: width,
         height: height,
         ocrText: ocrText,
         aiDescription: aiDescription,
         tags: tags,
         isNsfw: isNsfw,
         status: status,
         usageCount: usageCount,
         createdAt: createdAt,
         updatedAt: updatedAt,
       );

  /// Returns a shallow copy of this [Meme]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  Meme copyWith({
    Object? id = _Undefined,
    int? userId,
    String? storageUrl,
    Object? thumbnailUrl = _Undefined,
    String? fileType,
    int? fileSize,
    int? width,
    int? height,
    Object? ocrText = _Undefined,
    Object? aiDescription = _Undefined,
    Object? tags = _Undefined,
    bool? isNsfw,
    String? status,
    int? usageCount,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return Meme(
      id: id is int? ? id : this.id,
      userId: userId ?? this.userId,
      storageUrl: storageUrl ?? this.storageUrl,
      thumbnailUrl: thumbnailUrl is String? ? thumbnailUrl : this.thumbnailUrl,
      fileType: fileType ?? this.fileType,
      fileSize: fileSize ?? this.fileSize,
      width: width ?? this.width,
      height: height ?? this.height,
      ocrText: ocrText is String? ? ocrText : this.ocrText,
      aiDescription: aiDescription is String?
          ? aiDescription
          : this.aiDescription,
      tags: tags is List<String>? ? tags : this.tags?.map((e0) => e0).toList(),
      isNsfw: isNsfw ?? this.isNsfw,
      status: status ?? this.status,
      usageCount: usageCount ?? this.usageCount,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }
}
