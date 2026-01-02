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

/// MemeHub Protocol - Collection Meme Junction
abstract class CollectionMeme
    implements _i1.TableRow<int?>, _i1.ProtocolSerialization {
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

  static final t = CollectionMemeTable();

  static const db = CollectionMemeRepository._();

  @override
  int? id;

  int collectionId;

  int memeId;

  DateTime addedAt;

  @override
  _i1.Table<int?> get table => t;

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
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'CollectionMeme',
      if (id != null) 'id': id,
      'collectionId': collectionId,
      'memeId': memeId,
      'addedAt': addedAt.toJson(),
    };
  }

  static CollectionMemeInclude include() {
    return CollectionMemeInclude._();
  }

  static CollectionMemeIncludeList includeList({
    _i1.WhereExpressionBuilder<CollectionMemeTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<CollectionMemeTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<CollectionMemeTable>? orderByList,
    CollectionMemeInclude? include,
  }) {
    return CollectionMemeIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(CollectionMeme.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(CollectionMeme.t),
      include: include,
    );
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

class CollectionMemeUpdateTable extends _i1.UpdateTable<CollectionMemeTable> {
  CollectionMemeUpdateTable(super.table);

  _i1.ColumnValue<int, int> collectionId(int value) => _i1.ColumnValue(
    table.collectionId,
    value,
  );

  _i1.ColumnValue<int, int> memeId(int value) => _i1.ColumnValue(
    table.memeId,
    value,
  );

  _i1.ColumnValue<DateTime, DateTime> addedAt(DateTime value) =>
      _i1.ColumnValue(
        table.addedAt,
        value,
      );
}

class CollectionMemeTable extends _i1.Table<int?> {
  CollectionMemeTable({super.tableRelation})
    : super(tableName: 'collection_memes') {
    updateTable = CollectionMemeUpdateTable(this);
    collectionId = _i1.ColumnInt(
      'collectionId',
      this,
    );
    memeId = _i1.ColumnInt(
      'memeId',
      this,
    );
    addedAt = _i1.ColumnDateTime(
      'addedAt',
      this,
    );
  }

  late final CollectionMemeUpdateTable updateTable;

  late final _i1.ColumnInt collectionId;

  late final _i1.ColumnInt memeId;

  late final _i1.ColumnDateTime addedAt;

  @override
  List<_i1.Column> get columns => [
    id,
    collectionId,
    memeId,
    addedAt,
  ];
}

class CollectionMemeInclude extends _i1.IncludeObject {
  CollectionMemeInclude._();

  @override
  Map<String, _i1.Include?> get includes => {};

  @override
  _i1.Table<int?> get table => CollectionMeme.t;
}

class CollectionMemeIncludeList extends _i1.IncludeList {
  CollectionMemeIncludeList._({
    _i1.WhereExpressionBuilder<CollectionMemeTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(CollectionMeme.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table<int?> get table => CollectionMeme.t;
}

class CollectionMemeRepository {
  const CollectionMemeRepository._();

  /// Returns a list of [CollectionMeme]s matching the given query parameters.
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
  Future<List<CollectionMeme>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<CollectionMemeTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<CollectionMemeTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<CollectionMemeTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.db.find<CollectionMeme>(
      where: where?.call(CollectionMeme.t),
      orderBy: orderBy?.call(CollectionMeme.t),
      orderByList: orderByList?.call(CollectionMeme.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
    );
  }

  /// Returns the first matching [CollectionMeme] matching the given query parameters.
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
  Future<CollectionMeme?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<CollectionMemeTable>? where,
    int? offset,
    _i1.OrderByBuilder<CollectionMemeTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<CollectionMemeTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.db.findFirstRow<CollectionMeme>(
      where: where?.call(CollectionMeme.t),
      orderBy: orderBy?.call(CollectionMeme.t),
      orderByList: orderByList?.call(CollectionMeme.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
    );
  }

  /// Finds a single [CollectionMeme] by its [id] or null if no such row exists.
  Future<CollectionMeme?> findById(
    _i1.Session session,
    int id, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.findById<CollectionMeme>(
      id,
      transaction: transaction,
    );
  }

  /// Inserts all [CollectionMeme]s in the list and returns the inserted rows.
  ///
  /// The returned [CollectionMeme]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// insert, none of the rows will be inserted.
  Future<List<CollectionMeme>> insert(
    _i1.Session session,
    List<CollectionMeme> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<CollectionMeme>(
      rows,
      transaction: transaction,
    );
  }

  /// Inserts a single [CollectionMeme] and returns the inserted row.
  ///
  /// The returned [CollectionMeme] will have its `id` field set.
  Future<CollectionMeme> insertRow(
    _i1.Session session,
    CollectionMeme row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<CollectionMeme>(
      row,
      transaction: transaction,
    );
  }

  /// Updates all [CollectionMeme]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  Future<List<CollectionMeme>> update(
    _i1.Session session,
    List<CollectionMeme> rows, {
    _i1.ColumnSelections<CollectionMemeTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<CollectionMeme>(
      rows,
      columns: columns?.call(CollectionMeme.t),
      transaction: transaction,
    );
  }

  /// Updates a single [CollectionMeme]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<CollectionMeme> updateRow(
    _i1.Session session,
    CollectionMeme row, {
    _i1.ColumnSelections<CollectionMemeTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<CollectionMeme>(
      row,
      columns: columns?.call(CollectionMeme.t),
      transaction: transaction,
    );
  }

  /// Updates a single [CollectionMeme] by its [id] with the specified [columnValues].
  /// Returns the updated row or null if no row with the given id exists.
  Future<CollectionMeme?> updateById(
    _i1.Session session,
    int id, {
    required _i1.ColumnValueListBuilder<CollectionMemeUpdateTable> columnValues,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateById<CollectionMeme>(
      id,
      columnValues: columnValues(CollectionMeme.t.updateTable),
      transaction: transaction,
    );
  }

  /// Updates all [CollectionMeme]s matching the [where] expression with the specified [columnValues].
  /// Returns the list of updated rows.
  Future<List<CollectionMeme>> updateWhere(
    _i1.Session session, {
    required _i1.ColumnValueListBuilder<CollectionMemeUpdateTable> columnValues,
    required _i1.WhereExpressionBuilder<CollectionMemeTable> where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<CollectionMemeTable>? orderBy,
    _i1.OrderByListBuilder<CollectionMemeTable>? orderByList,
    bool orderDescending = false,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateWhere<CollectionMeme>(
      columnValues: columnValues(CollectionMeme.t.updateTable),
      where: where(CollectionMeme.t),
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(CollectionMeme.t),
      orderByList: orderByList?.call(CollectionMeme.t),
      orderDescending: orderDescending,
      transaction: transaction,
    );
  }

  /// Deletes all [CollectionMeme]s in the list and returns the deleted rows.
  /// This is an atomic operation, meaning that if one of the rows fail to
  /// be deleted, none of the rows will be deleted.
  Future<List<CollectionMeme>> delete(
    _i1.Session session,
    List<CollectionMeme> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<CollectionMeme>(
      rows,
      transaction: transaction,
    );
  }

  /// Deletes a single [CollectionMeme].
  Future<CollectionMeme> deleteRow(
    _i1.Session session,
    CollectionMeme row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<CollectionMeme>(
      row,
      transaction: transaction,
    );
  }

  /// Deletes all rows matching the [where] expression.
  Future<List<CollectionMeme>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<CollectionMemeTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<CollectionMeme>(
      where: where(CollectionMeme.t),
      transaction: transaction,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<CollectionMemeTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<CollectionMeme>(
      where: where?.call(CollectionMeme.t),
      limit: limit,
      transaction: transaction,
    );
  }
}
