import 'package:flutter_douban_fm_clone/database/db_base.dart';
import 'package:flutter_douban_fm_clone/models/artist_model.dart';

class ArtistDb extends DbBase<Artist> {
  @override
  final String tableName = 'artist';

  @override
  final String dbName = 'artist_database.db';

  @override
  String getCreateTableSql() {
    return '''
        create table $tableName(
          id int primary key not null,
          birthday varchar(30),
          country varchar(150),
          artistFans int 
          albumNum int,
          gener varchar(50),
          weight varchar(50),
          language varchar(50),
          mvNum int,
          pic text,
          upPcUrl text,
          musicNum int,
          pic120 text,
          isStar int,
          birthplace varchar(80),
          constellation varchar(50),
          contentType varchar(120),
          aartist varchar(50),
          name varchar(50),
          pic70 text,
          tall varchar(50),
          pic300 text,
          info text
        );
        ''';
  }

  Future<Artist?> queryOne(int artistId) async {
    List<Map<String, dynamic>>? data =
        await super.query(where: 'id = ?', whereArgs: [artistId], limit: 1);

    return data != null && data.isNotEmpty ? Artist.fromJson(data.first) : null;
  }

  Future<List<Artist>> pageQuery([int page = 1, int pageSize = 16]) async {
    List<Map<String, dynamic>>? data = await super.query(
      offset: (page - 1) * pageSize,
      limit: pageSize,
    );

    return data != null ? Artist.fromList(data) : [];
  }
}
