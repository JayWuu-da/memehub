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

/// MemeHub Protocol - Collection Model
abstract class Collection implements _i1.SerializableModel {
  Collection._({
    this.id,
    required this.userId,
    required this.name,
    this.description,
    this.coverMemeId,
    required this.memeCount,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Collection({
    int? id,
    required int userId,
    required String name,
    String? description,
    int? coverMemeId,
    required int memeCount,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) = _CollectionImpl;

  factory Collection.fromJson(Map<String, dynamic> jsonSerialization) {
    return Collection(
      id: jsonSerialization['id'] as int?,
      userId: jsonSerialization['userId'] as int,
      name: jsonSerialization['name'] as String,
      description: jsonSerialization['description'] as String?,
      coverMemeId: jsonSerialization['coverMemeId'] as int?,
      memeCount: jsonSerialization['memeCount'] as int,
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

  /// Owner
  int userId;

  /// Collection info
  String name;

  String? description;

  int? coverMemeId;

  int memeCount;

  /// Timestamps
  DateTime createdAt;

  DateTime updatedAt;

  /// Returns a shallow copy of this [Collection]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  Collection copyWith({
    int? id,
    int? userId,
    String? name,
    String? description,
    int? coverMemeId,
    int? memeCount,
    DateTime? createdAt,
    DateTime? updatedAt,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'Collection',
      if (id != null) 'id': id,
      'userId': userId,
      'name': name,
      if (description != null) 'description': description,
      if (coverMemeId != null) 'coverMemeId': coverMemeId,
      'memeCount': memeCount,
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

class _CollectionImpl extends Collection {
  _CollectionImpl({
    int? id,
    required int userId,
    required String name,
    String? description,
    int? coverMemeId,
    required int memeCount,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) : super._(
         id: id,
         userId: userId,
         name: name,
         description: description,
         coverMemeId: coverMemeId,
         memeCount: memeCount,
         createdAt: createdAt,
         updatedAt: updatedAt,
       );

  /// Returns a shallow copy of this [Collection]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  Collection copyWith({
    Object? id = _Undefined,
    int? userId,
    String? name,
    Object? description = _Undefined,
    Object? coverMemeId = _Undefined,
    int? memeCount,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return Collection(
      id: id is int? ? id : this.id,
      userId: userId ?? this.userId,
      name: name ?? this.name,
      description: description is String? ? description : this.description,
      coverMemeId: coverMemeId is int? ? coverMemeId : this.coverMemeId,
      memeCount: memeCount ?? this.memeCount,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }
}
