class MusicPlayUrl {
  String? url;

  MusicPlayUrl({this.url});

  MusicPlayUrl.fromJson(Map<String, dynamic> json) {
    if (json["url"] is String) {
      url = json["url"];
    }
  }

  static List<MusicPlayUrl> fromList(List<Map<String, dynamic>> list) {
    return list.map((map) => MusicPlayUrl.fromJson(map)).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["url"] = url;
    return data;
  }

  MusicPlayUrl copyWith({
    String? url,
  }) =>
      MusicPlayUrl(
        url: url ?? this.url,
      );
}
