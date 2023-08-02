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
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["total"] = total;
    if (artistList != null) {
      _data["artistList"] = artistList?.map((e) => e.toJson()).toList();
    }
    return _data;
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

class Artist {
  late int? artistFans;
  late int? albumNum;
  late int? mvNum;
  late String? pic;
  late int? musicNum;
  late String? pic120;
  late int? isStar;
  late String? contentType;
  late String? aartist;
  late String? name;
  late String? pic70;
  late int? id;
  late String? pic300;

  Artist(
      {this.artistFans,
      this.albumNum,
      this.mvNum,
      this.pic,
      this.musicNum,
      this.pic120,
      this.isStar,
      this.contentType,
      this.aartist,
      this.name,
      this.pic70,
      this.id,
      this.pic300});

  Artist.fromJson(Map<String, dynamic> json) {
    if (json["artistFans"] is int) {
      artistFans = json["artistFans"];
    }
    if (json["albumNum"] is int) {
      albumNum = json["albumNum"];
    }
    if (json["mvNum"] is int) {
      mvNum = json["mvNum"];
    }
    if (json["pic"] is String) {
      pic = json["pic"];
    }
    if (json["musicNum"] is int) {
      musicNum = json["musicNum"];
    }
    if (json["pic120"] is String) {
      pic120 = json["pic120"];
    }
    if (json["isStar"] is int) {
      isStar = json["isStar"];
    }
    if (json["content_type"] is String) {
      contentType = json["content_type"];
    }
    if (json["aartist"] is String) {
      aartist = json["aartist"];
    }
    if (json["name"] is String) {
      name = json["name"];
    }
    if (json["pic70"] is String) {
      pic70 = json["pic70"];
    }
    if (json["id"] is int) {
      id = json["id"];
    }
    if (json["pic300"] is String) {
      pic300 = json["pic300"];
    }
  }

  static List<ArtistList> fromList(List<Map<String, dynamic>> list) {
    return list.map((map) => ArtistList.fromJson(map)).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["artistFans"] = artistFans;
    _data["albumNum"] = albumNum;
    _data["mvNum"] = mvNum;
    _data["pic"] = pic;
    _data["musicNum"] = musicNum;
    _data["pic120"] = pic120;
    _data["isStar"] = isStar;
    _data["content_type"] = contentType;
    _data["aartist"] = aartist;
    _data["name"] = name;
    _data["pic70"] = pic70;
    _data["id"] = id;
    _data["pic300"] = pic300;
    return _data;
  }

  Artist copyWith({
    int? artistFans,
    int? albumNum,
    int? mvNum,
    String? pic,
    int? musicNum,
    String? pic120,
    int? isStar,
    String? contentType,
    String? aartist,
    String? name,
    String? pic70,
    int? id,
    String? pic300,
  }) =>
      Artist(
        artistFans: artistFans ?? this.artistFans,
        albumNum: albumNum ?? this.albumNum,
        mvNum: mvNum ?? this.mvNum,
        pic: pic ?? this.pic,
        musicNum: musicNum ?? this.musicNum,
        pic120: pic120 ?? this.pic120,
        isStar: isStar ?? this.isStar,
        contentType: contentType ?? this.contentType,
        aartist: aartist ?? this.aartist,
        name: name ?? this.name,
        pic70: pic70 ?? this.pic70,
        id: id ?? this.id,
        pic300: pic300 ?? this.pic300,
      );
}
