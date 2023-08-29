import 'package:flutter_douban_fm_clone/models/music_info_model.dart';

class ArtistFeaturedSongs {
  late int? total;
  late List<MusicInfo>? list;

  ArtistFeaturedSongs({this.total, this.list});

  ArtistFeaturedSongs.fromJson(Map<String, dynamic> json) {
    if (json["total"] is int) {
      total = json["total"];
    }
    if (json["list"] is List) {
      list = json["list"] == null
          ? null
          : (json["list"] as List).map((e) => MusicInfo.fromJson(e)).toList();
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["total"] = total;
    if (list != null) {
      data["list"] = list?.map((e) => e.toJson()).toList();
    }
    return data;
  }

  ArtistFeaturedSongs copyWith({
    int? total,
    List<MusicInfo>? list,
  }) =>
      ArtistFeaturedSongs(
        total: total ?? this.total,
        list: list ?? this.list,
      );
}
