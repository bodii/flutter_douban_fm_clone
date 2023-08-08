import 'artist_list_info_model.dart';

class SearchArtistResult {
  String? total;
  int? rn;
  List<Artist>? list;
  List<Artist>? artistList;
  int? pn;

  SearchArtistResult(
      {this.total, this.rn, this.list, this.artistList, this.pn});

  SearchArtistResult.fromJson(Map<String, dynamic> json) {
    if (json["total"] is String) {
      total = json["total"];
    }
    if (json["rn"] is int) {
      rn = json["rn"];
    }
    if (json["list"] is List) {
      list = json["list"] == null
          ? null
          : (json["list"] as List).map((e) => Artist.fromJson(e)).toList();
    }
    if (json["artistList"] is List) {
      artistList = json["artistList"] == null
          ? null
          : (json["artistList"] as List)
              .map((e) => Artist.fromJson(e))
              .toList();
    }
    if (json["pn"] is int) {
      pn = json["pn"];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["total"] = total;
    data["rn"] = rn;
    if (list != null) {
      data["list"] = list?.map((e) => e.toJson()).toList();
    }
    if (artistList != null) {
      data["artistList"] = artistList?.map((e) => e.toJson()).toList();
    }
    data["pn"] = pn;
    return data;
  }

  SearchArtistResult copyWith({
    String? total,
    int? rn,
    List<Artist>? list,
    List<Artist>? artistList,
    int? pn,
  }) =>
      SearchArtistResult(
        total: total ?? this.total,
        rn: rn ?? this.rn,
        list: list ?? this.list,
        artistList: artistList ?? this.artistList,
        pn: pn ?? this.pn,
      );
}
