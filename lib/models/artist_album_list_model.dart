import 'album_model.dart';

class ArtistAlbumList {
  late String? total;
  late List<Album>? albumList;

  ArtistAlbumList({
    this.total,
    this.albumList,
  });

  ArtistAlbumList.fromJson(Map<String, dynamic> json) {
    if (json["total"] is String) {
      total = json["total"];
    }
    if (json["albumList"] is List) {
      albumList = (json["albumList"] == null
          ? null
          : (json["albumList"] as List).map((e) => Album.fromJson(e)).toList());
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["total"] = total;
    if (albumList != null) {
      data["albumList"] = albumList?.map((e) => e.toJson()).toList();
    }
    return data;
  }

  ArtistAlbumList copyWith({
    String? total,
    List<Album>? albumList,
  }) =>
      ArtistAlbumList(
        total: total ?? this.total,
        albumList: albumList ?? this.albumList,
      );
}
