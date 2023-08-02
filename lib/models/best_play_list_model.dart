import 'play_list_model.dart';

class BestPlayList {
  int? total;
  List<PlayList>? data;
  int? rn;
  int? pn;

  BestPlayList({this.total, this.data, this.rn, this.pn});

  BestPlayList.fromJson(Map<String, dynamic> json) {
    if (json["total"] is int) {
      total = json["total"];
    }
    if (json["data"] is List) {
      data = json["data"] == null
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
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["total"] = total;
    if (data != null) {
      _data["data"] = data?.map((e) => e.toJson()).toList();
    }
    _data["rn"] = rn;
    _data["pn"] = pn;
    return _data;
  }

  BestPlayList copyWith({
    int? total,
    List<PlayList>? data,
    int? rn,
    int? pn,
  }) =>
      BestPlayList(
        total: total ?? this.total,
        data: data ?? this.data,
        rn: rn ?? this.rn,
        pn: pn ?? this.pn,
      );
}
