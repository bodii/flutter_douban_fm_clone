import 'artist_album_list_model.dart';

class SearchAlbumResult {
  String? total;
  List<Album>? albumList;

  SearchAlbumResult({this.total, this.albumList});

  SearchAlbumResult.fromJson(Map<String, dynamic> json) {
    if (json["total"] is String) {
      total = json["total"];
    }
    if (json["albumList"] is List) {
      albumList = json["albumList"] == null
          ? null
          : (json["albumList"] as List).map((e) => Album.fromJson(e)).toList();
    }
  }

  static List<SearchAlbumResult> fromList(List<Map<String, dynamic>> list) {
    return list.map((map) => SearchAlbumResult.fromJson(map)).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["total"] = total;
    if (albumList != null) {
      data["albumList"] = albumList?.map((e) => e.toJson()).toList();
    }
    return data;
  }

  SearchAlbumResult copyWith({
    String? total,
    List<Album>? albumList,
  }) =>
      SearchAlbumResult(
        total: total ?? this.total,
        albumList: albumList ?? this.albumList,
      );
}
