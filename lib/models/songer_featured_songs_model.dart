class SongerFeaturedSongs {
  final String? total;
  final List<SongsList>? list;

  SongerFeaturedSongs({
    this.total,
    this.list,
  });

  SongerFeaturedSongs copyWith({
    String? total,
    List<SongsList>? list,
  }) =>
      SongerFeaturedSongs(
        total: total ?? this.total,
        list: list ?? this.list,
      );
}

class SongsList {
  final String? musicrid;
  final String? barrage;
  final String? adType;
  final String? artist;
  final Mvpayinfo? mvpayinfo;
  final String? nationid;
  final String? pic;
  final int? isstar;
  final int? rid;
  final int? duration;
  final String? score100;
  final String? adSubtype;
  final String? contentType;
  final int? track;
  final bool? hasLossless;
  final int? hasmv;
  final DateTime? releaseDate;
  final String? album;
  final int? albumid;
  final String? pay;
  final int? artistid;
  final String? albumpic;
  final int? originalsongtype;
  final String? songTimeMinutes;
  final bool? isListenFee;
  final String? pic120;
  final String? name;
  final int? online;
  final PayInfo? payInfo;
  final String? tmeMusicianAdtype;

  SongsList({
    this.musicrid,
    this.barrage,
    this.adType,
    this.artist,
    this.mvpayinfo,
    this.nationid,
    this.pic,
    this.isstar,
    this.rid,
    this.duration,
    this.score100,
    this.adSubtype,
    this.contentType,
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
    this.pic120,
    this.name,
    this.online,
    this.payInfo,
    this.tmeMusicianAdtype,
  });

  SongsList copyWith({
    String? musicrid,
    String? barrage,
    String? adType,
    String? artist,
    Mvpayinfo? mvpayinfo,
    String? nationid,
    String? pic,
    int? isstar,
    int? rid,
    int? duration,
    String? score100,
    String? adSubtype,
    String? contentType,
    int? track,
    bool? hasLossless,
    int? hasmv,
    DateTime? releaseDate,
    String? album,
    int? albumid,
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
    String? tmeMusicianAdtype,
  }) =>
      SongsList(
        musicrid: musicrid ?? this.musicrid,
        barrage: barrage ?? this.barrage,
        adType: adType ?? this.adType,
        artist: artist ?? this.artist,
        mvpayinfo: mvpayinfo ?? this.mvpayinfo,
        nationid: nationid ?? this.nationid,
        pic: pic ?? this.pic,
        isstar: isstar ?? this.isstar,
        rid: rid ?? this.rid,
        duration: duration ?? this.duration,
        score100: score100 ?? this.score100,
        adSubtype: adSubtype ?? this.adSubtype,
        contentType: contentType ?? this.contentType,
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
        pic120: pic120 ?? this.pic120,
        name: name ?? this.name,
        online: online ?? this.online,
        payInfo: payInfo ?? this.payInfo,
        tmeMusicianAdtype: tmeMusicianAdtype ?? this.tmeMusicianAdtype,
      );
}

class Mvpayinfo {
  final int? play;
  final int? vid;
  final int? down;

  Mvpayinfo({
    this.play,
    this.vid,
    this.down,
  });

  Mvpayinfo copyWith({
    int? play,
    int? vid,
    int? down,
  }) =>
      Mvpayinfo(
        play: play ?? this.play,
        vid: vid ?? this.vid,
        down: down ?? this.down,
      );
}

class PayInfo {
  final String? play;
  final String? nplay;
  final String? overseasNplay;
  final String? localEncrypt;
  final int? limitfree;
  final int? refrainStart;
  final FeeType? feeType;
  final String? down;
  final String? ndown;
  final String? download;
  final int? cannotDownload;
  final String? overseasNdown;
  final int? refrainEnd;
  final int? cannotOnlinePlay;
  final Map<String, int>? paytagindex;
  final String? listenFragment;

  PayInfo({
    this.play,
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
    this.listenFragment,
  });

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
    Map<String, int>? paytagindex,
    String? listenFragment,
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
        listenFragment: listenFragment ?? this.listenFragment,
      );
}

class FeeType {
  final String? vip;
  final String? song;

  FeeType({
    this.vip,
    this.song,
  });

  FeeType copyWith({
    String? vip,
    String? song,
  }) =>
      FeeType(
        vip: vip ?? this.vip,
        song: song ?? this.song,
      );
}
