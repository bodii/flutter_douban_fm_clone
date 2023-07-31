import 'package:flutter_douban_fm_clone/common/functions/html_entities_to_string.dart';

class SingerAlbumList {
  late String? total;
  late List<Album>? albumList;

  SingerAlbumList({
    this.total,
    this.albumList,
  });

  SingerAlbumList.fromJson(Map<String, dynamic> json) {
    if (json["total"] is String) {
      total = json["total"];
    }
    if (json["albumList"] is List) {
      albumList = (json["albumList"] == null
          ? null
          : (json["albumList"] as List).map((e) => Album.fromJson(e)).toList());
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["total"] = total;
    if (albumList != null) {
      _data["albumList"] = albumList?.map((e) => e.toJson()).toList();
    }
    return _data;
  }

  SingerAlbumList copyWith({
    String? total,
    List<Album>? albumList,
  }) =>
      SingerAlbumList(
        total: total ?? this.total,
        albumList: albumList ?? this.albumList,
      );
}

class Album {
  late String? contentType;
  late String? albuminfo;
  late String? artist;
  late String? releaseDate;
  late String? album;
  late int? albumid;
  late int? pay;
  late int? artistid;
  late String? pic;
  late int? isstar;
  late String? lang;

  Album({
    this.contentType,
    this.albuminfo,
    this.artist,
    this.releaseDate,
    this.album,
    this.albumid,
    this.pay,
    this.artistid,
    this.pic,
    this.isstar,
    this.lang,
  });

  Album.fromJson(Map<String, dynamic> json) {
    if (json["content_type"] is String) {
      contentType = json["content_type"];
    }
    if (json["albuminfo"] is String) {
      albuminfo = json["albuminfo"];
    }
    if (json["artist"] is String) {
      artist = (json["artist"] as String).htmlEntitiesToString();
    }
    if (json["releaseDate"] is String) {
      releaseDate = json["releaseDate"];
    }
    if (json["album"] is String) {
      album = (json["album"] as String).htmlEntitiesToString();
    }
    if (json["albumid"] is int) {
      albumid = json["albumid"];
    }
    if (json["artistid"] is int) {
      artistid = json["artistid"];
    }
    if (json["pic"] is String) {
      pic = json["pic"];
    }
    if (json["isstar"] is int) {
      isstar = json["isstar"];
    }
    if (json["lang"] is String) {
      lang = json["lang"];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["content_type"] = contentType;
    _data["albuminfo"] = albuminfo;
    _data["artist"] = artist;
    _data["releaseDate"] = releaseDate;
    _data["album"] = album;
    _data["albumid"] = albumid;
    _data["artistid"] = artistid;
    _data["pic"] = pic;
    _data["isstar"] = isstar;
    _data["lang"] = lang;
    return _data;
  }

  Album copyWith({
    String? contentType,
    String? albuminfo,
    String? artist,
    String? releaseDate,
    String? album,
    int? albumid,
    int? pay,
    int? artistid,
    String? pic,
    int? isstar,
    String? lang,
  }) =>
      Album(
        contentType: contentType ?? this.contentType,
        albuminfo: albuminfo ?? this.albuminfo,
        artist: artist ?? this.artist,
        releaseDate: releaseDate ?? this.releaseDate,
        album: album ?? this.album,
        albumid: albumid ?? this.albumid,
        pay: pay ?? this.pay,
        artistid: artistid ?? this.artistid,
        pic: pic ?? this.pic,
        isstar: isstar ?? this.isstar,
        lang: lang ?? this.lang,
      );
}
