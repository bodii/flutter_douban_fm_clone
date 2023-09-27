import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DbBase<T> {
  late Database db;
  final String tableName = '';
  final String dbName = '';
  bool _isOpen = false;

  String getCreateTableSql() => '';

  Future<String> getDbPath() async {
    final String dbPath = join(await getDatabasesPath(), dbName);
    return dbPath;
  }

  Future<bool> _open() async {
    log('exec sqlite open func: $tableName');
    WidgetsFlutterBinding.ensureInitialized();

    final String dbPath = await getDbPath();

    db = await openDatabase(
      dbPath,
      onCreate: (db, version) {
        log(getCreateTableSql(), name: 'exec create $tableName sql');
        return db.execute(getCreateTableSql());
      },
      version: 1,
    );

    _isOpen = db.isOpen;

    return _isOpen;
  }

  Future close() async {
    await hasOpen();

    db.close();
  }

  Future<bool> hasOpen() async {
    if (!_isOpen) {
      return await _open();
    }

    return true;
  }

  Future<void> createTable() async {
    db.execute(getCreateTableSql());
  }

  Future<void> deleteDb() async {
    final String dbPath = await getDbPath();
    await deleteDatabase(dbPath);
    _isOpen = false;
  }

  Future<void> truncateAllData() async {
    await hasOpen();

    await db.execute('''
      truncate table $tableName;
    ''');
  }

  Future<int> insert(
      {required Map<String, dynamic> data, List<String>? excludeColums}) async {
    data.updateAll((key, value) => value ?? '');

    if (excludeColums != null) {
      for (String colum in excludeColums) {
        if (data[colum] != null) {
          data.remove(colum);
        }
      }
    }

    await hasOpen();

    int rows = await db.insert(
      tableName,
      data,
      conflictAlgorithm: ConflictAlgorithm.replace,
    );

    return rows;
  }

  /// This is a helper to query a table and return the items found. All optional
  /// clauses and filters are formatted as SQL queries
  /// excluding the clauses' names.
  ///
  /// [distinct] when set to true ensures each row is unique.
  ///
  /// The [columns] list specify which columns to return. Passing null will
  /// return all columns, which is discouraged.
  ///
  /// [where] filters which rows to return. Passing null will return all rows
  /// for the given URL. '?'s are replaced with the items in the
  /// [whereArgs] field.
  ///
  /// [groupBy] declares how to group rows. Passing null
  /// will cause the rows to not be grouped.
  ///
  /// [having] declares which row groups to include in the cursor,
  /// if row grouping is being used. Passing null will cause
  /// all row groups to be included, and is required when row
  /// grouping is not being used.
  ///
  /// [orderBy] declares how to order the rows,
  /// Passing null will use the default sort order,
  /// which may be unordered.
  ///
  /// [limit] limits the number of rows returned by the query.
  ///
  /// [offset] specifies the starting index.
  ///
  /// ```
  ///  List<Map> maps = await db.query(tableTodo,
  ///      columns: ['columnId', 'columnDone', 'columnTitle'],
  ///      where: 'columnId = ?',
  ///      whereArgs: [id]);
  /// ```
  Future<List<Map<String, Object?>>?> query({
    bool? distinct,
    List<String>? columns,
    String? where,
    List<Object?>? whereArgs,
    String? groupBy,
    String? having,
    String? orderBy,
    int? limit,
    int? offset,
  }) async {
    await hasOpen();

    List<Map<String, Object?>> maps = await db.query(
      tableName,
      where: where,
      limit: limit,
      columns: columns,
      whereArgs: whereArgs,
      having: having,
      offset: offset,
      orderBy: orderBy,
      groupBy: groupBy,
      distinct: distinct,
    );

    return maps;
  }

  Future<int> update(
    Map<String, Object?> values, {
    String? where,
    List<Object?>? whereArgs,
  }) async {
    await hasOpen();

    int? rows = await db.update(
      tableName,
      values,
      where: where,
      whereArgs: whereArgs,
    );

    return rows;
  }

  Future<int> rawUpdate(
    String setValSql,
    List<dynamic> setValArgs, {
    String whereSql = '1=1',
    List<dynamic>? whereArgs,
  }) async {
    await hasOpen();

    int? rows = await db.rawUpdate(
      'UPDATE $tableName set $setValSql WHERE $whereSql;',
      [...setValArgs, ...whereArgs!],
    );

    return rows;
  }

  Future<int> delete({
    String? where,
    List<Object?>? whereArgs,
  }) async {
    await hasOpen();

    int? rows = await db.delete(
      tableName,
      where: where,
      whereArgs: whereArgs,
    );

    return rows;
  }
}
