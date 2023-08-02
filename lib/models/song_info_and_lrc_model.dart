class SongInfoAndLrcData {
  SongInfoAndLrc? data;
  String? msg;
  dynamic msgs;
  String? profileid;
  String? reqid;
  int? status;

  SongInfoAndLrcData(
      {this.data,
      this.msg,
      this.msgs,
      this.profileid,
      this.reqid,
      this.status});

  SongInfoAndLrcData.fromJson(Map<String, dynamic> json) {
    if (json["data"] is Map) {
      data =
          json["data"] == null ? null : SongInfoAndLrc.fromJson(json["data"]);
    }
    if (json["msg"] is String) {
      msg = json["msg"];
    }
    msgs = json["msgs"];
    if (json["profileid"] is String) {
      profileid = json["profileid"];
    }
    if (json["reqid"] is String) {
      reqid = json["reqid"];
    }
    if (json["status"] is int) {
      status = json["status"];
    }
  }

  static List<SongInfoAndLrcData> fromList(List<Map<String, dynamic>> list) {
    return list.map((map) => SongInfoAndLrcData.fromJson(map)).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    if (data != null) {
      _data["data"] = data?.toJson();
    }
    _data["msg"] = msg;
    _data["msgs"] = msgs;
    _data["profileid"] = profileid;
    _data["reqid"] = reqid;
    _data["status"] = status;
    return _data;
  }

  SongInfoAndLrcData copyWith({
    SongInfoAndLrc? data,
    String? msg,
    dynamic msgs,
    String? profileid,
    String? reqid,
    int? status,
  }) =>
      SongInfoAndLrcData(
        data: data ?? this.data,
        msg: msg ?? this.msg,
        msgs: msgs ?? this.msgs,
        profileid: profileid ?? this.profileid,
        reqid: reqid ?? this.reqid,
        status: status ?? this.status,
      );
}

class SongInfoAndLrc {
  List<LrcInfo>? lrclist;
  Simpl? simpl;
  Songinfo? songinfo;

  SongInfoAndLrc({this.lrclist, this.simpl, this.songinfo});

  SongInfoAndLrc.fromJson(Map<String, dynamic> json) {
    if (json["lrclist"] is List) {
      lrclist = json["lrclist"] == null
          ? null
          : (json["lrclist"] as List).map((e) => LrcInfo.fromJson(e)).toList();
    }
    if (json["simpl"] is Map) {
      simpl = json["simpl"] == null ? null : Simpl.fromJson(json["simpl"]);
    }
    if (json["songinfo"] is Map) {
      songinfo =
          json["songinfo"] == null ? null : Songinfo.fromJson(json["songinfo"]);
    }
  }

  static List<SongInfoAndLrc> fromList(List<Map<String, dynamic>> list) {
    return list.map((map) => SongInfoAndLrc.fromJson(map)).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    if (lrclist != null) {
      _data["lrclist"] = lrclist?.map((e) => e.toJson()).toList();
    }
    if (simpl != null) {
      _data["simpl"] = simpl?.toJson();
    }
    if (songinfo != null) {
      _data["songinfo"] = songinfo?.toJson();
    }
    return _data;
  }

  SongInfoAndLrc copyWith({
    List<LrcInfo>? lrclist,
    Simpl? simpl,
    Songinfo? songinfo,
  }) =>
      SongInfoAndLrc(
        lrclist: lrclist ?? this.lrclist,
        simpl: simpl ?? this.simpl,
        songinfo: songinfo ?? this.songinfo,
      );
}

class Songinfo {
  String? album;
  String? albumId;
  String? artist;
  String? artistId;
  String? contentType;
  List<String>? coopFormats;
  String? copyRight;
  String? duration;
  String? formats;
  dynamic hasEcho;
  String? hasMv;
  String? id;
  dynamic isExt;
  dynamic isNew;
  String? isPoint;
  dynamic isbatch;
  String? isdownload;
  String? isstar;
  String? mkvNsig1;
  String? mkvNsig2;
  String? mkvRid;
  String? mp3Nsig1;
  String? mp3Nsig2;
  String? mp3Rid;
  String? mp3Size;
  String? mp4Sig1;
  String? mp4Sig2;
  String? musicrId;
  String? mutiVer;
  dynamic mvpayinfo;
  dynamic mvpic;
  String? nsig1;
  String? nsig2;
  String? online;
  dynamic params;
  String? pay;
  String? pic;
  String? playCnt;
  dynamic rankChange;
  dynamic reason;
  dynamic score;
  String? score100;
  String? songName;
  String? songTimeMinutes;
  dynamic tpay;
  dynamic trend;
  String? upTime;
  String? uploader;

  Songinfo(
      {this.album,
      this.albumId,
      this.artist,
      this.artistId,
      this.contentType,
      this.coopFormats,
      this.copyRight,
      this.duration,
      this.formats,
      this.hasEcho,
      this.hasMv,
      this.id,
      this.isExt,
      this.isNew,
      this.isPoint,
      this.isbatch,
      this.isdownload,
      this.isstar,
      this.mkvNsig1,
      this.mkvNsig2,
      this.mkvRid,
      this.mp3Nsig1,
      this.mp3Nsig2,
      this.mp3Rid,
      this.mp3Size,
      this.mp4Sig1,
      this.mp4Sig2,
      this.musicrId,
      this.mutiVer,
      this.mvpayinfo,
      this.mvpic,
      this.nsig1,
      this.nsig2,
      this.online,
      this.params,
      this.pay,
      this.pic,
      this.playCnt,
      this.rankChange,
      this.reason,
      this.score,
      this.score100,
      this.songName,
      this.songTimeMinutes,
      this.tpay,
      this.trend,
      this.upTime,
      this.uploader});

  Songinfo.fromJson(Map<String, dynamic> json) {
    if (json["album"] is String) {
      album = json["album"];
    }
    if (json["albumId"] is String) {
      albumId = json["albumId"];
    }
    if (json["artist"] is String) {
      artist = json["artist"];
    }
    if (json["artistId"] is String) {
      artistId = json["artistId"];
    }
    if (json["contentType"] is String) {
      contentType = json["contentType"];
    }
    if (json["coopFormats"] is List) {
      coopFormats = json["coopFormats"] == null
          ? null
          : List<String>.from(json["coopFormats"]);
    }
    if (json["copyRight"] is String) {
      copyRight = json["copyRight"];
    }
    if (json["duration"] is String) {
      duration = json["duration"];
    }
    if (json["formats"] is String) {
      formats = json["formats"];
    }
    hasEcho = json["hasEcho"];
    if (json["hasMv"] is String) {
      hasMv = json["hasMv"];
    }
    if (json["id"] is String) {
      id = json["id"];
    }
    isExt = json["isExt"];
    isNew = json["isNew"];
    if (json["isPoint"] is String) {
      isPoint = json["isPoint"];
    }
    isbatch = json["isbatch"];
    if (json["isdownload"] is String) {
      isdownload = json["isdownload"];
    }
    if (json["isstar"] is String) {
      isstar = json["isstar"];
    }
    if (json["mkvNsig1"] is String) {
      mkvNsig1 = json["mkvNsig1"];
    }
    if (json["mkvNsig2"] is String) {
      mkvNsig2 = json["mkvNsig2"];
    }
    if (json["mkvRid"] is String) {
      mkvRid = json["mkvRid"];
    }
    if (json["mp3Nsig1"] is String) {
      mp3Nsig1 = json["mp3Nsig1"];
    }
    if (json["mp3Nsig2"] is String) {
      mp3Nsig2 = json["mp3Nsig2"];
    }
    if (json["mp3Rid"] is String) {
      mp3Rid = json["mp3Rid"];
    }
    if (json["mp3Size"] is String) {
      mp3Size = json["mp3Size"];
    }
    if (json["mp4sig1"] is String) {
      mp4Sig1 = json["mp4sig1"];
    }
    if (json["mp4sig2"] is String) {
      mp4Sig2 = json["mp4sig2"];
    }
    if (json["musicrId"] is String) {
      musicrId = json["musicrId"];
    }
    if (json["mutiVer"] is String) {
      mutiVer = json["mutiVer"];
    }
    mvpayinfo = json["mvpayinfo"];
    mvpic = json["mvpic"];
    if (json["nsig1"] is String) {
      nsig1 = json["nsig1"];
    }
    if (json["nsig2"] is String) {
      nsig2 = json["nsig2"];
    }
    if (json["online"] is String) {
      online = json["online"];
    }
    params = json["params"];
    if (json["pay"] is String) {
      pay = json["pay"];
    }
    if (json["pic"] is String) {
      pic = json["pic"];
    }
    if (json["playCnt"] is String) {
      playCnt = json["playCnt"];
    }
    rankChange = json["rankChange"];
    reason = json["reason"];
    score = json["score"];
    if (json["score100"] is String) {
      score100 = json["score100"];
    }
    if (json["songName"] is String) {
      songName = json["songName"];
    }
    if (json["songTimeMinutes"] is String) {
      songTimeMinutes = json["songTimeMinutes"];
    }
    tpay = json["tpay"];
    trend = json["trend"];
    if (json["upTime"] is String) {
      upTime = json["upTime"];
    }
    if (json["uploader"] is String) {
      uploader = json["uploader"];
    }
  }

  static List<Songinfo> fromList(List<Map<String, dynamic>> list) {
    return list.map((map) => Songinfo.fromJson(map)).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["album"] = album;
    _data["albumId"] = albumId;
    _data["artist"] = artist;
    _data["artistId"] = artistId;
    _data["contentType"] = contentType;
    if (coopFormats != null) {
      _data["coopFormats"] = coopFormats;
    }
    _data["copyRight"] = copyRight;
    _data["duration"] = duration;
    _data["formats"] = formats;
    _data["hasEcho"] = hasEcho;
    _data["hasMv"] = hasMv;
    _data["id"] = id;
    _data["isExt"] = isExt;
    _data["isNew"] = isNew;
    _data["isPoint"] = isPoint;
    _data["isbatch"] = isbatch;
    _data["isdownload"] = isdownload;
    _data["isstar"] = isstar;
    _data["mkvNsig1"] = mkvNsig1;
    _data["mkvNsig2"] = mkvNsig2;
    _data["mkvRid"] = mkvRid;
    _data["mp3Nsig1"] = mp3Nsig1;
    _data["mp3Nsig2"] = mp3Nsig2;
    _data["mp3Rid"] = mp3Rid;
    _data["mp3Size"] = mp3Size;
    _data["mp4sig1"] = mp4Sig1;
    _data["mp4sig2"] = mp4Sig2;
    _data["musicrId"] = musicrId;
    _data["mutiVer"] = mutiVer;
    _data["mvpayinfo"] = mvpayinfo;
    _data["mvpic"] = mvpic;
    _data["nsig1"] = nsig1;
    _data["nsig2"] = nsig2;
    _data["online"] = online;
    _data["params"] = params;
    _data["pay"] = pay;
    _data["pic"] = pic;
    _data["playCnt"] = playCnt;
    _data["rankChange"] = rankChange;
    _data["reason"] = reason;
    _data["score"] = score;
    _data["score100"] = score100;
    _data["songName"] = songName;
    _data["songTimeMinutes"] = songTimeMinutes;
    _data["tpay"] = tpay;
    _data["trend"] = trend;
    _data["upTime"] = upTime;
    _data["uploader"] = uploader;
    return _data;
  }

  Songinfo copyWith({
    String? album,
    String? albumId,
    String? artist,
    String? artistId,
    String? contentType,
    List<String>? coopFormats,
    String? copyRight,
    String? duration,
    String? formats,
    dynamic hasEcho,
    String? hasMv,
    String? id,
    dynamic isExt,
    dynamic isNew,
    String? isPoint,
    dynamic isbatch,
    String? isdownload,
    String? isstar,
    String? mkvNsig1,
    String? mkvNsig2,
    String? mkvRid,
    String? mp3Nsig1,
    String? mp3Nsig2,
    String? mp3Rid,
    String? mp3Size,
    String? mp4Sig1,
    String? mp4Sig2,
    String? musicrId,
    String? mutiVer,
    dynamic mvpayinfo,
    dynamic mvpic,
    String? nsig1,
    String? nsig2,
    String? online,
    dynamic params,
    String? pay,
    String? pic,
    String? playCnt,
    dynamic rankChange,
    dynamic reason,
    dynamic score,
    String? score100,
    String? songName,
    String? songTimeMinutes,
    dynamic tpay,
    dynamic trend,
    String? upTime,
    String? uploader,
  }) =>
      Songinfo(
        album: album ?? this.album,
        albumId: albumId ?? this.albumId,
        artist: artist ?? this.artist,
        artistId: artistId ?? this.artistId,
        contentType: contentType ?? this.contentType,
        coopFormats: coopFormats ?? this.coopFormats,
        copyRight: copyRight ?? this.copyRight,
        duration: duration ?? this.duration,
        formats: formats ?? this.formats,
        hasEcho: hasEcho ?? this.hasEcho,
        hasMv: hasMv ?? this.hasMv,
        id: id ?? this.id,
        isExt: isExt ?? this.isExt,
        isNew: isNew ?? this.isNew,
        isPoint: isPoint ?? this.isPoint,
        isbatch: isbatch ?? this.isbatch,
        isdownload: isdownload ?? this.isdownload,
        isstar: isstar ?? this.isstar,
        mkvNsig1: mkvNsig1 ?? this.mkvNsig1,
        mkvNsig2: mkvNsig2 ?? this.mkvNsig2,
        mkvRid: mkvRid ?? this.mkvRid,
        mp3Nsig1: mp3Nsig1 ?? this.mp3Nsig1,
        mp3Nsig2: mp3Nsig2 ?? this.mp3Nsig2,
        mp3Rid: mp3Rid ?? this.mp3Rid,
        mp3Size: mp3Size ?? this.mp3Size,
        mp4Sig1: mp4Sig1 ?? this.mp4Sig1,
        mp4Sig2: mp4Sig2 ?? this.mp4Sig2,
        musicrId: musicrId ?? this.musicrId,
        mutiVer: mutiVer ?? this.mutiVer,
        mvpayinfo: mvpayinfo ?? this.mvpayinfo,
        mvpic: mvpic ?? this.mvpic,
        nsig1: nsig1 ?? this.nsig1,
        nsig2: nsig2 ?? this.nsig2,
        online: online ?? this.online,
        params: params ?? this.params,
        pay: pay ?? this.pay,
        pic: pic ?? this.pic,
        playCnt: playCnt ?? this.playCnt,
        rankChange: rankChange ?? this.rankChange,
        reason: reason ?? this.reason,
        score: score ?? this.score,
        score100: score100 ?? this.score100,
        songName: songName ?? this.songName,
        songTimeMinutes: songTimeMinutes ?? this.songTimeMinutes,
        tpay: tpay ?? this.tpay,
        trend: trend ?? this.trend,
        upTime: upTime ?? this.upTime,
        uploader: uploader ?? this.uploader,
      );
}

class Simpl {
  List<dynamic>? musiclist;
  List<Playlist>? playlist;

  Simpl({this.musiclist, this.playlist});

  Simpl.fromJson(Map<String, dynamic> json) {
    if (json["musiclist"] is List) {
      musiclist = json["musiclist"] ?? [];
    }
    if (json["playlist"] is List) {
      playlist = json["playlist"] == null
          ? null
          : (json["playlist"] as List)
              .map((e) => Playlist.fromJson(e))
              .toList();
    }
  }

  static List<Simpl> fromList(List<Map<String, dynamic>> list) {
    return list.map((map) => Simpl.fromJson(map)).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    if (musiclist != null) {
      _data["musiclist"] = musiclist;
    }
    if (playlist != null) {
      _data["playlist"] = playlist?.map((e) => e.toJson()).toList();
    }
    return _data;
  }

  Simpl copyWith({
    List<dynamic>? musiclist,
    List<Playlist>? playlist,
  }) =>
      Simpl(
        musiclist: musiclist ?? this.musiclist,
        playlist: playlist ?? this.playlist,
      );
}

class Playlist {
  String? digest;
  String? disname;
  String? extend;
  String? info;
  String? isnew;
  String? name;
  String? newcount;
  String? nodeid;
  String? pic;
  String? playcnt;
  String? source;
  String? sourceid;
  String? tag;

  Playlist(
      {this.digest,
      this.disname,
      this.extend,
      this.info,
      this.isnew,
      this.name,
      this.newcount,
      this.nodeid,
      this.pic,
      this.playcnt,
      this.source,
      this.sourceid,
      this.tag});

  Playlist.fromJson(Map<String, dynamic> json) {
    if (json["digest"] is String) {
      digest = json["digest"];
    }
    if (json["disname"] is String) {
      disname = json["disname"];
    }
    if (json["extend"] is String) {
      extend = json["extend"];
    }
    if (json["info"] is String) {
      info = json["info"];
    }
    if (json["isnew"] is String) {
      isnew = json["isnew"];
    }
    if (json["name"] is String) {
      name = json["name"];
    }
    if (json["newcount"] is String) {
      newcount = json["newcount"];
    }
    if (json["nodeid"] is String) {
      nodeid = json["nodeid"];
    }
    if (json["pic"] is String) {
      pic = json["pic"];
    }
    if (json["playcnt"] is String) {
      playcnt = json["playcnt"];
    }
    if (json["source"] is String) {
      source = json["source"];
    }
    if (json["sourceid"] is String) {
      sourceid = json["sourceid"];
    }
    if (json["tag"] is String) {
      tag = json["tag"];
    }
  }

  static List<Playlist> fromList(List<Map<String, dynamic>> list) {
    return list.map((map) => Playlist.fromJson(map)).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["digest"] = digest;
    _data["disname"] = disname;
    _data["extend"] = extend;
    _data["info"] = info;
    _data["isnew"] = isnew;
    _data["name"] = name;
    _data["newcount"] = newcount;
    _data["nodeid"] = nodeid;
    _data["pic"] = pic;
    _data["playcnt"] = playcnt;
    _data["source"] = source;
    _data["sourceid"] = sourceid;
    _data["tag"] = tag;
    return _data;
  }

  Playlist copyWith({
    String? digest,
    String? disname,
    String? extend,
    String? info,
    String? isnew,
    String? name,
    String? newcount,
    String? nodeid,
    String? pic,
    String? playcnt,
    String? source,
    String? sourceid,
    String? tag,
  }) =>
      Playlist(
        digest: digest ?? this.digest,
        disname: disname ?? this.disname,
        extend: extend ?? this.extend,
        info: info ?? this.info,
        isnew: isnew ?? this.isnew,
        name: name ?? this.name,
        newcount: newcount ?? this.newcount,
        nodeid: nodeid ?? this.nodeid,
        pic: pic ?? this.pic,
        playcnt: playcnt ?? this.playcnt,
        source: source ?? this.source,
        sourceid: sourceid ?? this.sourceid,
        tag: tag ?? this.tag,
      );
}

class LrcInfo {
  String? lineLyric;
  String? time;

  LrcInfo({this.lineLyric, this.time});

  LrcInfo.fromJson(Map<String, dynamic> json) {
    if (json["lineLyric"] is String) {
      lineLyric = json["lineLyric"];
    }
    if (json["time"] is String) {
      time = json["time"];
    }
  }

  static List<LrcInfo> fromList(List<Map<String, dynamic>> list) {
    return list.map((map) => LrcInfo.fromJson(map)).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["lineLyric"] = lineLyric;
    _data["time"] = time;
    return _data;
  }

  LrcInfo copyWith({
    String? lineLyric,
    String? time,
  }) =>
      LrcInfo(
        lineLyric: lineLyric ?? this.lineLyric,
        time: time ?? this.time,
      );
}
