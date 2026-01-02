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

/// Upload Description DTO
abstract class UploadDescription
    implements _i1.SerializableModel, _i1.ProtocolSerialization {
  UploadDescription._({
    required this.uploadUrl,
    required this.storagePath,
    required this.expiresAt,
  });

  factory UploadDescription({
    required String uploadUrl,
    required String storagePath,
    required DateTime expiresAt,
  }) = _UploadDescriptionImpl;

  factory UploadDescription.fromJson(Map<String, dynamic> jsonSerialization) {
    return UploadDescription(
      uploadUrl: jsonSerialization['uploadUrl'] as String,
      storagePath: jsonSerialization['storagePath'] as String,
      expiresAt: _i1.DateTimeJsonExtension.fromJson(
        jsonSerialization['expiresAt'],
      ),
    );
  }

  String uploadUrl;

  String storagePath;

  DateTime expiresAt;

  /// Returns a shallow copy of this [UploadDescription]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  UploadDescription copyWith({
    String? uploadUrl,
    String? storagePath,
    DateTime? expiresAt,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'UploadDescription',
      'uploadUrl': uploadUrl,
      'storagePath': storagePath,
      'expiresAt': expiresAt.toJson(),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'UploadDescription',
      'uploadUrl': uploadUrl,
      'storagePath': storagePath,
      'expiresAt': expiresAt.toJson(),
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _UploadDescriptionImpl extends UploadDescription {
  _UploadDescriptionImpl({
    required String uploadUrl,
    required String storagePath,
    required DateTime expiresAt,
  }) : super._(
         uploadUrl: uploadUrl,
         storagePath: storagePath,
         expiresAt: expiresAt,
       );

  /// Returns a shallow copy of this [UploadDescription]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  UploadDescription copyWith({
    String? uploadUrl,
    String? storagePath,
    DateTime? expiresAt,
  }) {
    return UploadDescription(
      uploadUrl: uploadUrl ?? this.uploadUrl,
      storagePath: storagePath ?? this.storagePath,
      expiresAt: expiresAt ?? this.expiresAt,
    );
  }
}
