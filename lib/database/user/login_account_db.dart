import 'dart:developer';

import 'package:flutter_douban_fm_clone/database/db_base.dart';
import 'package:flutter_douban_fm_clone/database/user/user_db.dart';
import 'package:flutter_douban_fm_clone/models/login_account_model.dart';
import 'package:flutter_douban_fm_clone/models/user_model.dart';

class LoginAccountDb extends DbBase<LoginAccount> {
  @override
  String tableName = 'login_account';

  @override
  String dbName = 'login_account_database.db';

  @override
  String getCreateTableSql() {
    return '''
        create table $tableName(
          id integer primary key not null,
          user_id int default 0,
          token varchar(150) default '',
          is_logining int default 0,
          expiration_time int default 0,
        );
        insert into $tableName(user_id) values(0);
        ''';
  }

  Future<bool> signInAccount(User user) async {
    Map<String, dynamic> data = {
      'user_id': user.id,
      'token': user.token,
      'is_logining': 1,
      'expiration_time':
          DateTime.now().add(const Duration(days: 90)).millisecondsSinceEpoch,
    };

    int row = await super.update(data, where: 'id = ?', whereArgs: [1]);
    return row > 0;
  }

  Future<User?> queryLoginUserInfo() async {
    List<Map<String, dynamic>>? data = await super.query(
      where: 'id = ?',
      whereArgs: [1],
      limit: 1,
    );

    log(data.toString(), name: 'login_accout');

    if (data == null || data.isEmpty) {
      return null;
    }

    if (data.first['is_logining'] != 1) {
      log('已退出', name: 'login_accout');
      return null;
    }

    if (data.first['expiration_time'] < DateTime.now().millisecondsSinceEpoch) {
      log('已过期', name: 'login_accout');
      return null;
    }

    LoginAccount loginInfo = LoginAccount.fromJson(data.first);

    UserDb userDb = UserDb();
    User? userInfo = await userDb.queryOne(loginInfo.userId!);

    return userInfo;
  }

  Future<bool> logOutAccount(User userInfo) async {
    int row = await super.update({'is_logining': 0, 'expiration_time': 0},
        where: 'id = ?', whereArgs: [1]);

    return row > 0;
  }
}
