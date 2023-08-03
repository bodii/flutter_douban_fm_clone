class ArtistFeaturedSongs {
  late int? total;
  late List<Song>? list;

  ArtistFeaturedSongs({this.total, this.list});

  ArtistFeaturedSongs.fromJson(Map<String, dynamic> json) {
    if (json["total"] is int) {
      total = json["total"];
    }
    if (json["list"] is List) {
      list = json["list"] == null
          ? null
          : (json["list"] as List).map((e) => Song.fromJson(e)).toList();
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["total"] = total;
    if (list != null) {
      data["list"] = list?.map((e) => e.toJson()).toList();
    }
    return data;
  }

  ArtistFeaturedSongs copyWith({
    int? total,
    List<Song>? list,
  }) =>
      ArtistFeaturedSongs(
        total: total ?? this.total,
        list: list ?? this.list,
      );
}

class Song {
  late String? musicrid;
  late String? barrage;
  late String? artist;
  late Mvpayinfo? mvpayinfo;
  late String? pic;
  late int? isstar;
  late String? releasedate;
  late int? rid;
  late int? duration;
  late String? score100;
  late String? contentType;
  late int? track;
  late bool? hasLossless;
  late int? hasmv;
  late String? album;
  late String? albumid;
  late String? pay;
  late int? artistid;
  late String? albumpic;
  late int? originalsongtype;
  late String? songTimeMinutes;
  late bool? isListenFee;
  late String? pic120;
  late String? name;
  late int? online;
  late PayInfo? payInfo;

  Song(
      {this.musicrid,
      this.barrage,
      this.artist,
      this.mvpayinfo,
      this.pic,
      this.isstar,
      this.releasedate,
      this.rid,
      this.duration,
      this.score100,
      this.contentType,
      this.track,
      this.hasLossless,
      this.hasmv,
      this.album,
      this.albumid,
      this.pay,
      this.artistid,
      this.albumpic,
      this.originalsongtype,
      this.songTimeMinutes,
      this.isListenFee,
      this.pic120,
      this.name,
      this.online,
      this.payInfo});

  Song.fromJson(Map<String, dynamic> json) {
    if (json["musicrid"] is String) {
      musicrid = json["musicrid"];
    }
    if (json["barrage"] is String) {
      barrage = json["barrage"];
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
    if (json["releasedate"] is String) {
      releasedate = json["releasedate"];
    }
    if (json["rid"] is int) {
      rid = json["rid"];
    }
    if (json["duration"] is int) {
      duration = json["duration"];
    }
    if (json["score100"] is String) {
      score100 = json["score100"];
    }
    if (json["content_type"] is String) {
      contentType = json["content_type"];
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
    if (json["album"] is String) {
      album = json["album"];
    }
    if (json["albumid"] is String) {
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
    if (json["pic120"] is String) {
      pic120 = json["pic120"];
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
  }

  static List<Song> fromList(List<Map<String, dynamic>> list) {
    return list.map((map) => Song.fromJson(map)).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["musicrid"] = musicrid;
    data["barrage"] = barrage;
    data["artist"] = artist;
    if (mvpayinfo != null) {
      data["mvpayinfo"] = mvpayinfo?.toJson();
    }
    data["pic"] = pic;
    data["isstar"] = isstar;
    data["releasedate"] = releasedate;
    data["rid"] = rid;
    data["duration"] = duration;
    data["score100"] = score100;
    data["content_type"] = contentType;
    data["track"] = track;
    data["hasLossless"] = hasLossless;
    data["hasmv"] = hasmv;
    data["album"] = album;
    data["albumid"] = albumid;
    data["pay"] = pay;
    data["artistid"] = artistid;
    data["albumpic"] = albumpic;
    data["originalsongtype"] = originalsongtype;
    data["songTimeMinutes"] = songTimeMinutes;
    data["isListenFee"] = isListenFee;
    data["pic120"] = pic120;
    data["name"] = name;
    data["online"] = online;
    if (payInfo != null) {
      data["payInfo"] = payInfo?.toJson();
    }
    return data;
  }

  Song copyWith({
    String? musicrid,
    String? barrage,
    String? artist,
    Mvpayinfo? mvpayinfo,
    String? pic,
    int? isstar,
    String? releasedate,
    int? rid,
    int? duration,
    String? score100,
    String? contentType,
    int? track,
    bool? hasLossless,
    int? hasmv,
    String? album,
    String? albumid,
    String? pay,
    int? artistid,
    String? albumpic,
    int? originalsongtype,
    String? songTimeMinutes,
    bool? isListenFee,
    String? pic120,
    String? name,
    int? online,
    PayInfo? payInfo,
  }) =>
      Song(
        musicrid: musicrid ?? this.musicrid,
        barrage: barrage ?? this.barrage,
        artist: artist ?? this.artist,
        mvpayinfo: mvpayinfo ?? this.mvpayinfo,
        pic: pic ?? this.pic,
        isstar: isstar ?? this.isstar,
        releasedate: releasedate ?? this.releasedate,
        rid: rid ?? this.rid,
        duration: duration ?? this.duration,
        score100: score100 ?? this.score100,
        contentType: contentType ?? this.contentType,
        track: track ?? this.track,
        hasLossless: hasLossless ?? this.hasLossless,
        hasmv: hasmv ?? this.hasmv,
        album: album ?? this.album,
        albumid: albumid ?? this.albumid,
        pay: pay ?? this.pay,
        artistid: artistid ?? this.artistid,
        albumpic: albumpic ?? this.albumpic,
        originalsongtype: originalsongtype ?? this.originalsongtype,
        songTimeMinutes: songTimeMinutes ?? this.songTimeMinutes,
        isListenFee: isListenFee ?? this.isListenFee,
        pic120: pic120 ?? this.pic120,
        name: name ?? this.name,
        online: online ?? this.online,
        payInfo: payInfo ?? this.payInfo,
      );
}

class PayInfo {
  late String? nplay;
  late String? play;
  late String? overseasNplay;
  late String? localEncrypt;
  late String? limitfree;
  late String? refrainStart;
  late FeeType? feeType;
  late String? ndown;
  late String? download;
  late String? cannotDownload;
  late String? overseasNdown;
  late String? cannotOnlinePlay;
  late String? listenFragment;
  late String? refrainEnd;
  late Paytagindex? paytagindex;
  late String? tipsIntercept;

  PayInfo(
      {this.nplay,
      this.play,
      this.overseasNplay,
      this.localEncrypt,
      this.limitfree,
      this.refrainStart,
      this.feeType,
      this.ndown,
      this.download,
      this.cannotDownload,
      this.overseasNdown,
      this.cannotOnlinePlay,
      this.listenFragment,
      this.refrainEnd,
      this.paytagindex,
      this.tipsIntercept});

  PayInfo.fromJson(Map<String, dynamic> json) {
    if (json["nplay"] is String) {
      nplay = json["nplay"];
    }
    if (json["play"] is String) {
      play = json["play"];
    }
    if (json["overseas_nplay"] is String) {
      overseasNplay = json["overseas_nplay"];
    }
    if (json["local_encrypt"] is String) {
      localEncrypt = json["local_encrypt"];
    }
    if (json["limitfree"] is String) {
      limitfree = json["limitfree"];
    }
    if (json["refrain_start"] is String) {
      refrainStart = json["refrain_start"];
    }
    if (json["feeType"] is Map) {
      feeType =
          json["feeType"] == null ? null : FeeType.fromJson(json["feeType"]);
    }
    if (json["ndown"] is String) {
      ndown = json["ndown"];
    }
    if (json["download"] is String) {
      download = json["download"];
    }
    if (json["cannotDownload"] is String) {
      cannotDownload = json["cannotDownload"];
    }
    if (json["overseas_ndown"] is String) {
      overseasNdown = json["overseas_ndown"];
    }
    if (json["cannotOnlinePlay"] is String) {
      cannotOnlinePlay = json["cannotOnlinePlay"];
    }
    if (json["listen_fragment"] is String) {
      listenFragment = json["listen_fragment"];
    }
    if (json["refrain_end"] is String) {
      refrainEnd = json["refrain_end"];
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

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["nplay"] = nplay;
    data["play"] = play;
    data["overseas_nplay"] = overseasNplay;
    data["local_encrypt"] = localEncrypt;
    data["limitfree"] = limitfree;
    data["refrain_start"] = refrainStart;
    if (feeType != null) {
      data["feeType"] = feeType?.toJson();
    }
    data["ndown"] = ndown;
    data["download"] = download;
    data["cannotDownload"] = cannotDownload;
    data["overseas_ndown"] = overseasNdown;
    data["cannotOnlinePlay"] = cannotOnlinePlay;
    data["listen_fragment"] = listenFragment;
    data["refrain_end"] = refrainEnd;
    if (paytagindex != null) {
      data["paytagindex"] = paytagindex?.toJson();
    }
    data["tips_intercept"] = tipsIntercept;
    return data;
  }

  PayInfo copyWith({
    String? nplay,
    String? play,
    String? overseasNplay,
    String? localEncrypt,
    String? limitfree,
    String? refrainStart,
    FeeType? feeType,
    String? ndown,
    String? download,
    String? cannotDownload,
    String? overseasNdown,
    String? cannotOnlinePlay,
    String? listenFragment,
    String? refrainEnd,
    Paytagindex? paytagindex,
    String? tipsIntercept,
  }) =>
      PayInfo(
        nplay: nplay ?? this.nplay,
        play: play ?? this.play,
        overseasNplay: overseasNplay ?? this.overseasNplay,
        localEncrypt: localEncrypt ?? this.localEncrypt,
        limitfree: limitfree ?? this.limitfree,
        refrainStart: refrainStart ?? this.refrainStart,
        feeType: feeType ?? this.feeType,
        ndown: ndown ?? this.ndown,
        download: download ?? this.download,
        cannotDownload: cannotDownload ?? this.cannotDownload,
        overseasNdown: overseasNdown ?? this.overseasNdown,
        cannotOnlinePlay: cannotOnlinePlay ?? this.cannotOnlinePlay,
        listenFragment: listenFragment ?? this.listenFragment,
        refrainEnd: refrainEnd ?? this.refrainEnd,
        paytagindex: paytagindex ?? this.paytagindex,
        tipsIntercept: tipsIntercept ?? this.tipsIntercept,
      );
}

class Paytagindex {
  late int? s;
  late int? f;
  late int? zp;
  late int? h;
  late int? zpga201;
  late int? zply;
  late int? hr;
  late int? l;
  late int? zpga501;
  late int? db;
  late int? ar501;

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
  late String? song;
  late String? album;
  late String? vip;
  late String? bookvip;

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
  late String? play;
  late String? vid;
  late String? download;

  Mvpayinfo({this.play, this.vid, this.download});

  Mvpayinfo.fromJson(Map<String, dynamic> json) {
    if (json["play"] is String) {
      play = json["play"];
    }
    if (json["vid"] is String) {
      vid = json["vid"];
    }
    if (json["download"] is String) {
      download = json["download"];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["play"] = play;
    data["vid"] = vid;
    data["download"] = download;
    return data;
  }

  Mvpayinfo copyWith({
    String? play,
    String? vid,
    String? download,
  }) =>
      Mvpayinfo(
        play: play ?? this.play,
        vid: vid ?? this.vid,
        download: download ?? this.download,
      );
}
