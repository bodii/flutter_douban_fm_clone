import 'play_list_model.dart';

class RecommendedPlayList {
  List<PlayList>? list;

  RecommendedPlayList({this.list});

  RecommendedPlayList.fromJson(Map<String, dynamic> json) {
    if (json["list"] is List) {
      list = json["list"] == null
          ? null
          : (json["list"] as List).map((e) => PlayList.fromJson(e)).toList();
    }
  }

  static List<RecommendedPlayList> fromList(List<Map<String, dynamic>> list) {
    return list.map((map) => RecommendedPlayList.fromJson(map)).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (list != null) {
      data["list"] = list?.map((e) => e.toJson()).toList();
    }
    return data;
  }

  RecommendedPlayList copyWith({
    List<PlayList>? list,
  }) =>
      RecommendedPlayList(
        list: list ?? this.list,
      );
}
