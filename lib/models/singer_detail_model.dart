class SingerDetail {
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

  SingerDetail(
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

  SingerDetail.fromJson(Map<String, dynamic> json) {
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

  static List<SingerDetail> fromList(List<Map<String, dynamic>> list) {
    return list.map((map) => SingerDetail.fromJson(map)).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["birthday"] = birthday;
    _data["country"] = country;
    _data["artistFans"] = artistFans;
    _data["albumNum"] = albumNum;
    _data["gener"] = gener;
    _data["weight"] = weight;
    _data["language"] = language;
    _data["mvNum"] = mvNum;
    _data["pic"] = pic;
    _data["upPcUrl"] = upPcUrl;
    _data["musicNum"] = musicNum;
    _data["pic120"] = pic120;
    _data["isStar"] = isStar;
    _data["birthplace"] = birthplace;
    _data["constellation"] = constellation;
    _data["content_type"] = contentType;
    _data["aartist"] = aartist;
    _data["name"] = name;
    _data["pic70"] = pic70;
    _data["id"] = id;
    _data["tall"] = tall;
    _data["pic300"] = pic300;
    _data["info"] = info;
    return _data;
  }

  SingerDetail copyWith({
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
      SingerDetail(
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
