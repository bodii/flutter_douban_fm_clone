import 'package:flutter_douban_fm_clone/database/db_base.dart';
import 'package:flutter_douban_fm_clone/models/user_model.dart';

class UserDb extends DbBase<User> {
  @override
  String tableName = 'user';

  @override
  String dbName = 'user_database.db';

  @override
  String getCreateTableSql() {
    return '''
        create table $tableName(
          id integer primary key autoincrement not null,
          username varchar(50),
          nickname varchar(50),
          avatar text,
          phone varchar(30),
          token varchar(150),
          signUpDate text,
          signInLateDate text
        );
        ''';
  }

  Future<User?> queryOne(int userId) async {
    List<Map<String, Object?>>? data =
        await super.query(where: 'id = ?', whereArgs: [userId], limit: 1);

    return data != null && data.isNotEmpty ? User.fromJson(data.first) : null;
  }

  Future<User?> signIn(String username) async {
    List<Map<String, Object?>>? data = await super
        .query(where: 'username = ?', whereArgs: [username], limit: 1);

    return data != null && data.isNotEmpty ? User.fromJson(data.first) : null;
  }

  Future<bool> signInSuccessToRecord(int userId) async {
    int row = await super.update(
      {'signInLateDate': DateTime.now().toString()},
      where: 'id = ?',
      whereArgs: [userId],
    );
    return row > 0;
  }
}
