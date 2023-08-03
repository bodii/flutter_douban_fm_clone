import 'package:flutter_douban_fm_clone/common/functions/html_entities_to_string.dart';

class ArtistAlbumList {
  late String? total;
  late List<Album>? albumList;

  ArtistAlbumList({
    this.total,
    this.albumList,
  });

  ArtistAlbumList.fromJson(Map<String, dynamic> json) {
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
    final Map<String, dynamic> data = <String, dynamic>{};
    data["total"] = total;
    if (albumList != null) {
      data["albumList"] = albumList?.map((e) => e.toJson()).toList();
    }
    return data;
  }

  ArtistAlbumList copyWith({
    String? total,
    List<Album>? albumList,
  }) =>
      ArtistAlbumList(
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
    final Map<String, dynamic> data = <String, dynamic>{};
    data["content_type"] = contentType;
    data["albuminfo"] = albuminfo;
    data["artist"] = artist;
    data["releaseDate"] = releaseDate;
    data["album"] = album;
    data["albumid"] = albumid;
    data["artistid"] = artistid;
    data["pic"] = pic;
    data["isstar"] = isstar;
    data["lang"] = lang;
    return data;
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
