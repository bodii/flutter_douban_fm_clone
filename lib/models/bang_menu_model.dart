class BangMenu {
  String? name;
  List<BangList>? list;

  BangMenu({this.name, this.list});

  BangMenu.fromJson(Map<String, dynamic> json) {
    if (json["name"] is String) {
      name = json["name"];
    }
    if (json["list"] is List) {
      list = json["list"] == null
          ? null
          : (json["list"] as List).map((e) => BangList.fromJson(e)).toList();
    }
  }

  static List<BangMenu> fromList(List<Map<String, dynamic>> list) {
    return list.map((map) => BangMenu.fromJson(map)).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["name"] = name;
    if (list != null) {
      data["list"] = list?.map((e) => e.toJson()).toList();
    }
    return data;
  }

  BangMenu copyWith({
    String? name,
    List<BangList>? list,
  }) =>
      BangMenu(
        name: name ?? this.name,
        list: list ?? this.list,
      );
}

class BangList {
  String? sourceid;
  String? intro;
  String? name;
  String? id;
  String? source;
  String? pic;
  String? pub;

  BangList(
      {this.sourceid,
      this.intro,
      this.name,
      this.id,
      this.source,
      this.pic,
      this.pub});

  BangList.fromJson(Map<String, dynamic> json) {
    if (json["sourceid"] is String) {
      sourceid = json["sourceid"];
    }
    if (json["intro"] is String) {
      intro = json["intro"];
    }
    if (json["name"] is String) {
      name = json["name"];
    }
    if (json["id"] is String) {
      id = json["id"];
    }
    if (json["source"] is String) {
      source = json["source"];
    }
    if (json["pic"] is String) {
      pic = json["pic"];
    }
    if (json["pub"] is String) {
      pub = json["pub"];
    }
  }

  static List<BangList> fromList(List<Map<String, dynamic>> list) {
    return list.map((map) => BangList.fromJson(map)).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["sourceid"] = sourceid;
    data["intro"] = intro;
    data["name"] = name;
    data["id"] = id;
    data["source"] = source;
    data["pic"] = pic;
    data["pub"] = pub;
    return data;
  }

  BangList copyWith({
    String? sourceid,
    String? intro,
    String? name,
    String? id,
    String? source,
    String? pic,
    String? pub,
  }) =>
      BangList(
        sourceid: sourceid ?? this.sourceid,
        intro: intro ?? this.intro,
        name: name ?? this.name,
        id: id ?? this.id,
        source: source ?? this.source,
        pic: pic ?? this.pic,
        pub: pub ?? this.pub,
      );
}
