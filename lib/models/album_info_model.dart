import 'music_info_model.dart';

class AlbumInfo {
  late int? playCnt;
  late String? artist;
  late String? releaseDate;
  late String? album;
  late int? albumid;
  late int? pay;
  late int? artistid;
  late String? pic;
  late int? isstar;
  late int? total;
  late String? contentType;
  late String? albuminfo;
  late String? lang;
  late List<MusicInfo>? musicList;

  AlbumInfo(
      {this.playCnt,
      this.artist,
      this.releaseDate,
      this.album,
      this.albumid,
      this.pay,
      this.artistid,
      this.pic,
      this.isstar,
      this.total,
      this.contentType,
      this.albuminfo,
      this.lang,
      this.musicList});

  AlbumInfo.fromJson(Map<String, dynamic> json) {
    if (json["playCnt"] is int) {
      playCnt = json["playCnt"];
    }
    if (json["artist"] is String) {
      artist = json["artist"];
    }
    if (json["releaseDate"] is String) {
      releaseDate = json["releaseDate"];
    }
    if (json["album"] is String) {
      album = json["album"];
    }
    if (json["albumid"] is int) {
      albumid = json["albumid"];
    }
    if (json["pay"] is int) {
      pay = json["pay"];
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
    if (json["total"] is int) {
      total = json["total"];
    }
    if (json["content_type"] is String) {
      contentType = json["content_type"];
    }
    if (json["albuminfo"] is String) {
      albuminfo = json["albuminfo"];
    }
    if (json["lang"] is String) {
      lang = json["lang"];
    }
    if (json["musicList"] is List) {
      musicList = json["musicList"] == null
          ? null
          : (json["musicList"] as List)
              .map((e) => MusicInfo.fromJson(e))
              .toList();
    }
  }

  static List<AlbumInfo> fromList(List<Map<String, dynamic>> list) {
    return list.map((map) => AlbumInfo.fromJson(map)).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["playCnt"] = playCnt;
    data["artist"] = artist;
    data["releaseDate"] = releaseDate;
    data["album"] = album;
    data["albumid"] = albumid;
    data["pay"] = pay;
    data["artistid"] = artistid;
    data["pic"] = pic;
    data["isstar"] = isstar;
    data["total"] = total;
    data["content_type"] = contentType;
    data["albuminfo"] = albuminfo;
    data["lang"] = lang;
    if (musicList != null) {
      data["musicList"] = musicList?.map((e) => e.toJson()).toList();
    }
    return data;
  }

  AlbumInfo copyWith({
    int? playCnt,
    String? artist,
    String? releaseDate,
    String? album,
    int? albumid,
    int? pay,
    int? artistid,
    String? pic,
    int? isstar,
    int? total,
    String? contentType,
    String? albuminfo,
    String? lang,
    List<MusicInfo>? musicList,
  }) =>
      AlbumInfo(
        playCnt: playCnt ?? this.playCnt,
        artist: artist ?? this.artist,
        releaseDate: releaseDate ?? this.releaseDate,
        album: album ?? this.album,
        albumid: albumid ?? this.albumid,
        pay: pay ?? this.pay,
        artistid: artistid ?? this.artistid,
        pic: pic ?? this.pic,
        isstar: isstar ?? this.isstar,
        total: total ?? this.total,
        contentType: contentType ?? this.contentType,
        albuminfo: albuminfo ?? this.albuminfo,
        lang: lang ?? this.lang,
        musicList: musicList ?? this.musicList,
      );
}
