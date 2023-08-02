import 'dart:convert';
import 'dart:io';

import 'package:flutter_douban_fm_clone/configs/apis.dart';
import 'package:flutter_douban_fm_clone/models/album_info_model.dart';
import 'package:flutter_douban_fm_clone/models/artist_list_info_model.dart';
import 'package:flutter_douban_fm_clone/models/bang_menu_model.dart';
import 'package:flutter_douban_fm_clone/models/bang_music_list_model.dart';
import 'package:flutter_douban_fm_clone/models/best_play_list_model.dart';
import 'package:flutter_douban_fm_clone/models/comment_list_model.dart';
import 'package:flutter_douban_fm_clone/models/data_response_structure.dart';
import 'package:flutter_douban_fm_clone/models/music_info_model.dart';
import 'package:flutter_douban_fm_clone/models/music_play_url_model.dart';
import 'package:flutter_douban_fm_clone/models/recommended_play_list_model.dart';
import 'package:flutter_douban_fm_clone/models/singer_album_list_model.dart';
import 'package:flutter_douban_fm_clone/models/singer_detail_model.dart';
import 'package:flutter_douban_fm_clone/models/singer_featured_songs_model.dart';
import 'package:flutter_douban_fm_clone/models/song_info_and_lrc_model.dart';
import 'package:flutter_douban_fm_clone/models/tag_list_model.dart';
import 'package:http/http.dart' as http;

Future<ResponseStruct> _fetchResponseResult(
  String authority, [
  String unencodedPath = '',
  Map<String, dynamic>? queryParameters,
  Map<String, String>? addHeaders,
  bool hasToUtf8 = false,
]) async {
  try {
    var url = Uri.https(authority, unencodedPath, queryParameters);

    Map<String, String> headers = {
      'Content-Type': 'application/json; charset=UTF-8',
    };
    if (addHeaders != null) {
      headers.addAll(addHeaders);
    }

    var response = await http.get(url, headers: headers);
    if (response.statusCode != HttpStatus.ok) {
      throw Exception('connect failure!');
    }

    String body = response.body;

    if (hasToUtf8) {
      body = utf8.decode(body.runes.toList());
    }

    ResponseStruct result = ResponseStruct.fromJson(jsonDecode(body));

    return result;
  } on Exception {
    rethrow;
  }
}

/// 获取歌手推荐单曲
Future<SingerFeaturedSongs> fetchSingerFeaturedSongs([
  int artistId = 79436,
  int pageNum = 1,
  int pageSize = 20,
]) async {
  try {
    ResponseStruct result = await _fetchResponseResult(
      wapiHost,
      'api/www/artist/artistMusic',
      {
        'artistid': '$artistId',
        'pn': '$pageNum',
        'rn': '$pageSize',
        'reqId': 'feff7ac0-2f4c-11ee-a85e-73c05e626604',
        'plat': 'web_www',
      },
      {
        'Referer': 'http://$apiHost/singer_detail/$artistId',
        'Secret':
            '1b2e4f2d9cf6b470cd589f74d0b6dfa770cd8abfdcde79ef360574b4d0e8216a054c306b',
        'Cookie':
            'pgv_pvid=8777607306; fqm_pvqid=95884ba2-a4f0-4a39-a7cc-bd23f84a8079; Hm_Iuvt_cdb524f42f0ce19b169b8072123a4727=Er5AfrYyscr4tPFZMxs7a3EdNyxetQ6Q; fqm_sessionid=f6f7e35b-ce61-4118-a01d-9b159787fe7f',
      },
    );

    return SingerFeaturedSongs.fromJson(result.data!);
  } on Exception {
    rethrow;
  }
}

/// 获取歌手专辑列表
Future<SingerAlbumList> fetchSingerAlbumList([
  int artistId = 79436,
  int pageNum = 1,
  int pageSize = 20,
]) async {
  try {
    ResponseStruct result = await _fetchResponseResult(
      wapiHost,
      'api/www/artist/artistAlbum',
      {
        'artistid': '$artistId',
        'pn': '$pageNum',
        'rn': '$pageSize',
        'reqId': 'feff7ac0-2f4c-11ee-a85e-73c05e626604',
        'plat': 'web_www',
      },
    );

    return SingerAlbumList.fromJson(result.data!);
  } on Exception {
    rethrow;
  }
}

/// 获取专辑详细信息
Future<AlbumInfo> fetchAlbumInfo([
  int albumId = 130087,
  int artistId = 79436,
  int pageNum = 1,
  int pageSize = 20,
]) async {
  try {
    ResponseStruct result = await _fetchResponseResult(
      wapiHost,
      '/api/www/album/albumInfo',
      {
        'albumId': '$albumId',
        'pn': '$pageNum',
        'rn': '$pageSize',
        'reqId': 'feff7ac0-2f4c-11ee-a85e-73c05e626604',
        'plat': 'web_www',
      },
      {
        'Referer': 'http://$apiHost/singer_detail/$artistId/album',
        'Secret':
            '1b2e4f2d9cf6b470cd589f74d0b6dfa770cd8abfdcde79ef360574b4d0e8216a054c306b',
        'Cookie':
            'pgv_pvid=8777607306; fqm_pvqid=95884ba2-a4f0-4a39-a7cc-bd23f84a8079; Hm_Iuvt_cdb524f42f0ce19b169b8072123a4727=Er5AfrYyscr4tPFZMxs7a3EdNyxetQ6Q; fqm_sessionid=f6f7e35b-ce61-4118-a01d-9b159787fe7f',
      },
    );

    return AlbumInfo.fromJson(result.data!);
  } on Exception {
    rethrow;
  }
}

/// 获取歌手详情
Future<SingerDetail> fetchSingerDetail([int artistId = 195793]) async {
  try {
    ResponseStruct result = await _fetchResponseResult(
      apiHost,
      '/api/www/artist/artist',
      {
        'artistid': '$artistId',
        'reqId': 'feff7ac0-2f4c-11ee-a85e-73c05e626604',
        'plat': 'web_www',
        'httpsStatus': '1',
      },
      {
        'Referer': 'http://$apiHost/singers',
        'Secret':
            '1b2e4f2d9cf6b470cd589f74d0b6dfa770cd8abfdcde79ef360574b4d0e8216a054c306b',
        'Cookie':
            'pgv_pvid=8777607306; fqm_pvqid=95884ba2-a4f0-4a39-a7cc-bd23f84a8079; Hm_Iuvt_cdb524f42f0ce19b169b8072123a4727=Er5AfrYyscr4tPFZMxs7a3EdNyxetQ6Q; fqm_sessionid=f6f7e35b-ce61-4118-a01d-9b159787fe7f',
      },
    );

    return SingerDetail.fromJson(result.data!);
  } on Exception {
    rethrow;
  }
}

/// 获取歌曲信息
Future<MusicInfo> fetchMusicInfo([int musicId = 279292599]) async {
  try {
    ResponseStruct result = await _fetchResponseResult(
      apiHost,
      '/api/www/music/musicInfo',
      {
        'mid': '$musicId',
        'reqId': 'feff7ac0-2f4c-11ee-a85e-73c05e626604',
        'plat': 'web_www',
        'httpsStatus': '1',
      },
      {
        // 'Referer': 'http://$apiHost/singers',
        // 'Secret':
        //     '1b2e4f2d9cf6b470cd589f74d0b6dfa770cd8abfdcde79ef360574b4d0e8216a054c306b',
        // 'Cookie':
        //     'pgv_pvid=8777607306; fqm_pvqid=95884ba2-a4f0-4a39-a7cc-bd23f84a8079; Hm_Iuvt_cdb524f42f0ce19b169b8072123a4727=Er5AfrYyscr4tPFZMxs7a3EdNyxetQ6Q; fqm_sessionid=f6f7e35b-ce61-4118-a01d-9b159787fe7f',
      },
    );

    return MusicInfo.fromJson(result.data!);
  } on Exception {
    rethrow;
  }
}

/// 获取歌曲播放url
Future<MusicPlayUrl> fetchMusicPayUrl([int musicId = 279292599]) async {
  try {
    ResponseStruct result = await _fetchResponseResult(
      apiHost,
      '/api/v1/www/music/playUrl',
      {
        'mid': '$musicId',
        'type': 'music',
        'reqId': 'feff7ac0-2f4c-11ee-a85e-73c05e626604',
        'plat': 'web_www',
        'httpsStatus': '1',
      },
      {
        'Referer': 'http://$apiHost/singers',
        'Secret':
            '1b2e4f2d9cf6b470cd589f74d0b6dfa770cd8abfdcde79ef360574b4d0e8216a054c306b',
        'Cookie':
            'pgv_pvid=8777607306; fqm_pvqid=95884ba2-a4f0-4a39-a7cc-bd23f84a8079; Hm_Iuvt_cdb524f42f0ce19b169b8072123a4727=Er5AfrYyscr4tPFZMxs7a3EdNyxetQ6Q; fqm_sessionid=f6f7e35b-ce61-4118-a01d-9b159787fe7f',
      },
    );

    return MusicPlayUrl.fromJson(result.data!);
  } on Exception {
    rethrow;
  }
}

/// 获取热门歌单 - 每日推荐
Future<RecommendedPlayList> fetchRecommendedPlayList([
  int pageNum = 1,
  int pageSize = 5,
]) async {
  try {
    ResponseStruct result = await _fetchResponseResult(
      apiHost,
      '/api/www/rcm/index/playlist',
      {
        'id': 'rcm',
        'pn': '$pageNum',
        'rn': '$pageSize',
        'reqId': 'feff7ac0-2f4c-11ee-a85e-73c05e626604',
        'plat': 'web_www',
        'httpsStatus': '1',
      },
      {
        'Referer': 'http://$apiHost',
        'Secret':
            '1b2e4f2d9cf6b470cd589f74d0b6dfa770cd8abfdcde79ef360574b4d0e8216a054c306b',
        'Cookie':
            'pgv_pvid=8777607306; fqm_pvqid=95884ba2-a4f0-4a39-a7cc-bd23f84a8079; Hm_Iuvt_cdb524f42f0ce19b169b8072123a4727=Er5AfrYyscr4tPFZMxs7a3EdNyxetQ6Q; fqm_sessionid=f6f7e35b-ce61-4118-a01d-9b159787fe7f',
      },
    );

    return RecommendedPlayList.fromJson(result.data!);
  } on Exception {
    rethrow;
  }
}

/// 获取精选歌单 - 最热(hot) / 最新(new)
Future<BestPlayList> fetchBestPlayList([
  String order = 'new',
  int pageNum = 1,
  int pageSize = 5,
]) async {
  try {
    ResponseStruct result = await _fetchResponseResult(
      apiHost,
      '	/api/www/classify/playlist/getRcmPlayList',
      {
        'pn': '$pageNum',
        'rn': '$pageSize',
        'order': order,
        'reqId': 'feff7ac0-2f4c-11ee-a85e-73c05e626604',
        'plat': 'web_www',
        'httpsStatus': '1',
      },
      {
        'Referer': 'http://$apiHost/playlists',
        'Secret':
            '1b2e4f2d9cf6b470cd589f74d0b6dfa770cd8abfdcde79ef360574b4d0e8216a054c306b',
        'Cookie':
            'pgv_pvid=8777607306; fqm_pvqid=95884ba2-a4f0-4a39-a7cc-bd23f84a8079; Hm_Iuvt_cdb524f42f0ce19b169b8072123a4727=Er5AfrYyscr4tPFZMxs7a3EdNyxetQ6Q; fqm_sessionid=f6f7e35b-ce61-4118-a01d-9b159787fe7f',
      },
    );

    return BestPlayList.fromJson(result.data!);
  } on Exception {
    rethrow;
  }
}

/// 获取指定标签的歌单
///
/// .e.g: TabList
/// [
/// 		{
/// 			"name": "翻唱",
/// 			"digest": "10000",
/// 			"id": "1848"
/// 		},
/// 		{
/// 			"name": "网络",
/// 			"digest": "10000",
/// 			"id": "621"
/// 		},
/// 		{
/// 			"name": "伤感",
/// 			"digest": "10000",
/// 			"id": "146"
/// 		},
/// 		{
/// 			"name": "欧美",
/// 			"digest": "10000",
/// 			"id": "35"
/// 		}
/// 	]
Future<BestPlayList> fetchTagPlayList([
  int tagId = 35,
  int pageNum = 1,
  int pageSize = 5,
]) async {
  try {
    ResponseStruct result = await _fetchResponseResult(
      apiHost,
      '/api/www/classify/playlist/getTagPlayList',
      {
        'id': '$tagId',
        'pn': '$pageNum',
        'rn': '$pageSize',
        'reqId': 'feff7ac0-2f4c-11ee-a85e-73c05e626604',
        'plat': 'web_www',
        'httpsStatus': '1',
      },
      {
        'Referer': 'http://$apiHost',
        'Secret':
            '1b2e4f2d9cf6b470cd589f74d0b6dfa770cd8abfdcde79ef360574b4d0e8216a054c306b',
        'Cookie':
            'pgv_pvid=8777607306; fqm_pvqid=95884ba2-a4f0-4a39-a7cc-bd23f84a8079; Hm_Iuvt_cdb524f42f0ce19b169b8072123a4727=Er5AfrYyscr4tPFZMxs7a3EdNyxetQ6Q; fqm_sessionid=f6f7e35b-ce61-4118-a01d-9b159787fe7f',
      },
    );

    return BestPlayList.fromJson(result.data!);
  } on Exception {
    rethrow;
  }
}

/// 获取全部歌单的tag标签列表
Future<List<Tags>> fetchTagsList() async {
  try {
    ResponseStruct result = await _fetchResponseResult(
      apiHost,
      '/api/www/playlist/getTagList',
      {
        'reqId': 'feff7ac0-2f4c-11ee-a85e-73c05e626604',
        'plat': 'web_www',
        'httpsStatus': '1',
      },
      {
        'Referer': 'http://$apiHost',
        'Secret':
            '1b2e4f2d9cf6b470cd589f74d0b6dfa770cd8abfdcde79ef360574b4d0e8216a054c306b',
        'Cookie':
            'pgv_pvid=8777607306; fqm_pvqid=95884ba2-a4f0-4a39-a7cc-bd23f84a8079; Hm_Iuvt_cdb524f42f0ce19b169b8072123a4727=Er5AfrYyscr4tPFZMxs7a3EdNyxetQ6Q; fqm_sessionid=f6f7e35b-ce61-4118-a01d-9b159787fe7f',
      },
    );

    return Tags.fromList(result.data! as List<Map<String, dynamic>>);
  } on Exception {
    rethrow;
  }
}

/// 获取艺术家列表 - 搜索 - 类别列表
const List<String> categoryNameList = [
  '全部',
  '华语男',
  '华语女',
  '华语组合',
  '日韩男',
  '日韩女',
  '日韩组合',
  '欧美男',
  '欧美女',
  '欧美组合',
  '其他'
];

/// 获取艺术家列表 - 搜索 - 名字前缀列表
const List<String> prefixList = [
  'A',
  'B',
  'C',
  'D',
  'E',
  'F',
  'G',
  'H',
  'I',
  'J',
  'K',
  'L',
  'M',
  'N',
  'O',
  'P',
  'Q',
  'R',
  'S',
  'T',
  'U',
  'V',
  'W',
  'X',
  'Y',
  'Z',
  '#'
];

/// 获取艺术家列表
///
/// category = [categoryNameList]index
///
/// prefix = [prefixList]value
Future<ArtistList> fetchArtistList([
  int category = 0,
  String prefix = '',
  int pageNum = 1,
  int pageSize = 20,
]) async {
  try {
    ResponseStruct result = await _fetchResponseResult(
      apiHost,
      '/api/www/artist/artistInfo',
      {
        'category': '$category',
        'prefix': prefix,
        'pn': '$pageNum',
        'rn': '$pageSize',
        'reqId': 'feff7ac0-2f4c-11ee-a85e-73c05e626604',
        'plat': 'web_www',
        'httpsStatus': '1',
      },
      {
        'Referer': 'http://$apiHost',
        'Secret':
            '1b2e4f2d9cf6b470cd589f74d0b6dfa770cd8abfdcde79ef360574b4d0e8216a054c306b',
        'Cookie':
            'pgv_pvid=8777607306; fqm_pvqid=95884ba2-a4f0-4a39-a7cc-bd23f84a8079; Hm_Iuvt_cdb524f42f0ce19b169b8072123a4727=Er5AfrYyscr4tPFZMxs7a3EdNyxetQ6Q; fqm_sessionid=f6f7e35b-ce61-4118-a01d-9b159787fe7f',
      },
    );

    return ArtistList.fromJson(result.data!);
  } on Exception {
    rethrow;
  }
}

/// 获取排行榜菜单信息
Future<List<BangMenu>> fetchBangMenu() async {
  try {
    ResponseStruct result = await _fetchResponseResult(
      apiHost,
      '/api/www/bang/bang/bangMenu',
      {
        'reqId': 'feff7ac0-2f4c-11ee-a85e-73c05e626604',
        'plat': 'web_www',
        'httpsStatus': '1',
      },
      {
        'Referer': 'http://$apiHost',
        'Secret':
            '1b2e4f2d9cf6b470cd589f74d0b6dfa770cd8abfdcde79ef360574b4d0e8216a054c306b',
        'Cookie':
            'pgv_pvid=8777607306; fqm_pvqid=95884ba2-a4f0-4a39-a7cc-bd23f84a8079; Hm_Iuvt_cdb524f42f0ce19b169b8072123a4727=Er5AfrYyscr4tPFZMxs7a3EdNyxetQ6Q; fqm_sessionid=f6f7e35b-ce61-4118-a01d-9b159787fe7f',
      },
    );

    return BangMenu.fromList(result.data! as List<Map<String, dynamic>>);
  } on Exception {
    rethrow;
  }
}

/// 获取排行榜歌曲列表
Future<BangMusicList> fetchBangMusicList([
  String bangId = '93',
  int pageNum = 1,
  int pageSize = 20,
]) async {
  try {
    ResponseStruct result = await _fetchResponseResult(
      apiHost,
      '/api/www/bang/bang/musicList',
      {
        'bangId': bangId,
        'pn': '$pageNum',
        'rn': '$pageSize',
        'reqId': queryReqId,
        'plat': queryPlat,
        'httpsStatus': queryHttpsStatus,
      },
      {
        'Referer': headerReferer,
        'Secret': headerSecret,
        'Cookie': headerCookie,
      },
    );

    return BangMusicList.fromJson(result.data!);
  } on Exception {
    rethrow;
  }
}

/// 获取评论列表
///
/// [type] : 'get_rec_comment'=热门评论; 'get_comment'=默认评论;
Future<CommentList> fetchCommentList([
  String type = 'get_comment',
  String bangId = '93',
  int pageNum = 1,
  int pageSize = 5,
]) async {
  const String authority = commentApiHost;
  const String unencodedPath = '/com.s';
  final Map<String, dynamic> queryParameters = {
    "type": type,
    "f": "web",
    "page": "$pageNum",
    "rows": "$pageSize",
    "digest": "2",
    "sid": bangId,
    "uid": "0",
    "prod": "newWeb",
    "httpsStatus": queryHttpsStatus,
    "reqId": queryReqId,
    "plat": queryPlat,
  };

  try {
    var url = Uri.http(authority, unencodedPath, queryParameters);

    final Map<String, String> headers = {
      'Content-Type': 'application/json; charset=UTF-8',
      'Referer': headerReferer,
      'Secret': headerSecret,
      'Cookie': headerCookie,
    };

    var response = await http.get(url, headers: headers);
    if (response.statusCode != HttpStatus.ok) {
      throw Exception('connect failure!');
    }

    String body = response.body;

    // body = utf8.decode(body.runes.toList());

    ResponseStruct result = ResponseStruct.fromJson(jsonDecode(body));

    return CommentList.fromJson(result.data!);
  } on Exception {
    rethrow;
  }
}

/// 获取歌曲和歌词信息
///
/// [musicId] : 歌曲id;
Future<SongInfoAndLrcData> fetchSongInfoAndLrc([
  String musicId = '279292599',
]) async {
  const String authority = mApihost;
  const String unencodedPath = '/newh5/singles/songinfoandlrc';
  final Map<String, dynamic> queryParameters = {
    "musicId": musicId,
    "httpsStatus": queryHttpsStatus,
    "reqId": queryReqId,
    "plat": queryPlat,
  };

  try {
    var url = Uri.http(authority, unencodedPath, queryParameters);

    final Map<String, String> headers = {
      'Content-Type': 'application/json; charset=UTF-8',
      'Referer': headerReferer,
    };

    var response = await http.get(url, headers: headers);
    if (response.statusCode != HttpStatus.ok) {
      throw Exception('connect failure!');
    }

    String body = response.body;

    ResponseStruct result = ResponseStruct.fromJson(jsonDecode(body));

    return SongInfoAndLrcData.fromJson(result.data!);
  } on Exception {
    rethrow;
  }
}
