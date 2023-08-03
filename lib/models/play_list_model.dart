import 'music_info_model.dart';

class PlayList {
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
  late int? id;
  late String? tag;
  late List<MusicInfo>? musicList;
  late String? desc;
  late String? info;

  PlayList(
      {this.img,
      this.uPic,
      this.uname,
      this.img700,
      this.img300,
      this.userName,
      this.img500,
      this.isOfficial,
      this.total,
      this.name,
      this.listencnt,
      this.id,
      this.tag,
      this.musicList,
      this.desc,
      this.info});

  PlayList.fromJson(Map<String, dynamic> json) {
    if (json["img"] is String) {
      img = json["img"];
    }
    if (json["uPic"] is String) {
      uPic = json["uPic"];
    }
    if (json["uname"] is String) {
      uname = json["uname"];
    }
    if (json["img700"] is String) {
      img700 = json["img700"];
    }
    if (json["img300"] is String) {
      img300 = json["img300"];
    }
    if (json["userName"] is String) {
      userName = json["userName"];
    }
    if (json["img500"] is String) {
      img500 = json["img500"];
    }
    if (json["isOfficial"] is int) {
      isOfficial = json["isOfficial"];
    }
    if (json["total"] is int) {
      total = json["total"];
    }
    if (json["name"] is String) {
      name = json["name"];
    }
    if (json["listencnt"] is int) {
      listencnt = json["listencnt"];
    }
    if (json["id"] is int) {
      id = json["id"];
    }
    if (json["tag"] is String) {
      tag = json["tag"];
    }
    if (json["musicList"] is List) {
      musicList = json["musicList"] == null
          ? null
          : (json["musicList"] as List)
              .map((e) => MusicInfo.fromJson(e))
              .toList();
    }
    if (json["desc"] is String) {
      desc = json["desc"];
    }
    if (json["info"] is String) {
      info = json["info"];
    }
  }

  static List<PlayList> fromList(List<Map<String, dynamic>> list) {
    return list.map((map) => PlayList.fromJson(map)).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["img"] = img;
    data["uPic"] = uPic;
    data["uname"] = uname;
    data["img700"] = img700;
    data["img300"] = img300;
    data["userName"] = userName;
    data["img500"] = img500;
    data["isOfficial"] = isOfficial;
    data["total"] = total;
    data["name"] = name;
    data["listencnt"] = listencnt;
    data["id"] = id;
    data["tag"] = tag;
    if (musicList != null) {
      data["musicList"] = musicList?.map((e) => e.toJson()).toList();
    }
    data["desc"] = desc;
    data["info"] = info;
    return data;
  }

  PlayList copyWith({
    String? img,
    String? uPic,
    String? uname,
    String? img700,
    String? img300,
    String? userName,
    String? img500,
    int? isOfficial,
    int? total,
    String? name,
    int? listencnt,
    int? id,
    String? tag,
    List<MusicInfo>? musicList,
    String? desc,
    String? info,
  }) =>
      PlayList(
        img: img ?? this.img,
        uPic: uPic ?? this.uPic,
        uname: uname ?? this.uname,
        img700: img700 ?? this.img700,
        img300: img300 ?? this.img300,
        userName: userName ?? this.userName,
        img500: img500 ?? this.img500,
        isOfficial: isOfficial ?? this.isOfficial,
        total: total ?? this.total,
        name: name ?? this.name,
        listencnt: listencnt ?? this.listencnt,
        id: id ?? this.id,
        tag: tag ?? this.tag,
        musicList: musicList ?? this.musicList,
        desc: desc ?? this.desc,
        info: info ?? this.info,
      );
}
