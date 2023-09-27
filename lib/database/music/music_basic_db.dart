import 'dart:developer';

import 'package:flutter_douban_fm_clone/database/db_base.dart';
import 'package:flutter_douban_fm_clone/database/my_song_list/my_song_list_db.dart';
import 'package:flutter_douban_fm_clone/models/music_basic_info_model.dart';
import 'package:flutter_douban_fm_clone/models/music_info_model.dart';
import 'package:flutter_douban_fm_clone/models/song_info_and_lrc_model.dart';

class MusicBasicDb extends DbBase<MusicBasicInfo> {
  @override
  String tableName = 'music_basic';

  @override
  String dbName = 'music_basic_database.db';

  @override
  String getCreateTableSql() {
    return '''
        create table $tableName(
          id integer primary key autoincrement not null,
          music_id int,
          user_id int not null default 0,
          my_song_list_id int not null default 1,
          name varchar(120),
          pic text,
          duration int,
          artist varchar(50),
          artistid int,
          album text,
          albumid int,
          songTimeMinutes varchar(10)
        );
        ''';
  }

  Future<MusicBasicInfo?> queryOne(int musicId, int userId) async {
    List<Map<String, Object?>>? data = await query(
      where: 'music_id = ? and user_id = ?',
      whereArgs: [musicId, userId],
      limit: 1,
    );

    return data != null && data.isNotEmpty
        ? MusicBasicInfo.fromJson(data.first)
        : null;
  }

  Future<List<MusicBasicInfo>> pageQuery(
      [int page = 1, int pageSize = 16]) async {
    List<Map<String, dynamic>>? data = await query(
      offset: (page - 1) * pageSize,
      limit: pageSize,
    );

    return data != null ? MusicBasicInfo.fromList(data) : [];
  }

  Future<bool> hasExists({required int musicId, required int userId}) async {
    MusicBasicInfo? info = await queryOne(musicId, userId);

    return info != null;
  }

  MusicBasicInfo _conversionType<T>(
      {required T info, required int userId, required int mySongListId}) {
    MusicBasicInfo musicBasicInfo;

    switch (info.runtimeType) {
      case MusicInfo:
        musicBasicInfo = MusicBasicInfo.copyMusicInfoWith(
          musicInfo: info as MusicInfo,
          userId: userId,
          mySongListId: mySongListId,
        );
        break;

      case SongInfo:
        musicBasicInfo = MusicBasicInfo.copySongInfoWith(
          songInfo: info as SongInfo,
          userId: userId,
          mySongListId: mySongListId,
        );
        break;

      default:
        musicBasicInfo = info as MusicBasicInfo;
    }

    return musicBasicInfo;
  }

  Future<bool> add<T>(
      {required T info, required int userId, required int mySongListId}) async {
    MusicBasicInfo musicBasicInfo = _conversionType<T>(
      info: info,
      userId: userId,
      mySongListId: mySongListId,
    );

    int row =
        await insert(data: musicBasicInfo.toJson(), excludeColums: ['id']);
    log('insert num $row');

    MySongListDb mySongListDb = MySongListDb();
    bool incResult = await mySongListDb.incrementSongNum(userId, 1);
    log('inc result $incResult');
    return row > 0 && incResult;
  }

  Future<bool> cancel(MusicBasicInfo musicBasicInfo) async {
    int row = await delete(where: 'id = ?', whereArgs: [musicBasicInfo.id]);

    MySongListDb mySongListDb = MySongListDb();
    bool decResult =
        await mySongListDb.decrementSongNum(musicBasicInfo.mySongListId!, 1);

    return row > 0 && decResult;
  }

  Future<bool> toggle<T>(
      {required T info, required int userId, required int mySongListId}) async {
    MusicBasicInfo musicBasicInfo = _conversionType<T>(
        info: info, userId: userId, mySongListId: mySongListId);

    print(musicBasicInfo.musicId);

    bool isExists =
        await hasExists(musicId: musicBasicInfo.musicId!, userId: userId);

    bool success = false;
    if (!isExists) {
      success = await add<MusicBasicInfo>(
          info: musicBasicInfo, userId: userId, mySongListId: mySongListId);
    } else {
      success = await cancel(musicBasicInfo);
    }

    print(success);
    print(isExists);

    return success ? !isExists : isExists;
  }
}
