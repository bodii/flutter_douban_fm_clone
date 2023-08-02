class Tags {
  String? img;
  String? mdigest;
  List<Tag>? data;
  String? name;
  String? id;
  String? type;
  String? img1;

  Tags(
      {this.img,
      this.mdigest,
      this.data,
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
      data = json["data"] == null
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
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["img"] = img;
    _data["mdigest"] = mdigest;
    if (data != null) {
      _data["data"] = data?.map((e) => e.toJson()).toList();
    }
    _data["name"] = name;
    _data["id"] = id;
    _data["type"] = type;
    _data["img1"] = img1;
    return _data;
  }

  Tags copyWith({
    String? img,
    String? mdigest,
    List<Tag>? data,
    String? name,
    String? id,
    String? type,
    String? img1,
  }) =>
      Tags(
        img: img ?? this.img,
        mdigest: mdigest ?? this.mdigest,
        data: data ?? this.data,
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
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["extend"] = extend;
    _data["img"] = img;
    _data["digest"] = digest;
    _data["name"] = name;
    _data["isnew"] = isnew;
    _data["id"] = id;
    return _data;
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
