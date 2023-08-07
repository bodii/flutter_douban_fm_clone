import 'music_info_model.dart';

class SearchMusicResult {
  String? total;
  List<MusicInfo>? list;

  SearchMusicResult({this.total, this.list});

  SearchMusicResult.fromJson(Map<String, dynamic> json) {
    if (json["total"] is String) {
      total = json["total"];
    }
    if (json["list"] is List) {
      list = json["list"] == null
          ? null
          : (json["list"] as List).map((e) => MusicInfo.fromJson(e)).toList();
    }
  }

  static List<SearchMusicResult> fromList(List<Map<String, dynamic>> list) {
    return list.map((map) => SearchMusicResult.fromJson(map)).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data["total"] = total;
    if (list != null) {
      data["list"] = list?.map((e) => e.toJson()).toList();
    }
    return data;
  }

  SearchMusicResult copyWith({
    String? total,
    List<MusicInfo>? list,
  }) =>
      SearchMusicResult(
        total: total ?? this.total,
        list: list ?? this.list,
      );
}
