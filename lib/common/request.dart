import 'dart:convert';
import 'dart:io';

import 'package:flutter/widgets.dart';
import 'package:flutter_douban_fm_clone/models/play_list_model.dart';
import 'package:flutter_douban_fm_clone/models/search_album_model.dart';
import 'package:flutter_douban_fm_clone/models/search_artist_model.dart';
import 'package:flutter_douban_fm_clone/models/search_music_model.dart';
import 'package:flutter_douban_fm_clone/models/search_mv_model.dart';
import 'package:flutter_douban_fm_clone/models/search_play_list_model.dart';
import 'package:flutter_douban_fm_clone/models/search_suggestion_model.dart';
import 'package:go_router/go_router.dart';

import '../configs/apis.dart';
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
import 'package:flutter_douban_fm_clone/models/artist_album_list_model.dart';
import 'package:flutter_douban_fm_clone/models/artist_detail_model.dart';
import 'package:flutter_douban_fm_clone/models/artist_featured_songs_model.dart';
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
  debugPrint('start http query');

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

    dynamic jsonBody = jsonDecode(body);
    if (jsonBody['success'] != null && !jsonBody['success']) {
      var responsed = await http.get(Uri.http(apiHost));
      print(responsed.headers);
      print(responsed.request);
      throw Exception('header params failure!');
    }

    ResponseStruct result = ResponseStruct.fromJson(jsonBody);

    return result;
  } catch (e) {
    debugPrint(e.toString());
    rethrow;
  }
}

/// 获取歌手（艺术家）推荐单曲
Future<ArtistFeaturedSongs> fetchArtistFeaturedSongs([
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
        'reqId': queryReqId,
        'plat': queryPlat,
      },
      {
        'Referer': headerReferer,
        'Secret': headerSecret,
        'Cookie': headerCookie,
      },
    );

    return ArtistFeaturedSongs.fromJson(result.data!);
  } on Exception {
    rethrow;
  }
}

/// 获取歌手（艺术家）专辑列表
Future<ArtistAlbumList> fetchArtistAlbumList([
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
        'reqId': queryReqId,
        'plat': queryPlat,
      },
    );

    return ArtistAlbumList.fromJson(result.data!);
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
        'reqId': queryReqId,
        'plat': queryPlat,
      },
      {
        'Referer': headerReferer,
        'Secret': headerSecret,
        'Cookie': headerCookie,
      },
    );

    return AlbumInfo.fromJson(result.data!);
  } catch (e) {
    GoError(e.toString());
    rethrow;
  }
}

/// 获取歌手（艺术家）详情
Future<ArtistDetail> fetchArtistDetail([int artistId = 195793]) async {
  try {
    ResponseStruct result = await _fetchResponseResult(
      apiHost,
      '/api/www/artist/artist',
      {
        'artistid': '$artistId',
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

    return ArtistDetail.fromJson(result.data!);
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
        'reqId': queryReqId,
        'plat': queryPlat,
        'httpsStatus': queryHttpsStatus,
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

    return RecommendedPlayList.fromJson(result.data!);
  } catch (e) {
    debugPrint(e.toString());
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

    return BestPlayList.fromJson(result.data!);
  } on Exception {
    rethrow;
  }
}

/// 获取歌单详情内容（含musicList）
Future<PlayList> fetchPlayListInfo([
  int playListId = 1082685104,
  int pageNum = 1,
  int pageSize = 20,
]) async {
  try {
    ResponseStruct result = await _fetchResponseResult(
      apiHost,
      '/api/www/playlist/playListInfo',
      {
        'pid': '$playListId',
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

    return PlayList.fromJson(result.data!);
  } catch (e) {
    debugPrint(e.toString());
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
Future<SongInfoAndLrc> fetchSongInfoAndLrc([
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
      // 'Content-Type': 'application/json; charset=UTF-8',
      'Referer': headerReferer,
    };

    var response = await http.get(url, headers: headers);
    if (response.statusCode != HttpStatus.ok) {
      throw Exception('connect failure!');
    }

    String body = response.body;

    SongInfoAndLrcData result = SongInfoAndLrcData.fromJson(jsonDecode(body));

    return result.info!;
  } on Exception {
    rethrow;
  }
}

/// 获取搜索建议列表
Future<SearchSuggestion> fetchSearchSuggestion([
  String key = '',
]) async {
  try {
    ResponseStruct result = await _fetchResponseResult(
      apiHost,
      '/api/www/search/searchKey',
      {
        'key': key,
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

    return SearchSuggestion.fromJson(result.data! as List<String>);
  } on Exception {
    rethrow;
  }
}

/// 搜索歌曲结果
Future<SearchMusicResult> searchMusicResult([
  String key = '',
  int pageNum = 1,
  int pageSize = 20,
]) async {
  try {
    ResponseStruct result = await _fetchResponseResult(
      apiHost,
      '/api/www/search/searchMusicBykeyWord',
      {
        'key': key,
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

    return SearchMusicResult.fromJson(result.data!);
  } on Exception {
    rethrow;
  }
}

/// 搜索专辑结果
Future<SearchAlbumResult> searchAlbumResult([
  String key = '',
  int pageNum = 1,
  int pageSize = 20,
]) async {
  try {
    ResponseStruct result = await _fetchResponseResult(
      apiHost,
      '/api/www/search/searchAlbumBykeyWord',
      {
        'key': key,
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

    return SearchAlbumResult.fromJson(result.data!);
  } on Exception {
    rethrow;
  }
}

/// 搜索mv结果
Future<SearchMVResult> searchMVResult([
  String key = '',
  int pageNum = 1,
  int pageSize = 20,
]) async {
  try {
    ResponseStruct result = await _fetchResponseResult(
      apiHost,
      '/api/www/search/searchMvBykeyWord',
      {
        'key': key,
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

    return SearchMVResult.fromJson(result.data!);
  } on Exception {
    rethrow;
  }
}

/// 搜索歌单结果
Future<SearchPlayListResult> searchPlayListResult([
  String key = '',
  int pageNum = 1,
  int pageSize = 20,
]) async {
  try {
    ResponseStruct result = await _fetchResponseResult(
      apiHost,
      '/api/www/search/searchPlayListBykeyWord',
      {
        'key': key,
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

    return SearchPlayListResult.fromJson(result.data!);
  } on Exception {
    rethrow;
  }
}

/// 搜艺术家结果
Future<SearchArtistResult> searchArtistResult([
  String key = '',
  int pageNum = 1,
  int pageSize = 30,
]) async {
  try {
    ResponseStruct result = await _fetchResponseResult(
      apiHost,
      '/api/www/search/searchArtistBykeyWord',
      {
        'key': key,
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

    return SearchArtistResult.fromJson(result.data!);
  } on Exception {
    rethrow;
  }
}
