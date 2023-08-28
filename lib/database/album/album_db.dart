import 'package:flutter_douban_fm_clone/database/db_base.dart';
import 'package:flutter_douban_fm_clone/models/album_model.dart';

class AlbumDb extends DbBase<Album> {
  @override
  final String tableName = 'album';

  @override
  final String dbName = 'album_database.db';

  @override
  String getCreateTableSql() {
    return '''
        create table $tableName(
          albumid int primary key not null,
          artist varchar(50),
          releaseDate varchar(50),
          album varchar(80),
          play int,
          artisted int,
          pic text,
          isstar tinyint,
          total int,
          contentType varchar(100),
          albuminfo text,
          lang varchar(50)
        );
        ''';
  }

  Future<Album?> queryOne(int albumId) async {
    List<Map<String, Object?>>? data =
        await super.query(where: 'id = ?', whereArgs: [albumId], limit: 1);

    return data != null && data.isNotEmpty ? Album.fromJson(data.first) : null;
  }
}
