class SearchMVResult {
  String? total;
  List<MV>? mvlist;

  SearchMVResult({this.total, this.mvlist});

  SearchMVResult.fromJson(Map<String, dynamic> json) {
    if (json["total"] is String) {
      total = json["total"];
    }
    if (json["mvlist"] is List) {
      mvlist = json["mvlist"] == null
          ? null
          : (json["mvlist"] as List).map((e) => MV.fromJson(e)).toList();
    }
  }

  static List<SearchMVResult> fromList(List<Map<String, dynamic>> list) {
    return list.map((map) => SearchMVResult.fromJson(map)).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["total"] = total;
    if (mvlist != null) {
      _data["mvlist"] = mvlist?.map((e) => e.toJson()).toList();
    }
    return _data;
  }

  SearchMVResult copyWith({
    String? total,
    List<MV>? mvlist,
  }) =>
      SearchMVResult(
        total: total ?? this.total,
        mvlist: mvlist ?? this.mvlist,
      );
}

class MV {
  int? duration;
  String? artist;
  int? mvPlayCnt;
  String? name;
  int? online;
  int? artistid;
  String? songTimeMinutes;
  int? id;
  String? pic;

  MV(
      {this.duration,
      this.artist,
      this.mvPlayCnt,
      this.name,
      this.online,
      this.artistid,
      this.songTimeMinutes,
      this.id,
      this.pic});

  MV.fromJson(Map<String, dynamic> json) {
    if (json["duration"] is int) {
      duration = json["duration"];
    }
    if (json["artist"] is String) {
      artist = json["artist"];
    }
    if (json["mvPlayCnt"] is int) {
      mvPlayCnt = json["mvPlayCnt"];
    }
    if (json["name"] is String) {
      name = json["name"];
    }
    if (json["online"] is int) {
      online = json["online"];
    }
    if (json["artistid"] is int) {
      artistid = json["artistid"];
    }
    if (json["songTimeMinutes"] is String) {
      songTimeMinutes = json["songTimeMinutes"];
    }
    if (json["id"] is int) {
      id = json["id"];
    }
    if (json["pic"] is String) {
      pic = json["pic"];
    }
  }

  static List<MV> fromList(List<Map<String, dynamic>> list) {
    return list.map((map) => MV.fromJson(map)).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["duration"] = duration;
    _data["artist"] = artist;
    _data["mvPlayCnt"] = mvPlayCnt;
    _data["name"] = name;
    _data["online"] = online;
    _data["artistid"] = artistid;
    _data["songTimeMinutes"] = songTimeMinutes;
    _data["id"] = id;
    _data["pic"] = pic;
    return _data;
  }

  MV copyWith({
    int? duration,
    String? artist,
    int? mvPlayCnt,
    String? name,
    int? online,
    int? artistid,
    String? songTimeMinutes,
    int? id,
    String? pic,
  }) =>
      MV(
        duration: duration ?? this.duration,
        artist: artist ?? this.artist,
        mvPlayCnt: mvPlayCnt ?? this.mvPlayCnt,
        name: name ?? this.name,
        online: online ?? this.online,
        artistid: artistid ?? this.artistid,
        songTimeMinutes: songTimeMinutes ?? this.songTimeMinutes,
        id: id ?? this.id,
        pic: pic ?? this.pic,
      );
}
