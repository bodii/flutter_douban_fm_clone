class ArtistDetail {
  late String? birthday;
  late String? country;
  late int? artistFans;
  late int? albumNum;
  late String? gener;
  late String? weight;
  late String? language;
  late int? mvNum;
  late String? pic;
  late String? upPcUrl;
  late int? musicNum;
  late String? pic120;
  late int? isStar;
  late String? birthplace;
  late String? constellation;
  late String? contentType;
  late String? aartist;
  late String? name;
  late String? pic70;
  late int? id;
  late String? tall;
  late String? pic300;
  late String? info;

  ArtistDetail(
      {this.birthday,
      this.country,
      this.artistFans,
      this.albumNum,
      this.gener,
      this.weight,
      this.language,
      this.mvNum,
      this.pic,
      this.upPcUrl,
      this.musicNum,
      this.pic120,
      this.isStar,
      this.birthplace,
      this.constellation,
      this.contentType,
      this.aartist,
      this.name,
      this.pic70,
      this.id,
      this.tall,
      this.pic300,
      this.info});

  ArtistDetail.fromJson(Map<String, dynamic> json) {
    if (json["birthday"] is String) {
      birthday = json["birthday"];
    }
    if (json["country"] is String) {
      country = json["country"];
    }
    if (json["artistFans"] is int) {
      artistFans = json["artistFans"];
    }
    if (json["albumNum"] is int) {
      albumNum = json["albumNum"];
    }
    if (json["gener"] is String) {
      gener = json["gener"];
    }
    if (json["weight"] is String) {
      weight = json["weight"];
    }
    if (json["language"] is String) {
      language = json["language"];
    }
    if (json["mvNum"] is int) {
      mvNum = json["mvNum"];
    }
    if (json["pic"] is String) {
      pic = json["pic"];
    }
    if (json["upPcUrl"] is String) {
      upPcUrl = json["upPcUrl"];
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
    if (json["birthplace"] is String) {
      birthplace = json["birthplace"];
    }
    if (json["constellation"] is String) {
      constellation = json["constellation"];
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
    if (json["tall"] is String) {
      tall = json["tall"];
    }
    if (json["pic300"] is String) {
      pic300 = json["pic300"];
    }
    if (json["info"] is String) {
      info = json["info"];
    }
  }

  static List<ArtistDetail> fromList(List<Map<String, dynamic>> list) {
    return list.map((map) => ArtistDetail.fromJson(map)).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["birthday"] = birthday;
    data["country"] = country;
    data["artistFans"] = artistFans;
    data["albumNum"] = albumNum;
    data["gener"] = gener;
    data["weight"] = weight;
    data["language"] = language;
    data["mvNum"] = mvNum;
    data["pic"] = pic;
    data["upPcUrl"] = upPcUrl;
    data["musicNum"] = musicNum;
    data["pic120"] = pic120;
    data["isStar"] = isStar;
    data["birthplace"] = birthplace;
    data["constellation"] = constellation;
    data["content_type"] = contentType;
    data["aartist"] = aartist;
    data["name"] = name;
    data["pic70"] = pic70;
    data["id"] = id;
    data["tall"] = tall;
    data["pic300"] = pic300;
    data["info"] = info;
    return data;
  }

  ArtistDetail copyWith({
    String? birthday,
    String? country,
    int? artistFans,
    int? albumNum,
    String? gener,
    String? weight,
    String? language,
    int? mvNum,
    String? pic,
    String? upPcUrl,
    int? musicNum,
    String? pic120,
    int? isStar,
    String? birthplace,
    String? constellation,
    String? contentType,
    String? aartist,
    String? name,
    String? pic70,
    int? id,
    String? tall,
    String? pic300,
    String? info,
  }) =>
      ArtistDetail(
        birthday: birthday ?? this.birthday,
        country: country ?? this.country,
        artistFans: artistFans ?? this.artistFans,
        albumNum: albumNum ?? this.albumNum,
        gener: gener ?? this.gener,
        weight: weight ?? this.weight,
        language: language ?? this.language,
        mvNum: mvNum ?? this.mvNum,
        pic: pic ?? this.pic,
        upPcUrl: upPcUrl ?? this.upPcUrl,
        musicNum: musicNum ?? this.musicNum,
        pic120: pic120 ?? this.pic120,
        isStar: isStar ?? this.isStar,
        birthplace: birthplace ?? this.birthplace,
        constellation: constellation ?? this.constellation,
        contentType: contentType ?? this.contentType,
        aartist: aartist ?? this.aartist,
        name: name ?? this.name,
        pic70: pic70 ?? this.pic70,
        id: id ?? this.id,
        tall: tall ?? this.tall,
        pic300: pic300 ?? this.pic300,
        info: info ?? this.info,
      );
}
