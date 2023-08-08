import 'play_list_model.dart';

class SearchPlayListResult {
  String? total;
  List<PlayList>? list;

  SearchPlayListResult({this.total, this.list});

  SearchPlayListResult.fromJson(Map<String, dynamic> json) {
    if (json["total"] is String) {
      total = json["total"];
    }
    if (json["list"] is List) {
      list = json["list"] == null
          ? null
          : (json["list"] as List).map((e) => PlayList.fromJson(e)).toList();
    }
  }

  static List<SearchPlayListResult> fromList(List<Map<String, dynamic>> list) {
    return list.map((map) => SearchPlayListResult.fromJson(map)).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["total"] = total;
    if (list != null) {
      data["list"] = list?.map((e) => e.toJson()).toList();
    }
    return data;
  }

  SearchPlayListResult copyWith({
    String? total,
    List<PlayList>? list,
  }) =>
      SearchPlayListResult(
        total: total ?? this.total,
        list: list ?? this.list,
      );
}
