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

/// MemeHub Protocol - Collection Meme Junction
abstract class CollectionMeme implements _i1.SerializableModel {
  CollectionMeme._({
    this.id,
    required this.collectionId,
    required this.memeId,
    required this.addedAt,
  });

  factory CollectionMeme({
    int? id,
    required int collectionId,
    required int memeId,
    required DateTime addedAt,
  }) = _CollectionMemeImpl;

  factory CollectionMeme.fromJson(Map<String, dynamic> jsonSerialization) {
    return CollectionMeme(
      id: jsonSerialization['id'] as int?,
      collectionId: jsonSerialization['collectionId'] as int,
      memeId: jsonSerialization['memeId'] as int,
      addedAt: _i1.DateTimeJsonExtension.fromJson(jsonSerialization['addedAt']),
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  int collectionId;

  int memeId;

  DateTime addedAt;

  /// Returns a shallow copy of this [CollectionMeme]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  CollectionMeme copyWith({
    int? id,
    int? collectionId,
    int? memeId,
    DateTime? addedAt,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'CollectionMeme',
      if (id != null) 'id': id,
      'collectionId': collectionId,
      'memeId': memeId,
      'addedAt': addedAt.toJson(),
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _CollectionMemeImpl extends CollectionMeme {
  _CollectionMemeImpl({
    int? id,
    required int collectionId,
    required int memeId,
    required DateTime addedAt,
  }) : super._(
         id: id,
         collectionId: collectionId,
         memeId: memeId,
         addedAt: addedAt,
       );

  /// Returns a shallow copy of this [CollectionMeme]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  CollectionMeme copyWith({
    Object? id = _Undefined,
    int? collectionId,
    int? memeId,
    DateTime? addedAt,
  }) {
    return CollectionMeme(
      id: id is int? ? id : this.id,
      collectionId: collectionId ?? this.collectionId,
      memeId: memeId ?? this.memeId,
      addedAt: addedAt ?? this.addedAt,
    );
  }
}
