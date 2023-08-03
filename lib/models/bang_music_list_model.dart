import 'music_info_model.dart';

class BangMusicList {
  String? img;
  String? num;
  String? pub;
  List<MusicInfo>? musicList;

  BangMusicList({this.img, this.num, this.pub, this.musicList});

  BangMusicList.fromJson(Map<String, dynamic> json) {
    if (json["img"] is String) {
      img = json["img"];
    }
    if (json["num"] is String) {
      num = json["num"];
    }
    if (json["pub"] is String) {
      pub = json["pub"];
    }
    if (json["musicList"] is List) {
      musicList = json["musicList"] == null
          ? null
          : (json["musicList"] as List)
              .map((e) => MusicInfo.fromJson(e))
              .toList();
    }
  }

  static List<BangMusicList> fromList(List<Map<String, dynamic>> list) {
    return list.map((map) => BangMusicList.fromJson(map)).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["img"] = img;
    data["num"] = num;
    data["pub"] = pub;
    if (musicList != null) {
      data["musicList"] = musicList?.map((e) => e.toJson()).toList();
    }
    return data;
  }

  BangMusicList copyWith({
    String? img,
    String? num,
    String? pub,
    List<MusicInfo>? musicList,
  }) =>
      BangMusicList(
        img: img ?? this.img,
        num: num ?? this.num,
        pub: pub ?? this.pub,
        musicList: musicList ?? this.musicList,
      );
}
