import 'package:flutter_douban_fm_clone/database/db_base.dart';
import 'package:flutter_douban_fm_clone/models/music_info_model.dart';

class MusicDb extends DbBase<MusicInfo> {
  @override
  String tableName = 'music';

  @override
  String dbName = 'music_database.db';

  @override
  String getCreateTableSql() {
    return '''
        create table $tableName(
          rid int primary key not null,
          musicrid varchar(100),
          barrage varchar(200),
          ad_type varchar(150) default '' not null,
          artist varchar(50),
          mvpayinfo text,
          pic text,
          isstar int,
          upPcStr text,
          duration int,
          score100 text,
          ad_subtype varchar(200),
          content_type varchar(200),
          mvPlayCnt int,
          track int,
          hasLossless boolean,
          hasmv int,
          releaseDate varchar(50),
          album text,
          albumid int,
          pay text,
          artistid int,
          albumpic text,
          originalsongtype int,
          songTimeMinutes varchar(50),
          isListenFee boolean,
          mvUpPcStr text,
          pic120 text,
          albuminfo text,
          name varchar(120),
          online int,
          payInfo text,
          tme_musician_adtype varchar(200)
        );
        ''';
  }

  Future<MusicInfo?> queryOne(int musicId) async {
    List<Map<String, Object?>>? data =
        await super.query(where: 'rid = ?', whereArgs: [musicId], limit: 1);

    return data != null && data.isNotEmpty
        ? MusicInfo.fromJson(data.first)
        : null;
  }
}
