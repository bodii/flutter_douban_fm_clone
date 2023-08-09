import 'package:realm/realm.dart';

part 'play_list.g.dart';

@RealmModel()
class _PlayList {
  @PrimaryKey()
  late int id;

  late String? img;
  late String? uPic;
  late String? uname;
  late String? img700;
  late String? img300;
  late String? userName;
  late String? img500;
  late int? isOfficial;
  late int? total;
  late String? name;
  late int? listencnt;
  late List<_MusicInfo> musicList;
  late String? desc;
  late String? info;
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
