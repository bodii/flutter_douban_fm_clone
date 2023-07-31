import 'dart:convert';
import 'dart:io';

import 'package:flutter_douban_fm_clone/configs/apis.dart';
import 'package:flutter_douban_fm_clone/models/data_response_structure.dart';
import 'package:flutter_douban_fm_clone/models/singer_album_list_model.dart';
import 'package:flutter_douban_fm_clone/models/singer_featured_songs_model.dart';
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

// 获取歌手推荐单曲
Future<SingerFeaturedSongs> fetchSingerFeaturedSongs() async {
  try {
    ResponseStruct result = await _fetchResponseResult(
      apiHost,
      'api/www/artist/artistMusic',
      {
        'artistid': '79436',
        'pn': '1',
        'rn': '20',
        'reqId': 'feff7ac0-2f4c-11ee-a85e-73c05e626604',
        'plat': 'web_www',
      },
      {
        'Referer': 'http://$apiHost2/singer_detail/79436',
        'Secret':
            '1b2e4f2d9cf6b470cd589f74d0b6dfa770cd8abfdcde79ef360574b4d0e8216a054c306b',
        'Cookie':
            ' pgv_pvid=8777607306; fqm_pvqid=95884ba2-a4f0-4a39-a7cc-bd23f84a8079; Hm_Iuvt_cdb524f42f0ce19b169b8072123a4727=Er5AfrYyscr4tPFZMxs7a3EdNyxetQ6Q; fqm_sessionid=f6f7e35b-ce61-4118-a01d-9b159787fe7f',
      },
    );

    return SingerFeaturedSongs.fromJson(result.data!);
  } on Exception {
    rethrow;
  }
}

// 获取歌手专辑列表
Future<SingerAlbumList> fetchSingerAlbumList() async {
  try {
    ResponseStruct result = await _fetchResponseResult(
      apiHost,
      'api/www/artist/artistAlbum',
      {
        'artistid': '79436',
        'pn': '1',
        'rn': '20',
        'reqId': 'feff7ac0-2f4c-11ee-a85e-73c05e626604',
        'plat': 'web_www',
      },
    );

    return SingerAlbumList.fromJson(result.data!);
  } on Exception {
    rethrow;
  }
}
