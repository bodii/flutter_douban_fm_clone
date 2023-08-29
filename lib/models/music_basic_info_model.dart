import 'package:flutter_douban_fm_clone/models/music_info_model.dart';
import 'package:flutter_douban_fm_clone/models/song_info_and_lrc_model.dart';

class MusicBasicInfo {
  int? id;
  String? name;
  String? artist;
  int? artistid;
  String? album;
  int? albumid;
  String? pic;
  int? duration;
  String? songTimeMinutes;

  MusicBasicInfo({
    this.id,
    this.name,
    this.pic,
    this.duration,
    this.artist,
    this.artistid,
    this.album,
    this.albumid,
    this.songTimeMinutes,
  });

  MusicBasicInfo.fromJson(Map<String, dynamic> json) {
    if (json["id"] is int) {
      id = json["id"];
    }
    if (json["name"] is String) {
      name = json["name"];
    }
    if (json["pic"] is String) {
      pic = json["pic"];
    }
    if (json["duration"] is int) {
      duration = json["duration"];
    }
    if (json["album"] is String) {
      album = json["album"];
    }
    if (json["albumid"] is int) {
      albumid = json["albumid"];
    }
    if (json["artistid"] is int) {
      artistid = json["artistid"];
    }
    if (json["artist"] is String) {
      artist = json["artist"];
    }
    if (json["songTimeMinutes"] is String) {
      songTimeMinutes = json["songTimeMinutes"];
    }
  }

  static List<MusicBasicInfo> fromList(List<Map<String, dynamic>> list) {
    return list.map((map) => MusicBasicInfo.fromJson(map)).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["id"] = id;
    data["name"] = name;
    data["pic"] = pic;
    data["duration"] = duration;
    data["album"] = album;
    data["albumid"] = albumid;
    data["artist"] = artist;
    data["artistid"] = artistid;
    data["songTimeMinutes"] = songTimeMinutes;
    return data;
  }

  MusicBasicInfo copyWith({
    int? id,
    String? name,
    String? pic,
    int? duration,
    String? album,
    int? albumid,
    String? artist,
    int? artistid,
    String? songTimeMinutes,
  }) =>
      MusicBasicInfo(
        id: id ?? this.id,
        name: name ?? this.name,
        pic: pic ?? this.pic,
        duration: duration ?? this.duration,
        artist: artist ?? this.artist,
        artistid: artistid ?? this.artistid,
        album: album ?? this.album,
        albumid: albumid ?? this.albumid,
        songTimeMinutes: songTimeMinutes ?? this.songTimeMinutes,
      );

  MusicBasicInfo.copySongInfoWith(SongInfo songInfo) {
    id = int.parse(songInfo.id!);
    name = songInfo.songName;
    pic = songInfo.pic;
    duration = int.parse(songInfo.duration!);
    artist = songInfo.artist;
    artistid = int.parse(songInfo.artistId!);
    album = songInfo.album;
    albumid = int.parse(songInfo.albumId!);
    songTimeMinutes = songInfo.songTimeMinutes;
  }

  MusicBasicInfo.copyMusicInfoWith(MusicInfo musicInfo) {
    id = musicInfo.rid;
    name = musicInfo.name;
    pic = musicInfo.pic;
    duration = musicInfo.duration;
    album = musicInfo.album;
    albumid = musicInfo.albumid;
    artist = musicInfo.artist;
    artistid = musicInfo.artistid;
    songTimeMinutes = musicInfo.songTimeMinutes;
  }
}
