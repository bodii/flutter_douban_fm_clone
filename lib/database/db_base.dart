import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DbBase<T> {
  Database? database;
  final String tableName = '';
  final String dbName = '';

  String getCreateTableSql() => '';

  Future<String> getDbPath() async {
    final String dbPath = join(await getDatabasesPath(), dbName);
    return dbPath;
  }

  Future<bool> open() async {
    WidgetsFlutterBinding.ensureInitialized();

    final String dbPath = await getDbPath();

    database = await openDatabase(
      dbPath,
      onCreate: (db, version) {
        log(getCreateTableSql());
        return db.execute(getCreateTableSql());
      },
      version: 1,
    );

    return database != null && database!.isOpen;
  }

  Future<void> createTable() async {
    database?.execute(getCreateTableSql());
  }

  Future<void> deleteDb() async {
    final String dbPath = await getDbPath();
    await deleteDatabase(dbPath);
  }

  Future<void> deleteTable() async {
    database?.execute('''
      drop table $tableName;
    ''');
  }

  Future<void> truncateAllData() async {
    database?.execute('''
      truncate table $tableName;
    ''');
  }

  // Future<void> _execute(Database db, int version, String sql,
  //     [List<Object?>? arguments]) async {
  //   await db.execute(sql, arguments);
  // }

  Future<int> insert(
      {required Map<String, dynamic> data, List<String>? excludeColums}) async {
    await open();

    data.updateAll((key, value) => value ?? '');

    if (excludeColums != null) {
      for (String colum in excludeColums) {
        if (data[colum] != null) {
          data.remove(colum);
        }
      }
    }

    int? rows = await database?.insert(
      tableName,
      data,
      conflictAlgorithm: ConflictAlgorithm.replace,
    );

    return rows ?? 0;
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
    await open();

    List<Map<String, Object?>>? maps = await database?.query(
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
    await open();

    int? rows = await database?.update(
      tableName,
      values,
      where: where,
      whereArgs: whereArgs,
    );

    return rows ?? 0;
  }

  Future<int> delete({
    String? where,
    List<Object?>? whereArgs,
  }) async {
    await open();

    int? rows = await database?.delete(
      tableName,
      where: where,
      whereArgs: whereArgs,
    );

    return rows ?? 0;
  }
}
