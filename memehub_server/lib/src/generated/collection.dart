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

/// MemeHub Protocol - Collection Model
abstract class Collection
    implements _i1.TableRow<int?>, _i1.ProtocolSerialization {
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

  static final t = CollectionTable();

  static const db = CollectionRepository._();

  @override
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

  @override
  _i1.Table<int?> get table => t;

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
  Map<String, dynamic> toJsonForProtocol() {
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

  static CollectionInclude include() {
    return CollectionInclude._();
  }

  static CollectionIncludeList includeList({
    _i1.WhereExpressionBuilder<CollectionTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<CollectionTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<CollectionTable>? orderByList,
    CollectionInclude? include,
  }) {
    return CollectionIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(Collection.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(Collection.t),
      include: include,
    );
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

class CollectionUpdateTable extends _i1.UpdateTable<CollectionTable> {
  CollectionUpdateTable(super.table);

  _i1.ColumnValue<int, int> userId(int value) => _i1.ColumnValue(
    table.userId,
    value,
  );

  _i1.ColumnValue<String, String> name(String value) => _i1.ColumnValue(
    table.name,
    value,
  );

  _i1.ColumnValue<String, String> description(String? value) => _i1.ColumnValue(
    table.description,
    value,
  );

  _i1.ColumnValue<int, int> coverMemeId(int? value) => _i1.ColumnValue(
    table.coverMemeId,
    value,
  );

  _i1.ColumnValue<int, int> memeCount(int value) => _i1.ColumnValue(
    table.memeCount,
    value,
  );

  _i1.ColumnValue<DateTime, DateTime> createdAt(DateTime value) =>
      _i1.ColumnValue(
        table.createdAt,
        value,
      );

  _i1.ColumnValue<DateTime, DateTime> updatedAt(DateTime value) =>
      _i1.ColumnValue(
        table.updatedAt,
        value,
      );
}

class CollectionTable extends _i1.Table<int?> {
  CollectionTable({super.tableRelation}) : super(tableName: 'collections') {
    updateTable = CollectionUpdateTable(this);
    userId = _i1.ColumnInt(
      'userId',
      this,
    );
    name = _i1.ColumnString(
      'name',
      this,
    );
    description = _i1.ColumnString(
      'description',
      this,
    );
    coverMemeId = _i1.ColumnInt(
      'coverMemeId',
      this,
    );
    memeCount = _i1.ColumnInt(
      'memeCount',
      this,
    );
    createdAt = _i1.ColumnDateTime(
      'createdAt',
      this,
    );
    updatedAt = _i1.ColumnDateTime(
      'updatedAt',
      this,
    );
  }

  late final CollectionUpdateTable updateTable;

  /// Owner
  late final _i1.ColumnInt userId;

  /// Collection info
  late final _i1.ColumnString name;

  late final _i1.ColumnString description;

  late final _i1.ColumnInt coverMemeId;

  late final _i1.ColumnInt memeCount;

  /// Timestamps
  late final _i1.ColumnDateTime createdAt;

  late final _i1.ColumnDateTime updatedAt;

  @override
  List<_i1.Column> get columns => [
    id,
    userId,
    name,
    description,
    coverMemeId,
    memeCount,
    createdAt,
    updatedAt,
  ];
}

class CollectionInclude extends _i1.IncludeObject {
  CollectionInclude._();

  @override
  Map<String, _i1.Include?> get includes => {};

  @override
  _i1.Table<int?> get table => Collection.t;
}

class CollectionIncludeList extends _i1.IncludeList {
  CollectionIncludeList._({
    _i1.WhereExpressionBuilder<CollectionTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(Collection.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table<int?> get table => Collection.t;
}

class CollectionRepository {
  const CollectionRepository._();

  /// Returns a list of [Collection]s matching the given query parameters.
  ///
  /// Use [where] to specify which items to include in the return value.
  /// If none is specified, all items will be returned.
  ///
  /// To specify the order of the items use [orderBy] or [orderByList]
  /// when sorting by multiple columns.
  ///
  /// The maximum number of items can be set by [limit]. If no limit is set,
  /// all items matching the query will be returned.
  ///
  /// [offset] defines how many items to skip, after which [limit] (or all)
  /// items are read from the database.
  ///
  /// ```dart
  /// var persons = await Persons.db.find(
  ///   session,
  ///   where: (t) => t.lastName.equals('Jones'),
  ///   orderBy: (t) => t.firstName,
  ///   limit: 100,
  /// );
  /// ```
  Future<List<Collection>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<CollectionTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<CollectionTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<CollectionTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.db.find<Collection>(
      where: where?.call(Collection.t),
      orderBy: orderBy?.call(Collection.t),
      orderByList: orderByList?.call(Collection.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
    );
  }

  /// Returns the first matching [Collection] matching the given query parameters.
  ///
  /// Use [where] to specify which items to include in the return value.
  /// If none is specified, all items will be returned.
  ///
  /// To specify the order use [orderBy] or [orderByList]
  /// when sorting by multiple columns.
  ///
  /// [offset] defines how many items to skip, after which the next one will be picked.
  ///
  /// ```dart
  /// var youngestPerson = await Persons.db.findFirstRow(
  ///   session,
  ///   where: (t) => t.lastName.equals('Jones'),
  ///   orderBy: (t) => t.age,
  /// );
  /// ```
  Future<Collection?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<CollectionTable>? where,
    int? offset,
    _i1.OrderByBuilder<CollectionTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<CollectionTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.db.findFirstRow<Collection>(
      where: where?.call(Collection.t),
      orderBy: orderBy?.call(Collection.t),
      orderByList: orderByList?.call(Collection.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
    );
  }

  /// Finds a single [Collection] by its [id] or null if no such row exists.
  Future<Collection?> findById(
    _i1.Session session,
    int id, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.findById<Collection>(
      id,
      transaction: transaction,
    );
  }

  /// Inserts all [Collection]s in the list and returns the inserted rows.
  ///
  /// The returned [Collection]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// insert, none of the rows will be inserted.
  Future<List<Collection>> insert(
    _i1.Session session,
    List<Collection> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<Collection>(
      rows,
      transaction: transaction,
    );
  }

  /// Inserts a single [Collection] and returns the inserted row.
  ///
  /// The returned [Collection] will have its `id` field set.
  Future<Collection> insertRow(
    _i1.Session session,
    Collection row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<Collection>(
      row,
      transaction: transaction,
    );
  }

  /// Updates all [Collection]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  Future<List<Collection>> update(
    _i1.Session session,
    List<Collection> rows, {
    _i1.ColumnSelections<CollectionTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<Collection>(
      rows,
      columns: columns?.call(Collection.t),
      transaction: transaction,
    );
  }

  /// Updates a single [Collection]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<Collection> updateRow(
    _i1.Session session,
    Collection row, {
    _i1.ColumnSelections<CollectionTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<Collection>(
      row,
      columns: columns?.call(Collection.t),
      transaction: transaction,
    );
  }

  /// Updates a single [Collection] by its [id] with the specified [columnValues].
  /// Returns the updated row or null if no row with the given id exists.
  Future<Collection?> updateById(
    _i1.Session session,
    int id, {
    required _i1.ColumnValueListBuilder<CollectionUpdateTable> columnValues,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateById<Collection>(
      id,
      columnValues: columnValues(Collection.t.updateTable),
      transaction: transaction,
    );
  }

  /// Updates all [Collection]s matching the [where] expression with the specified [columnValues].
  /// Returns the list of updated rows.
  Future<List<Collection>> updateWhere(
    _i1.Session session, {
    required _i1.ColumnValueListBuilder<CollectionUpdateTable> columnValues,
    required _i1.WhereExpressionBuilder<CollectionTable> where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<CollectionTable>? orderBy,
    _i1.OrderByListBuilder<CollectionTable>? orderByList,
    bool orderDescending = false,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateWhere<Collection>(
      columnValues: columnValues(Collection.t.updateTable),
      where: where(Collection.t),
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(Collection.t),
      orderByList: orderByList?.call(Collection.t),
      orderDescending: orderDescending,
      transaction: transaction,
    );
  }

  /// Deletes all [Collection]s in the list and returns the deleted rows.
  /// This is an atomic operation, meaning that if one of the rows fail to
  /// be deleted, none of the rows will be deleted.
  Future<List<Collection>> delete(
    _i1.Session session,
    List<Collection> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<Collection>(
      rows,
      transaction: transaction,
    );
  }

  /// Deletes a single [Collection].
  Future<Collection> deleteRow(
    _i1.Session session,
    Collection row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<Collection>(
      row,
      transaction: transaction,
    );
  }

  /// Deletes all rows matching the [where] expression.
  Future<List<Collection>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<CollectionTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<Collection>(
      where: where(Collection.t),
      transaction: transaction,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<CollectionTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<Collection>(
      where: where?.call(Collection.t),
      limit: limit,
      transaction: transaction,
    );
  }
}
