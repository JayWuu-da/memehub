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

/// Meme Process Request DTO for Future Call
abstract class MemeProcessRequest
    implements _i1.SerializableModel, _i1.ProtocolSerialization {
  MemeProcessRequest._({
    required this.memeId,
    required this.storagePath,
  });

  factory MemeProcessRequest({
    required int memeId,
    required String storagePath,
  }) = _MemeProcessRequestImpl;

  factory MemeProcessRequest.fromJson(Map<String, dynamic> jsonSerialization) {
    return MemeProcessRequest(
      memeId: jsonSerialization['memeId'] as int,
      storagePath: jsonSerialization['storagePath'] as String,
    );
  }

  int memeId;

  String storagePath;

  /// Returns a shallow copy of this [MemeProcessRequest]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  MemeProcessRequest copyWith({
    int? memeId,
    String? storagePath,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'MemeProcessRequest',
      'memeId': memeId,
      'storagePath': storagePath,
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'MemeProcessRequest',
      'memeId': memeId,
      'storagePath': storagePath,
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _MemeProcessRequestImpl extends MemeProcessRequest {
  _MemeProcessRequestImpl({
    required int memeId,
    required String storagePath,
  }) : super._(
         memeId: memeId,
         storagePath: storagePath,
       );

  /// Returns a shallow copy of this [MemeProcessRequest]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  MemeProcessRequest copyWith({
    int? memeId,
    String? storagePath,
  }) {
    return MemeProcessRequest(
      memeId: memeId ?? this.memeId,
      storagePath: storagePath ?? this.storagePath,
    );
  }
}
