import 'package:flutter_douban_fm_clone/database/db_base.dart';
import 'package:flutter_douban_fm_clone/models/play_list_model.dart';

class PlayListDb extends DbBase<PlayList> {
  @override
  String tableName = 'playlist';

  @override
  String dbName = 'playlist_database.db';

  @override
  String getCreateTableSql() {
    return '''
       create table $tableName(
          id int primary key not null,
          img text ,
          uPic text,
          uname varchar(200),
          img700 text,
          img300 text,
          userName varchar(200),
          img500 text,
          isOfficial boolean,
          total int,
          name varchar(200),
          listencnt int,
          tag varchar(100),
          desc text,
          info text
        );
        ''';
  }

  Future<PlayList?> queryOne(String playListId) async {
    List<Map<String, Object?>>? data =
        await super.query(where: 'id = ?', whereArgs: [playListId], limit: 1);

    return data != null && data.isNotEmpty
        ? PlayList.fromJson(data.first)
        : null;
  }
}
