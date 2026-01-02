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
import 'package:memehub_server/src/generated/protocol.dart' as _i2;

/// MemeHub Protocol - Meme Model
abstract class Meme implements _i1.TableRow<int?>, _i1.ProtocolSerialization {
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

  static final t = MemeTable();

  static const db = MemeRepository._();

  @override
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

  @override
  _i1.Table<int?> get table => t;

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
  Map<String, dynamic> toJsonForProtocol() {
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

  static MemeInclude include() {
    return MemeInclude._();
  }

  static MemeIncludeList includeList({
    _i1.WhereExpressionBuilder<MemeTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<MemeTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<MemeTable>? orderByList,
    MemeInclude? include,
  }) {
    return MemeIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(Meme.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(Meme.t),
      include: include,
    );
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

class MemeUpdateTable extends _i1.UpdateTable<MemeTable> {
  MemeUpdateTable(super.table);

  _i1.ColumnValue<int, int> userId(int value) => _i1.ColumnValue(
    table.userId,
    value,
  );

  _i1.ColumnValue<String, String> storageUrl(String value) => _i1.ColumnValue(
    table.storageUrl,
    value,
  );

  _i1.ColumnValue<String, String> thumbnailUrl(String? value) =>
      _i1.ColumnValue(
        table.thumbnailUrl,
        value,
      );

  _i1.ColumnValue<String, String> fileType(String value) => _i1.ColumnValue(
    table.fileType,
    value,
  );

  _i1.ColumnValue<int, int> fileSize(int value) => _i1.ColumnValue(
    table.fileSize,
    value,
  );

  _i1.ColumnValue<int, int> width(int value) => _i1.ColumnValue(
    table.width,
    value,
  );

  _i1.ColumnValue<int, int> height(int value) => _i1.ColumnValue(
    table.height,
    value,
  );

  _i1.ColumnValue<String, String> ocrText(String? value) => _i1.ColumnValue(
    table.ocrText,
    value,
  );

  _i1.ColumnValue<String, String> aiDescription(String? value) =>
      _i1.ColumnValue(
        table.aiDescription,
        value,
      );

  _i1.ColumnValue<List<String>, List<String>> tags(List<String>? value) =>
      _i1.ColumnValue(
        table.tags,
        value,
      );

  _i1.ColumnValue<bool, bool> isNsfw(bool value) => _i1.ColumnValue(
    table.isNsfw,
    value,
  );

  _i1.ColumnValue<String, String> status(String value) => _i1.ColumnValue(
    table.status,
    value,
  );

  _i1.ColumnValue<int, int> usageCount(int value) => _i1.ColumnValue(
    table.usageCount,
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

class MemeTable extends _i1.Table<int?> {
  MemeTable({super.tableRelation}) : super(tableName: 'memes') {
    updateTable = MemeUpdateTable(this);
    userId = _i1.ColumnInt(
      'userId',
      this,
    );
    storageUrl = _i1.ColumnString(
      'storageUrl',
      this,
    );
    thumbnailUrl = _i1.ColumnString(
      'thumbnailUrl',
      this,
    );
    fileType = _i1.ColumnString(
      'fileType',
      this,
    );
    fileSize = _i1.ColumnInt(
      'fileSize',
      this,
    );
    width = _i1.ColumnInt(
      'width',
      this,
    );
    height = _i1.ColumnInt(
      'height',
      this,
    );
    ocrText = _i1.ColumnString(
      'ocrText',
      this,
    );
    aiDescription = _i1.ColumnString(
      'aiDescription',
      this,
    );
    tags = _i1.ColumnSerializable<List<String>>(
      'tags',
      this,
    );
    isNsfw = _i1.ColumnBool(
      'isNsfw',
      this,
    );
    status = _i1.ColumnString(
      'status',
      this,
    );
    usageCount = _i1.ColumnInt(
      'usageCount',
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

  late final MemeUpdateTable updateTable;

  /// User who uploaded this meme
  late final _i1.ColumnInt userId;

  /// Storage paths
  late final _i1.ColumnString storageUrl;

  late final _i1.ColumnString thumbnailUrl;

  /// File metadata
  late final _i1.ColumnString fileType;

  late final _i1.ColumnInt fileSize;

  late final _i1.ColumnInt width;

  late final _i1.ColumnInt height;

  /// AI-generated content
  late final _i1.ColumnString ocrText;

  late final _i1.ColumnString aiDescription;

  late final _i1.ColumnSerializable<List<String>> tags;

  /// Content moderation
  late final _i1.ColumnBool isNsfw;

  late final _i1.ColumnString status;

  /// Usage tracking
  late final _i1.ColumnInt usageCount;

  /// Timestamps
  late final _i1.ColumnDateTime createdAt;

  late final _i1.ColumnDateTime updatedAt;

  @override
  List<_i1.Column> get columns => [
    id,
    userId,
    storageUrl,
    thumbnailUrl,
    fileType,
    fileSize,
    width,
    height,
    ocrText,
    aiDescription,
    tags,
    isNsfw,
    status,
    usageCount,
    createdAt,
    updatedAt,
  ];
}

class MemeInclude extends _i1.IncludeObject {
  MemeInclude._();

  @override
  Map<String, _i1.Include?> get includes => {};

  @override
  _i1.Table<int?> get table => Meme.t;
}

class MemeIncludeList extends _i1.IncludeList {
  MemeIncludeList._({
    _i1.WhereExpressionBuilder<MemeTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(Meme.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table<int?> get table => Meme.t;
}

class MemeRepository {
  const MemeRepository._();

  /// Returns a list of [Meme]s matching the given query parameters.
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
  Future<List<Meme>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<MemeTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<MemeTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<MemeTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.db.find<Meme>(
      where: where?.call(Meme.t),
      orderBy: orderBy?.call(Meme.t),
      orderByList: orderByList?.call(Meme.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
    );
  }

  /// Returns the first matching [Meme] matching the given query parameters.
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
  Future<Meme?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<MemeTable>? where,
    int? offset,
    _i1.OrderByBuilder<MemeTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<MemeTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.db.findFirstRow<Meme>(
      where: where?.call(Meme.t),
      orderBy: orderBy?.call(Meme.t),
      orderByList: orderByList?.call(Meme.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
    );
  }

  /// Finds a single [Meme] by its [id] or null if no such row exists.
  Future<Meme?> findById(
    _i1.Session session,
    int id, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.findById<Meme>(
      id,
      transaction: transaction,
    );
  }

  /// Inserts all [Meme]s in the list and returns the inserted rows.
  ///
  /// The returned [Meme]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// insert, none of the rows will be inserted.
  Future<List<Meme>> insert(
    _i1.Session session,
    List<Meme> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<Meme>(
      rows,
      transaction: transaction,
    );
  }

  /// Inserts a single [Meme] and returns the inserted row.
  ///
  /// The returned [Meme] will have its `id` field set.
  Future<Meme> insertRow(
    _i1.Session session,
    Meme row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<Meme>(
      row,
      transaction: transaction,
    );
  }

  /// Updates all [Meme]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  Future<List<Meme>> update(
    _i1.Session session,
    List<Meme> rows, {
    _i1.ColumnSelections<MemeTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<Meme>(
      rows,
      columns: columns?.call(Meme.t),
      transaction: transaction,
    );
  }

  /// Updates a single [Meme]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<Meme> updateRow(
    _i1.Session session,
    Meme row, {
    _i1.ColumnSelections<MemeTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<Meme>(
      row,
      columns: columns?.call(Meme.t),
      transaction: transaction,
    );
  }

  /// Updates a single [Meme] by its [id] with the specified [columnValues].
  /// Returns the updated row or null if no row with the given id exists.
  Future<Meme?> updateById(
    _i1.Session session,
    int id, {
    required _i1.ColumnValueListBuilder<MemeUpdateTable> columnValues,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateById<Meme>(
      id,
      columnValues: columnValues(Meme.t.updateTable),
      transaction: transaction,
    );
  }

  /// Updates all [Meme]s matching the [where] expression with the specified [columnValues].
  /// Returns the list of updated rows.
  Future<List<Meme>> updateWhere(
    _i1.Session session, {
    required _i1.ColumnValueListBuilder<MemeUpdateTable> columnValues,
    required _i1.WhereExpressionBuilder<MemeTable> where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<MemeTable>? orderBy,
    _i1.OrderByListBuilder<MemeTable>? orderByList,
    bool orderDescending = false,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateWhere<Meme>(
      columnValues: columnValues(Meme.t.updateTable),
      where: where(Meme.t),
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(Meme.t),
      orderByList: orderByList?.call(Meme.t),
      orderDescending: orderDescending,
      transaction: transaction,
    );
  }

  /// Deletes all [Meme]s in the list and returns the deleted rows.
  /// This is an atomic operation, meaning that if one of the rows fail to
  /// be deleted, none of the rows will be deleted.
  Future<List<Meme>> delete(
    _i1.Session session,
    List<Meme> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<Meme>(
      rows,
      transaction: transaction,
    );
  }

  /// Deletes a single [Meme].
  Future<Meme> deleteRow(
    _i1.Session session,
    Meme row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<Meme>(
      row,
      transaction: transaction,
    );
  }

  /// Deletes all rows matching the [where] expression.
  Future<List<Meme>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<MemeTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<Meme>(
      where: where(Meme.t),
      transaction: transaction,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<MemeTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<Meme>(
      where: where?.call(Meme.t),
      limit: limit,
      transaction: transaction,
    );
  }
}
