import 'package:flutter_douban_fm_clone/database/db_base.dart';
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
          id integer primary key not null,
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

  Future<MusicBasicInfo?> queryOne(int musicId) async {
    List<Map<String, Object?>>? data =
        await super.query(where: 'id = ?', whereArgs: [musicId], limit: 1);

    return data != null && data.isNotEmpty
        ? MusicBasicInfo.fromJson(data.first)
        : null;
  }

  Future<List<MusicBasicInfo>> pageQuery(
      [int page = 1, int pageSize = 16]) async {
    List<Map<String, dynamic>>? data = await super.query(
      offset: (page - 1) * pageSize,
      limit: pageSize,
    );

    return data != null ? MusicBasicInfo.fromList(data) : [];
  }

  Future<bool> isExists(int musicId) async {
    MusicBasicInfo? info = await queryOne(musicId);

    return info != null;
  }

  MusicBasicInfo _conversionType<T>(T info) {
    MusicBasicInfo musicBasicInfo;

    switch (info.runtimeType) {
      case MusicInfo:
        musicBasicInfo = MusicBasicInfo.copyMusicInfoWith(info as MusicInfo);
        break;

      case SongInfo:
        musicBasicInfo = MusicBasicInfo.copySongInfoWith(info as SongInfo);
        break;

      default:
        musicBasicInfo = info as MusicBasicInfo;
    }

    return musicBasicInfo;
  }

  Future<bool> add<T>(T info) async {
    MusicBasicInfo musicBasicInfo = _conversionType<T>(info);

    int row = await super.insert(data: musicBasicInfo.toJson());
    return row > 0;
  }

  Future<bool> cancel(int musicId) async {
    int row = await super.delete(where: 'id = ?', whereArgs: [musicId]);
    return row > 0;
  }

  Future<bool> toggle<T>(T info, bool isExists) async {
    MusicBasicInfo musicBasicInfo = _conversionType<T>(info);

    bool success = false;
    if (!isExists) {
      success = await add(info);
    } else {
      success = await cancel(musicBasicInfo.id!);
    }

    return success ? !isExists : isExists;
  }
}
