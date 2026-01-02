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

/// MemeHub Protocol - Meme Usage Tracking
abstract class MemeUsage implements _i1.SerializableModel {
  MemeUsage._({
    this.id,
    required this.memeId,
    this.userId,
    required this.usedAt,
    required this.source,
  });

  factory MemeUsage({
    int? id,
    required int memeId,
    int? userId,
    required DateTime usedAt,
    required String source,
  }) = _MemeUsageImpl;

  factory MemeUsage.fromJson(Map<String, dynamic> jsonSerialization) {
    return MemeUsage(
      id: jsonSerialization['id'] as int?,
      memeId: jsonSerialization['memeId'] as int,
      userId: jsonSerialization['userId'] as int?,
      usedAt: _i1.DateTimeJsonExtension.fromJson(jsonSerialization['usedAt']),
      source: jsonSerialization['source'] as String,
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  int memeId;

  int? userId;

  DateTime usedAt;

  String source;

  /// Returns a shallow copy of this [MemeUsage]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  MemeUsage copyWith({
    int? id,
    int? memeId,
    int? userId,
    DateTime? usedAt,
    String? source,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'MemeUsage',
      if (id != null) 'id': id,
      'memeId': memeId,
      if (userId != null) 'userId': userId,
      'usedAt': usedAt.toJson(),
      'source': source,
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _MemeUsageImpl extends MemeUsage {
  _MemeUsageImpl({
    int? id,
    required int memeId,
    int? userId,
    required DateTime usedAt,
    required String source,
  }) : super._(
         id: id,
         memeId: memeId,
         userId: userId,
         usedAt: usedAt,
         source: source,
       );

  /// Returns a shallow copy of this [MemeUsage]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  MemeUsage copyWith({
    Object? id = _Undefined,
    int? memeId,
    Object? userId = _Undefined,
    DateTime? usedAt,
    String? source,
  }) {
    return MemeUsage(
      id: id is int? ? id : this.id,
      memeId: memeId ?? this.memeId,
      userId: userId is int? ? userId : this.userId,
      usedAt: usedAt ?? this.usedAt,
      source: source ?? this.source,
    );
  }
}
