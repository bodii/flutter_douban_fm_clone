import 'artist_model.dart';

class ArtistList {
  late String? total;
  late List<Artist>? artistList;

  ArtistList({this.total, this.artistList});

  ArtistList.fromJson(Map<String, dynamic> json) {
    if (json["total"] is String) {
      total = json["total"];
    }
    if (json["artistList"] is List) {
      artistList = json["artistList"] == null
          ? null
          : (json["artistList"] as List)
              .map((e) => Artist.fromJson(e))
              .toList();
    }
  }

  static List<ArtistList> fromList(List<Map<String, dynamic>> list) {
    return list.map((map) => ArtistList.fromJson(map)).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["total"] = total;
    if (artistList != null) {
      data["artistList"] = artistList?.map((e) => e.toJson()).toList();
    }
    return data;
  }

  ArtistList copyWith({
    String? total,
    List<Artist>? artistList,
  }) =>
      ArtistList(
        total: total ?? this.total,
        artistList: artistList ?? this.artistList,
      );
}
