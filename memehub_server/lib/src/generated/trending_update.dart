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

/// Trending Update DTO for Real-time Streaming
abstract class TrendingUpdate
    implements _i1.SerializableModel, _i1.ProtocolSerialization {
  TrendingUpdate._({
    required this.memeId,
    required this.storageUrl,
    this.thumbnailUrl,
    required this.usageCount,
    required this.rank,
    required this.changeType,
  });

  factory TrendingUpdate({
    required int memeId,
    required String storageUrl,
    String? thumbnailUrl,
    required int usageCount,
    required int rank,
    required String changeType,
  }) = _TrendingUpdateImpl;

  factory TrendingUpdate.fromJson(Map<String, dynamic> jsonSerialization) {
    return TrendingUpdate(
      memeId: jsonSerialization['memeId'] as int,
      storageUrl: jsonSerialization['storageUrl'] as String,
      thumbnailUrl: jsonSerialization['thumbnailUrl'] as String?,
      usageCount: jsonSerialization['usageCount'] as int,
      rank: jsonSerialization['rank'] as int,
      changeType: jsonSerialization['changeType'] as String,
    );
  }

  int memeId;

  String storageUrl;

  String? thumbnailUrl;

  int usageCount;

  int rank;

  String changeType;

  /// Returns a shallow copy of this [TrendingUpdate]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  TrendingUpdate copyWith({
    int? memeId,
    String? storageUrl,
    String? thumbnailUrl,
    int? usageCount,
    int? rank,
    String? changeType,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'TrendingUpdate',
      'memeId': memeId,
      'storageUrl': storageUrl,
      if (thumbnailUrl != null) 'thumbnailUrl': thumbnailUrl,
      'usageCount': usageCount,
      'rank': rank,
      'changeType': changeType,
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'TrendingUpdate',
      'memeId': memeId,
      'storageUrl': storageUrl,
      if (thumbnailUrl != null) 'thumbnailUrl': thumbnailUrl,
      'usageCount': usageCount,
      'rank': rank,
      'changeType': changeType,
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _TrendingUpdateImpl extends TrendingUpdate {
  _TrendingUpdateImpl({
    required int memeId,
    required String storageUrl,
    String? thumbnailUrl,
    required int usageCount,
    required int rank,
    required String changeType,
  }) : super._(
         memeId: memeId,
         storageUrl: storageUrl,
         thumbnailUrl: thumbnailUrl,
         usageCount: usageCount,
         rank: rank,
         changeType: changeType,
       );

  /// Returns a shallow copy of this [TrendingUpdate]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  TrendingUpdate copyWith({
    int? memeId,
    String? storageUrl,
    Object? thumbnailUrl = _Undefined,
    int? usageCount,
    int? rank,
    String? changeType,
  }) {
    return TrendingUpdate(
      memeId: memeId ?? this.memeId,
      storageUrl: storageUrl ?? this.storageUrl,
      thumbnailUrl: thumbnailUrl is String? ? thumbnailUrl : this.thumbnailUrl,
      usageCount: usageCount ?? this.usageCount,
      rank: rank ?? this.rank,
      changeType: changeType ?? this.changeType,
    );
  }
}
