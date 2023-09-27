import 'package:flutter_douban_fm_clone/database/db_base.dart';
import 'package:flutter_douban_fm_clone/models/my_song_list_model.dart';

/// 自定义收藏歌单(红心歌单)
class MySongListDb extends DbBase<MySongList> {
  @override
  final String tableName = 'my_song_list';

  @override
  final String dbName = 'my_song_list_database.db';

  @override
  String getCreateTableSql() {
    return '''
        create table $tableName(
          id integer primary key autoincrement not null,
          name varchar(50),
          cover text,
          user_id int,
          song_num int,
          created_at int
        );
        ''';
  }

  Future<void> addDefault(int userId) async {
    await insert(data: {
      'name': "我的红心歌曲",
      'cover':
          "https://d.musicapp.migu.cn/prod/playlist-service/playListimg/ed9196b6-c663-4339-adc5-5e5a86958c1e.jpg",
      'user_id': userId,
      'song_num': 0,
      'created_at': DateTime.now().millisecondsSinceEpoch,
    });
  }

  Future<bool> incrementSongNum(int userId, [int num = 1]) async {
    MySongList? data = await queryUserOne(userId);
    bool exists = data != null;

    if (!exists) {
      await addDefault(userId);
    }

    int row = await rawUpdate('song_num = song_num + ? ', [num],
        whereSql: 'user_id = ?', whereArgs: [userId]);

    return row > 0;
  }

  Future<bool> decrementSongNum(int mySongListId, [int num = 1]) async {
    int row = await rawUpdate('song_num = song_num - ? ', [num],
        whereSql: 'id = ?', whereArgs: [mySongListId]);

    return row > 0;
  }

  Future<MySongList?> queryOne(int mySongListId) async {
    List<Map<String, Object?>>? data =
        await super.query(where: 'id = ?', whereArgs: [mySongListId], limit: 1);

    return data != null && data.isNotEmpty
        ? MySongList.fromJson(data.first)
        : null;
  }

  Future<MySongList?> queryUserOne(int userId) async {
    List<Map<String, Object?>>? data =
        await super.query(where: 'user_id = ?', whereArgs: [userId], limit: 1);

    return data != null && data.isNotEmpty
        ? MySongList.fromJson(data.first)
        : null;
  }

  Future<List<MySongList>> pageQuery(
      {required int userId, int page = 1, int pageSize = 16}) async {
    List<Map<String, dynamic>>? data = await super.query(
      where: 'user_id = ?',
      whereArgs: [userId],
      limit: pageSize,
      offset: (page - 1) * pageSize,
    );

    List<MySongList> mySongLists =
        data != null ? MySongList.fromList(data) : [];

    return mySongLists;
  }
}
