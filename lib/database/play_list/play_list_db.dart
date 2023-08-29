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

  Future<PlayList?> queryOne(int playListId) async {
    List<Map<String, Object?>>? data =
        await super.query(where: 'id = ?', whereArgs: [playListId], limit: 1);

    return data != null && data.isNotEmpty
        ? PlayList.fromJson(data.first)
        : null;
  }

  Future<List<PlayList>> pageQuery([int page = 1, int pageSize = 16]) async {
    List<Map<String, dynamic>>? data = await super.query(
      offset: (page - 1) * pageSize,
      limit: pageSize,
    );

    return data != null ? PlayList.fromList(data) : [];
  }

  Future<bool> isExists(int playListId) async {
    PlayList? info = await queryOne(playListId);

    return info != null;
  }

  Future<bool> add(PlayList playList) async {
    int row =
        await insert(data: playList.toJson(), excludeColums: ['musicList']);
    return row > 0;
  }

  Future<bool> cancel(int playListId) async {
    int row = await delete(where: 'id = ?', whereArgs: [playListId]);
    return row > 0;
  }

  Future<bool> toggle(PlayList playList, bool isExists) async {
    bool success = false;
    if (!isExists) {
      success = await add(playList);
    } else {
      success = await cancel(playList.id!);
    }

    return success ? !isExists : isExists;
  }
}
