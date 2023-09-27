class MySongList {
  late int id;
  late String name;
  late String cover;
  late int userId;
  late int songNum;
  late int createdAt;

  MySongList({
    required this.id,
    required this.name,
    required this.cover,
    required this.userId,
    required this.songNum,
    required this.createdAt,
  });

  MySongList.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    name = json["name"];
    cover = json["cover"];
    userId = json["user_id"];
    songNum = json['song_num'];
    createdAt = json["created_at"];
  }

  static List<MySongList> fromList(List<Map<String, dynamic>> list) {
    return list.map((map) => MySongList.fromJson(map)).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data["id"] = id;
    data["name"] = name;
    data["cover"] = cover;
    data["user_id"] = userId;
    data['song_num'] = songNum;
    data["created_at"] = createdAt;
    return data;
  }

  MySongList copyWith({
    int? id,
    String? name,
    String? cover,
    int? userId,
    int? songNum,
    int? createdAt,
  }) =>
      MySongList(
        id: id ?? this.id,
        name: name ?? this.name,
        cover: cover ?? this.cover,
        userId: userId ?? this.userId,
        songNum: songNum ?? this.songNum,
        createdAt: createdAt ?? this.createdAt,
      );
}
