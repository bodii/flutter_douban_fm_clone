import 'play_list_model.dart';

class BestPlayList {
  int? total;
  List<PlayList>? playList;
  int? rn;
  int? pn;

  BestPlayList({this.total, this.playList, this.rn, this.pn});

  BestPlayList.fromJson(Map<String, dynamic> json) {
    if (json["total"] is int) {
      total = json["total"];
    }
    if (json["data"] is List) {
      playList = json["data"] == null
          ? null
          : (json["data"] as List).map((e) => PlayList.fromJson(e)).toList();
    }
    if (json["rn"] is int) {
      rn = json["rn"];
    }
    if (json["pn"] is int) {
      pn = json["pn"];
    }
  }

  static List<BestPlayList> fromList(List<Map<String, dynamic>> list) {
    return list.map((map) => BestPlayList.fromJson(map)).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data["total"] = total;
    data["data"] = playList?.map((e) => e.toJson()).toList();
    data["rn"] = rn;
    data["pn"] = pn;
    return data;
  }

  BestPlayList copyWith({
    int? total,
    List<PlayList>? playList,
    int? rn,
    int? pn,
  }) =>
      BestPlayList(
        total: total ?? this.total,
        playList: playList ?? this.playList,
        rn: rn ?? this.rn,
        pn: pn ?? this.pn,
      );
}
