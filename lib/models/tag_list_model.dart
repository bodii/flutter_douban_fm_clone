class Tags {
  String? img;
  String? mdigest;
  List<Tag>? tagList;
  String? name;
  String? id;
  String? type;
  String? img1;

  Tags(
      {this.img,
      this.mdigest,
      this.tagList,
      this.name,
      this.id,
      this.type,
      this.img1});

  Tags.fromJson(Map<String, dynamic> json) {
    if (json["img"] is String) {
      img = json["img"];
    }
    if (json["mdigest"] is String) {
      mdigest = json["mdigest"];
    }
    if (json["data"] is List) {
      tagList = json["data"] == null
          ? null
          : (json["data"] as List).map((e) => Tag.fromJson(e)).toList();
    }
    if (json["name"] is String) {
      name = json["name"];
    }
    if (json["id"] is String) {
      id = json["id"];
    }
    if (json["type"] is String) {
      type = json["type"];
    }
    if (json["img1"] is String) {
      img1 = json["img1"];
    }
  }

  static List<Tags> fromList(List<Map<String, dynamic>> list) {
    return list.map((map) => Tags.fromJson(map)).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["img"] = img;
    data["mdigest"] = mdigest;
    data["data"] = tagList!.map((e) => e.toJson()).toList();
    data["name"] = name;
    data["id"] = id;
    data["type"] = type;
    data["img1"] = img1;
    return data;
  }

  Tags copyWith({
    String? img,
    String? mdigest,
    List<Tag>? tagList,
    String? name,
    String? id,
    String? type,
    String? img1,
  }) =>
      Tags(
        img: img ?? this.img,
        mdigest: mdigest ?? this.mdigest,
        tagList: tagList ?? this.tagList,
        name: name ?? this.name,
        id: id ?? this.id,
        type: type ?? this.type,
        img1: img1 ?? this.img1,
      );
}

class Tag {
  String? extend;
  String? img;
  String? digest;
  String? name;
  String? isnew;
  String? id;

  Tag({this.extend, this.img, this.digest, this.name, this.isnew, this.id});

  Tag.fromJson(Map<String, dynamic> json) {
    if (json["extend"] is String) {
      extend = json["extend"];
    }
    if (json["img"] is String) {
      img = json["img"];
    }
    if (json["digest"] is String) {
      digest = json["digest"];
    }
    if (json["name"] is String) {
      name = json["name"];
    }
    if (json["isnew"] is String) {
      isnew = json["isnew"];
    }
    if (json["id"] is String) {
      id = json["id"];
    }
  }

  static List<Tag> fromList(List<Map<String, dynamic>> list) {
    return list.map((map) => Tag.fromJson(map)).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["extend"] = extend;
    data["img"] = img;
    data["digest"] = digest;
    data["name"] = name;
    data["isnew"] = isnew;
    data["id"] = id;
    return data;
  }

  Tag copyWith({
    String? extend,
    String? img,
    String? digest,
    String? name,
    String? isnew,
    String? id,
  }) =>
      Tag(
        extend: extend ?? this.extend,
        img: img ?? this.img,
        digest: digest ?? this.digest,
        name: name ?? this.name,
        isnew: isnew ?? this.isnew,
        id: id ?? this.id,
      );
}
