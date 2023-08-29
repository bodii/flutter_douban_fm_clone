class MusicInfo {
  String? musicrid;
  String? barrage;
  String? adType;
  String? artist;
  Mvpayinfo? mvpayinfo;
  String? pic;
  int? isstar;
  int? rid;
  String? upPcStr;
  int? duration;
  String? score100;
  String? adSubtype;
  String? contentType;
  int? mvPlayCnt;
  int? track;
  bool? hasLossless;
  int? hasmv;
  String? releaseDate;
  String? album;
  int? albumid;
  String? pay;
  int? artistid;
  String? albumpic;
  int? originalsongtype;
  String? songTimeMinutes;
  bool? isListenFee;
  String? mvUpPcStr;
  String? pic120;
  String? albuminfo;
  String? name;
  int? online;
  PayInfo? payInfo;
  String? tmeMusicianAdtype;

  MusicInfo({
    this.musicrid,
    this.barrage,
    this.adType,
    this.artist,
    this.mvpayinfo,
    this.pic,
    this.isstar,
    this.rid,
    this.upPcStr,
    this.duration,
    this.score100,
    this.adSubtype,
    this.contentType,
    this.mvPlayCnt,
    this.track,
    this.hasLossless,
    this.hasmv,
    this.releaseDate,
    this.album,
    this.albumid,
    this.pay,
    this.artistid,
    this.albumpic,
    this.originalsongtype,
    this.songTimeMinutes,
    this.isListenFee,
    this.mvUpPcStr,
    this.pic120,
    this.albuminfo,
    this.name,
    this.online,
    this.payInfo,
    this.tmeMusicianAdtype,
  });

  MusicInfo.fromJson(Map<String, dynamic> json) {
    if (json["musicrid"] is String) {
      musicrid = json["musicrid"];
    }
    if (json["barrage"] is String) {
      barrage = json["barrage"];
    }
    if (json["ad_type"] is String) {
      adType = json["ad_type"];
    }
    if (json["artist"] is String) {
      artist = json["artist"];
    }
    if (json["mvpayinfo"] is Map) {
      mvpayinfo = json["mvpayinfo"] == null
          ? null
          : Mvpayinfo.fromJson(json["mvpayinfo"]);
    }
    if (json["pic"] is String) {
      pic = json["pic"];
    }
    if (json["isstar"] is int) {
      isstar = json["isstar"];
    }
    if (json["rid"] is int) {
      rid = json["rid"];
    }
    if (json['upPcStr'] != null && json["upPcStr"] is String) {
      upPcStr = json["upPcStr"];
    }
    if (json["duration"] is int) {
      duration = json["duration"];
    }
    if (json["score100"] is String) {
      score100 = json["score100"];
    }
    if (json["ad_subtype"] is String) {
      adSubtype = json["ad_subtype"];
    }
    if (json["content_type"] is String) {
      contentType = json["content_type"];
    }
    if (json["mvPlayCnt"] is int) {
      mvPlayCnt = json["mvPlayCnt"];
    }
    if (json["track"] is int) {
      track = json["track"];
    }
    if (json["hasLossless"] is bool) {
      hasLossless = json["hasLossless"];
    }
    if (json["hasmv"] is int) {
      hasmv = json["hasmv"];
    }

    if (json["releaseDate"] != null) {
      releaseDate = json["releaseDate"];
    } else if (json["releasedate"] != null) {
      releaseDate = json["releasedate"];
    }

    if (json["album"] is String) {
      album = json["album"];
    }
    if (json["albumid"] is int) {
      albumid = json["albumid"];
    }
    if (json["pay"] is String) {
      pay = json["pay"];
    }
    if (json["artistid"] is int) {
      artistid = json["artistid"];
    }
    if (json["albumpic"] is String) {
      albumpic = json["albumpic"];
    }
    if (json["originalsongtype"] is int) {
      originalsongtype = json["originalsongtype"];
    }
    if (json["songTimeMinutes"] is String) {
      songTimeMinutes = json["songTimeMinutes"];
    }
    if (json["isListenFee"] is bool) {
      isListenFee = json["isListenFee"];
    }
    if (json["mvUpPcStr"] is String) {
      mvUpPcStr = json["mvUpPcStr"];
    }
    if (json["pic120"] is String) {
      pic120 = json["pic120"];
    }
    if (json["albuminfo"] is String) {
      albuminfo = json["albuminfo"];
    }
    if (json["name"] is String) {
      name = json["name"];
    }
    if (json["online"] is int) {
      online = json["online"];
    }
    if (json["payInfo"] is Map) {
      payInfo =
          json["payInfo"] == null ? null : PayInfo.fromJson(json["payInfo"]);
    }
    if (json["tme_musician_adtype"] is String) {
      tmeMusicianAdtype = json["tme_musician_adtype"];
    }
  }

  static List<MusicInfo> fromList(List<Map<String, dynamic>> list) {
    return list.map((map) => MusicInfo.fromJson(map)).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["musicrid"] = musicrid;
    data["barrage"] = barrage;
    data["ad_type"] = adType ?? '';
    data["artist"] = artist;
    if (mvpayinfo != null) {
      data["mvpayinfo"] = mvpayinfo?.toJson();
    }
    data["pic"] = pic;
    data["isstar"] = isstar;
    data["rid"] = rid;
    data["upPcStr"] = upPcStr;
    data["duration"] = duration;
    data["score100"] = score100;
    data["ad_subtype"] = adSubtype ?? '';
    data["content_type"] = contentType;
    data["mvPlayCnt"] = mvPlayCnt;
    data["track"] = track;
    data["hasLossless"] = hasLossless;
    data["hasmv"] = hasmv;
    data["releaseDate"] = releaseDate;
    data["album"] = album;
    data["albumid"] = albumid;
    data["pay"] = pay;
    data["artistid"] = artistid;
    data["albumpic"] = albumpic;
    data["originalsongtype"] = originalsongtype;
    data["songTimeMinutes"] = songTimeMinutes;
    data["isListenFee"] = isListenFee;
    data["mvUpPcStr"] = mvUpPcStr;
    data["pic120"] = pic120;
    data["albuminfo"] = albuminfo;
    data["name"] = name;
    data["online"] = online;
    if (payInfo != null) {
      data["payInfo"] = payInfo?.toJson();
    }
    data["tme_musician_adtype"] = tmeMusicianAdtype;
    return data;
  }

  MusicInfo copyWith({
    String? musicrid,
    String? barrage,
    String? adType,
    String? artist,
    Mvpayinfo? mvpayinfo,
    String? pic,
    int? isstar,
    int? rid,
    String? upPcStr,
    int? duration,
    String? score100,
    String? adSubtype,
    String? contentType,
    int? mvPlayCnt,
    int? track,
    bool? hasLossless,
    int? hasmv,
    String? releaseDate,
    String? album,
    int? albumid,
    String? pay,
    int? artistid,
    String? albumpic,
    int? originalsongtype,
    String? songTimeMinutes,
    bool? isListenFee,
    String? mvUpPcStr,
    String? pic120,
    String? albuminfo,
    String? name,
    int? online,
    PayInfo? payInfo,
    String? tmeMusicianAdtype,
  }) =>
      MusicInfo(
        musicrid: musicrid ?? this.musicrid,
        barrage: barrage ?? this.barrage,
        adType: adType ?? this.adType,
        artist: artist ?? this.artist,
        mvpayinfo: mvpayinfo ?? this.mvpayinfo,
        pic: pic ?? this.pic,
        isstar: isstar ?? this.isstar,
        rid: rid ?? this.rid,
        upPcStr: upPcStr ?? this.upPcStr,
        duration: duration ?? this.duration,
        score100: score100 ?? this.score100,
        adSubtype: adSubtype ?? this.adSubtype,
        contentType: contentType ?? this.contentType,
        mvPlayCnt: mvPlayCnt ?? this.mvPlayCnt,
        track: track ?? this.track,
        hasLossless: hasLossless ?? this.hasLossless,
        hasmv: hasmv ?? this.hasmv,
        releaseDate: releaseDate ?? this.releaseDate,
        album: album ?? this.album,
        albumid: albumid ?? this.albumid,
        pay: pay ?? this.pay,
        artistid: artistid ?? this.artistid,
        albumpic: albumpic ?? this.albumpic,
        originalsongtype: originalsongtype ?? this.originalsongtype,
        songTimeMinutes: songTimeMinutes ?? this.songTimeMinutes,
        isListenFee: isListenFee ?? this.isListenFee,
        mvUpPcStr: mvUpPcStr ?? this.mvUpPcStr,
        pic120: pic120 ?? this.pic120,
        albuminfo: albuminfo ?? this.albuminfo,
        name: name ?? this.name,
        online: online ?? this.online,
        payInfo: payInfo ?? this.payInfo,
        tmeMusicianAdtype: tmeMusicianAdtype ?? this.tmeMusicianAdtype,
      );
}

class PayInfo {
  String? play;
  String? nplay;
  String? overseasNplay;
  String? localEncrypt;
  int? limitfree;
  int? refrainStart;
  FeeType? feeType;
  String? down;
  String? ndown;
  String? download;
  int? cannotDownload;
  String? overseasNdown;
  int? refrainEnd;
  int? cannotOnlinePlay;
  Paytagindex? paytagindex;
  String? tipsIntercept;

  PayInfo(
      {this.play,
      this.nplay,
      this.overseasNplay,
      this.localEncrypt,
      this.limitfree,
      this.refrainStart,
      this.feeType,
      this.down,
      this.ndown,
      this.download,
      this.cannotDownload,
      this.overseasNdown,
      this.refrainEnd,
      this.cannotOnlinePlay,
      this.paytagindex,
      this.tipsIntercept});

  PayInfo.fromJson(Map<String, dynamic> json) {
    if (json["play"] is String) {
      play = json["play"];
    }
    if (json["nplay"] is String) {
      nplay = json["nplay"];
    }
    if (json["overseas_nplay"] is String) {
      overseasNplay = json["overseas_nplay"];
    }
    if (json["local_encrypt"] is String) {
      localEncrypt = json["local_encrypt"];
    }
    if (json["limitfree"] is int) {
      limitfree = json["limitfree"];
    }
    if (json["refrain_start"] is int) {
      refrainStart = json["refrain_start"];
    }
    if (json["feeType"] is Map) {
      feeType =
          json["feeType"] == null ? null : FeeType.fromJson(json["feeType"]);
    }
    if (json["down"] != null) {
      down = json["down"];
    }
    if (json["ndown"] is String) {
      ndown = json["ndown"];
    }
    if (json["download"] != null) {
      download = json["download"];
    }
    if (json["cannotDownload"] is int) {
      cannotDownload = json["cannotDownload"];
    }
    if (json["overseas_ndown"] is String) {
      overseasNdown = json["overseas_ndown"];
    }
    if (json["refrain_end"] is int) {
      refrainEnd = json["refrain_end"];
    }
    if (json["cannotOnlinePlay"] is int) {
      cannotOnlinePlay = json["cannotOnlinePlay"];
    }
    if (json["paytagindex"] is Map) {
      paytagindex = json["paytagindex"] == null
          ? null
          : Paytagindex.fromJson(json["paytagindex"]);
    }
    if (json["tips_intercept"] is String) {
      tipsIntercept = json["tips_intercept"];
    }
  }

  static List<PayInfo> fromList(List<Map<String, dynamic>> list) {
    return list.map((map) => PayInfo.fromJson(map)).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["play"] = play;
    data["nplay"] = nplay;
    data["overseas_nplay"] = overseasNplay;
    data["local_encrypt"] = localEncrypt;
    data["limitfree"] = limitfree;
    data["refrain_start"] = refrainStart;
    if (feeType != null) {
      data["feeType"] = feeType?.toJson();
    }
    data["down"] = down;
    data["ndown"] = ndown;
    data["download"] = download;
    data["cannotDownload"] = cannotDownload;
    data["overseas_ndown"] = overseasNdown;
    data["refrain_end"] = refrainEnd;
    data["cannotOnlinePlay"] = cannotOnlinePlay;
    if (paytagindex != null) {
      data["paytagindex"] = paytagindex?.toJson();
    }
    data["tips_intercept"] = tipsIntercept;
    return data;
  }

  PayInfo copyWith({
    String? play,
    String? nplay,
    String? overseasNplay,
    String? localEncrypt,
    int? limitfree,
    int? refrainStart,
    FeeType? feeType,
    String? down,
    String? ndown,
    String? download,
    int? cannotDownload,
    String? overseasNdown,
    int? refrainEnd,
    int? cannotOnlinePlay,
    Paytagindex? paytagindex,
    String? tipsIntercept,
  }) =>
      PayInfo(
        play: play ?? this.play,
        nplay: nplay ?? this.nplay,
        overseasNplay: overseasNplay ?? this.overseasNplay,
        localEncrypt: localEncrypt ?? this.localEncrypt,
        limitfree: limitfree ?? this.limitfree,
        refrainStart: refrainStart ?? this.refrainStart,
        feeType: feeType ?? this.feeType,
        down: down ?? this.down,
        ndown: ndown ?? this.ndown,
        download: download ?? this.download,
        cannotDownload: cannotDownload ?? this.cannotDownload,
        overseasNdown: overseasNdown ?? this.overseasNdown,
        refrainEnd: refrainEnd ?? this.refrainEnd,
        cannotOnlinePlay: cannotOnlinePlay ?? this.cannotOnlinePlay,
        paytagindex: paytagindex ?? this.paytagindex,
        tipsIntercept: tipsIntercept ?? this.tipsIntercept,
      );
}

class Paytagindex {
  int? s;
  int? f;
  int? zp;
  int? h;
  int? zpga201;
  int? zply;
  int? hr;
  int? l;
  int? zpga501;
  int? db;
  int? ar501;

  Paytagindex(
      {this.s,
      this.f,
      this.zp,
      this.h,
      this.zpga201,
      this.zply,
      this.hr,
      this.l,
      this.zpga501,
      this.db,
      this.ar501});

  Paytagindex.fromJson(Map<String, dynamic> json) {
    if (json["S"] is int) {
      s = json["S"];
    }
    if (json["F"] is int) {
      f = json["F"];
    }
    if (json["ZP"] is int) {
      zp = json["ZP"];
    }
    if (json["H"] is int) {
      h = json["H"];
    }
    if (json["ZPGA201"] is int) {
      zpga201 = json["ZPGA201"];
    }
    if (json["ZPLY"] is int) {
      zply = json["ZPLY"];
    }
    if (json["HR"] is int) {
      hr = json["HR"];
    }
    if (json["L"] is int) {
      l = json["L"];
    }
    if (json["ZPGA501"] is int) {
      zpga501 = json["ZPGA501"];
    }
    if (json["DB"] is int) {
      db = json["DB"];
    }
    if (json["AR501"] is int) {
      ar501 = json["AR501"];
    }
  }

  static List<Paytagindex> fromList(List<Map<String, dynamic>> list) {
    return list.map((map) => Paytagindex.fromJson(map)).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["S"] = s;
    data["F"] = f;
    data["ZP"] = zp;
    data["H"] = h;
    data["ZPGA201"] = zpga201;
    data["ZPLY"] = zply;
    data["HR"] = hr;
    data["L"] = l;
    data["ZPGA501"] = zpga501;
    data["DB"] = db;
    data["AR501"] = ar501;
    return data;
  }

  Paytagindex copyWith({
    int? s,
    int? f,
    int? zp,
    int? h,
    int? zpga201,
    int? zply,
    int? hr,
    int? l,
    int? zpga501,
    int? db,
    int? ar501,
  }) =>
      Paytagindex(
        s: s ?? this.s,
        f: f ?? this.f,
        zp: zp ?? this.zp,
        h: h ?? this.h,
        zpga201: zpga201 ?? this.zpga201,
        zply: zply ?? this.zply,
        hr: hr ?? this.hr,
        l: l ?? this.l,
        zpga501: zpga501 ?? this.zpga501,
        db: db ?? this.db,
        ar501: ar501 ?? this.ar501,
      );
}

class FeeType {
  String? song;
  String? album;
  String? vip;
  String? bookvip;

  FeeType({this.song, this.album, this.vip, this.bookvip});

  FeeType.fromJson(Map<String, dynamic> json) {
    if (json["song"] is String) {
      song = json["song"];
    }
    if (json["album"] is String) {
      album = json["album"];
    }
    if (json["vip"] is String) {
      vip = json["vip"];
    }
    if (json["bookvip"] is String) {
      bookvip = json["bookvip"];
    }
  }

  static List<FeeType> fromList(List<Map<String, dynamic>> list) {
    return list.map((map) => FeeType.fromJson(map)).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["song"] = song;
    data["album"] = album;
    data["vip"] = vip;
    data["bookvip"] = bookvip;
    return data;
  }

  FeeType copyWith({
    String? song,
    String? album,
    String? vip,
    String? bookvip,
  }) =>
      FeeType(
        song: song ?? this.song,
        album: album ?? this.album,
        vip: vip ?? this.vip,
        bookvip: bookvip ?? this.bookvip,
      );
}

class Mvpayinfo {
  int? play;
  int? vid;
  String? download;

  Mvpayinfo({this.play, this.vid, this.download});

  Mvpayinfo.fromJson(Map<String, dynamic> json) {
    if (json["play"] is int) {
      play = json["play"];
    }
    if (json["vid"] is int) {
      vid = json["vid"];
    }
    if (json["down"] is int || json['download'] is String) {
      if (json['down'] != null) {
        download = json['down'].toString();
      } else if (json['download'] != null) {
        download = json['download'];
      }
    }
  }

  static List<Mvpayinfo> fromList(List<Map<String, dynamic>> list) {
    return list.map((map) => Mvpayinfo.fromJson(map)).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["play"] = play;
    data["vid"] = vid;
    data["down"] = download;
    data["download"] = download;
    return data;
  }

  Mvpayinfo copyWith({
    int? play,
    int? vid,
    String? download,
  }) =>
      Mvpayinfo(
        play: play ?? this.play,
        vid: vid ?? this.vid,
        download: download ?? this.download,
      );
}
