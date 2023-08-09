import 'package:realm/realm.dart';

part 'album.g.dart';

@RealmModel()
class _Album {
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
  late List<_MusicInfo>? musicList;
}

@RealmModel()
class _MusicInfo {
  late String? musicrid;
  late String? barrage;
  late String? adType;
  late String? artist;
  late String? pic;
  late int? isstar;
  late int? rid;
  late String? upPcStr;
  late int? duration;
  late String? score100;
  late String? adSubtype;
  late String? contentType;
  late int? mvPlayCnt;
  late int? track;
  late bool? hasLossless;
  late int? hasmv;
  late String? releaseDate;
  late String? album;
  late int? albumid;
  late String? pay;
  late int? artistid;
  late String? albumpic;
  late int? originalsongtype;
  late String? songTimeMinutes;
  late bool? isListenFee;
  late String? mvUpPcStr;
  late String? pic120;
  late String? albuminfo;
  late String? name;
  late int? online;
  late String? tmeMusicianAdtype;
}
