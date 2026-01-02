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

/// MemeHub Protocol - Meme Usage Tracking
abstract class MemeUsage
    implements _i1.TableRow<int?>, _i1.ProtocolSerialization {
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

  static final t = MemeUsageTable();

  static const db = MemeUsageRepository._();

  @override
  int? id;

  int memeId;

  int? userId;

  DateTime usedAt;

  String source;

  @override
  _i1.Table<int?> get table => t;

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
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'MemeUsage',
      if (id != null) 'id': id,
      'memeId': memeId,
      if (userId != null) 'userId': userId,
      'usedAt': usedAt.toJson(),
      'source': source,
    };
  }

  static MemeUsageInclude include() {
    return MemeUsageInclude._();
  }

  static MemeUsageIncludeList includeList({
    _i1.WhereExpressionBuilder<MemeUsageTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<MemeUsageTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<MemeUsageTable>? orderByList,
    MemeUsageInclude? include,
  }) {
    return MemeUsageIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(MemeUsage.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(MemeUsage.t),
      include: include,
    );
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

class MemeUsageUpdateTable extends _i1.UpdateTable<MemeUsageTable> {
  MemeUsageUpdateTable(super.table);

  _i1.ColumnValue<int, int> memeId(int value) => _i1.ColumnValue(
    table.memeId,
    value,
  );

  _i1.ColumnValue<int, int> userId(int? value) => _i1.ColumnValue(
    table.userId,
    value,
  );

  _i1.ColumnValue<DateTime, DateTime> usedAt(DateTime value) => _i1.ColumnValue(
    table.usedAt,
    value,
  );

  _i1.ColumnValue<String, String> source(String value) => _i1.ColumnValue(
    table.source,
    value,
  );
}

class MemeUsageTable extends _i1.Table<int?> {
  MemeUsageTable({super.tableRelation}) : super(tableName: 'meme_usages') {
    updateTable = MemeUsageUpdateTable(this);
    memeId = _i1.ColumnInt(
      'memeId',
      this,
    );
    userId = _i1.ColumnInt(
      'userId',
      this,
    );
    usedAt = _i1.ColumnDateTime(
      'usedAt',
      this,
    );
    source = _i1.ColumnString(
      'source',
      this,
    );
  }

  late final MemeUsageUpdateTable updateTable;

  late final _i1.ColumnInt memeId;

  late final _i1.ColumnInt userId;

  late final _i1.ColumnDateTime usedAt;

  late final _i1.ColumnString source;

  @override
  List<_i1.Column> get columns => [
    id,
    memeId,
    userId,
    usedAt,
    source,
  ];
}

class MemeUsageInclude extends _i1.IncludeObject {
  MemeUsageInclude._();

  @override
  Map<String, _i1.Include?> get includes => {};

  @override
  _i1.Table<int?> get table => MemeUsage.t;
}

class MemeUsageIncludeList extends _i1.IncludeList {
  MemeUsageIncludeList._({
    _i1.WhereExpressionBuilder<MemeUsageTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(MemeUsage.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table<int?> get table => MemeUsage.t;
}

class MemeUsageRepository {
  const MemeUsageRepository._();

  /// Returns a list of [MemeUsage]s matching the given query parameters.
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
  Future<List<MemeUsage>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<MemeUsageTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<MemeUsageTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<MemeUsageTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.db.find<MemeUsage>(
      where: where?.call(MemeUsage.t),
      orderBy: orderBy?.call(MemeUsage.t),
      orderByList: orderByList?.call(MemeUsage.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
    );
  }

  /// Returns the first matching [MemeUsage] matching the given query parameters.
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
  Future<MemeUsage?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<MemeUsageTable>? where,
    int? offset,
    _i1.OrderByBuilder<MemeUsageTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<MemeUsageTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.db.findFirstRow<MemeUsage>(
      where: where?.call(MemeUsage.t),
      orderBy: orderBy?.call(MemeUsage.t),
      orderByList: orderByList?.call(MemeUsage.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
    );
  }

  /// Finds a single [MemeUsage] by its [id] or null if no such row exists.
  Future<MemeUsage?> findById(
    _i1.Session session,
    int id, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.findById<MemeUsage>(
      id,
      transaction: transaction,
    );
  }

  /// Inserts all [MemeUsage]s in the list and returns the inserted rows.
  ///
  /// The returned [MemeUsage]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// insert, none of the rows will be inserted.
  Future<List<MemeUsage>> insert(
    _i1.Session session,
    List<MemeUsage> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<MemeUsage>(
      rows,
      transaction: transaction,
    );
  }

  /// Inserts a single [MemeUsage] and returns the inserted row.
  ///
  /// The returned [MemeUsage] will have its `id` field set.
  Future<MemeUsage> insertRow(
    _i1.Session session,
    MemeUsage row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<MemeUsage>(
      row,
      transaction: transaction,
    );
  }

  /// Updates all [MemeUsage]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  Future<List<MemeUsage>> update(
    _i1.Session session,
    List<MemeUsage> rows, {
    _i1.ColumnSelections<MemeUsageTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<MemeUsage>(
      rows,
      columns: columns?.call(MemeUsage.t),
      transaction: transaction,
    );
  }

  /// Updates a single [MemeUsage]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<MemeUsage> updateRow(
    _i1.Session session,
    MemeUsage row, {
    _i1.ColumnSelections<MemeUsageTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<MemeUsage>(
      row,
      columns: columns?.call(MemeUsage.t),
      transaction: transaction,
    );
  }

  /// Updates a single [MemeUsage] by its [id] with the specified [columnValues].
  /// Returns the updated row or null if no row with the given id exists.
  Future<MemeUsage?> updateById(
    _i1.Session session,
    int id, {
    required _i1.ColumnValueListBuilder<MemeUsageUpdateTable> columnValues,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateById<MemeUsage>(
      id,
      columnValues: columnValues(MemeUsage.t.updateTable),
      transaction: transaction,
    );
  }

  /// Updates all [MemeUsage]s matching the [where] expression with the specified [columnValues].
  /// Returns the list of updated rows.
  Future<List<MemeUsage>> updateWhere(
    _i1.Session session, {
    required _i1.ColumnValueListBuilder<MemeUsageUpdateTable> columnValues,
    required _i1.WhereExpressionBuilder<MemeUsageTable> where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<MemeUsageTable>? orderBy,
    _i1.OrderByListBuilder<MemeUsageTable>? orderByList,
    bool orderDescending = false,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateWhere<MemeUsage>(
      columnValues: columnValues(MemeUsage.t.updateTable),
      where: where(MemeUsage.t),
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(MemeUsage.t),
      orderByList: orderByList?.call(MemeUsage.t),
      orderDescending: orderDescending,
      transaction: transaction,
    );
  }

  /// Deletes all [MemeUsage]s in the list and returns the deleted rows.
  /// This is an atomic operation, meaning that if one of the rows fail to
  /// be deleted, none of the rows will be deleted.
  Future<List<MemeUsage>> delete(
    _i1.Session session,
    List<MemeUsage> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<MemeUsage>(
      rows,
      transaction: transaction,
    );
  }

  /// Deletes a single [MemeUsage].
  Future<MemeUsage> deleteRow(
    _i1.Session session,
    MemeUsage row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<MemeUsage>(
      row,
      transaction: transaction,
    );
  }

  /// Deletes all rows matching the [where] expression.
  Future<List<MemeUsage>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<MemeUsageTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<MemeUsage>(
      where: where(MemeUsage.t),
      transaction: transaction,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<MemeUsageTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<MemeUsage>(
      where: where?.call(MemeUsage.t),
      limit: limit,
      transaction: transaction,
    );
  }
}
