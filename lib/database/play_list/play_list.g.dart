// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'play_list.dart';

// **************************************************************************
// RealmObjectGenerator
// **************************************************************************

class PlayList extends _PlayList
    with RealmEntity, RealmObjectBase, RealmObject {
  PlayList(
    int id, {
    String? img,
    String? uPic,
    String? uname,
    String? img700,
    String? img300,
    String? userName,
    String? img500,
    int? isOfficial,
    int? total,
    String? name,
    int? listencnt,
    String? desc,
    String? info,
    Iterable<MusicInfo> musicList = const [],
  }) {
    RealmObjectBase.set(this, 'id', id);
    RealmObjectBase.set(this, 'img', img);
    RealmObjectBase.set(this, 'uPic', uPic);
    RealmObjectBase.set(this, 'uname', uname);
    RealmObjectBase.set(this, 'img700', img700);
    RealmObjectBase.set(this, 'img300', img300);
    RealmObjectBase.set(this, 'userName', userName);
    RealmObjectBase.set(this, 'img500', img500);
    RealmObjectBase.set(this, 'isOfficial', isOfficial);
    RealmObjectBase.set(this, 'total', total);
    RealmObjectBase.set(this, 'name', name);
    RealmObjectBase.set(this, 'listencnt', listencnt);
    RealmObjectBase.set(this, 'desc', desc);
    RealmObjectBase.set(this, 'info', info);
    RealmObjectBase.set<RealmList<MusicInfo>>(
        this, 'musicList', RealmList<MusicInfo>(musicList));
  }

  PlayList._();

  @override
  int get id => RealmObjectBase.get<int>(this, 'id') as int;
  @override
  set id(int value) => RealmObjectBase.set(this, 'id', value);

  @override
  String? get img => RealmObjectBase.get<String>(this, 'img') as String?;
  @override
  set img(String? value) => RealmObjectBase.set(this, 'img', value);

  @override
  String? get uPic => RealmObjectBase.get<String>(this, 'uPic') as String?;
  @override
  set uPic(String? value) => RealmObjectBase.set(this, 'uPic', value);

  @override
  String? get uname => RealmObjectBase.get<String>(this, 'uname') as String?;
  @override
  set uname(String? value) => RealmObjectBase.set(this, 'uname', value);

  @override
  String? get img700 => RealmObjectBase.get<String>(this, 'img700') as String?;
  @override
  set img700(String? value) => RealmObjectBase.set(this, 'img700', value);

  @override
  String? get img300 => RealmObjectBase.get<String>(this, 'img300') as String?;
  @override
  set img300(String? value) => RealmObjectBase.set(this, 'img300', value);

  @override
  String? get userName =>
      RealmObjectBase.get<String>(this, 'userName') as String?;
  @override
  set userName(String? value) => RealmObjectBase.set(this, 'userName', value);

  @override
  String? get img500 => RealmObjectBase.get<String>(this, 'img500') as String?;
  @override
  set img500(String? value) => RealmObjectBase.set(this, 'img500', value);

  @override
  int? get isOfficial => RealmObjectBase.get<int>(this, 'isOfficial') as int?;
  @override
  set isOfficial(int? value) => RealmObjectBase.set(this, 'isOfficial', value);

  @override
  int? get total => RealmObjectBase.get<int>(this, 'total') as int?;
  @override
  set total(int? value) => RealmObjectBase.set(this, 'total', value);

  @override
  String? get name => RealmObjectBase.get<String>(this, 'name') as String?;
  @override
  set name(String? value) => RealmObjectBase.set(this, 'name', value);

  @override
  int? get listencnt => RealmObjectBase.get<int>(this, 'listencnt') as int?;
  @override
  set listencnt(int? value) => RealmObjectBase.set(this, 'listencnt', value);

  @override
  RealmList<MusicInfo> get musicList =>
      RealmObjectBase.get<MusicInfo>(this, 'musicList') as RealmList<MusicInfo>;
  @override
  set musicList(covariant RealmList<MusicInfo> value) =>
      throw RealmUnsupportedSetError();

  @override
  String? get desc => RealmObjectBase.get<String>(this, 'desc') as String?;
  @override
  set desc(String? value) => RealmObjectBase.set(this, 'desc', value);

  @override
  String? get info => RealmObjectBase.get<String>(this, 'info') as String?;
  @override
  set info(String? value) => RealmObjectBase.set(this, 'info', value);

  @override
  Stream<RealmObjectChanges<PlayList>> get changes =>
      RealmObjectBase.getChanges<PlayList>(this);

  @override
  PlayList freeze() => RealmObjectBase.freezeObject<PlayList>(this);

  static SchemaObject get schema => _schema ??= _initSchema();
  static SchemaObject? _schema;
  static SchemaObject _initSchema() {
    RealmObjectBase.registerFactory(PlayList._);
    return const SchemaObject(ObjectType.realmObject, PlayList, 'PlayList', [
      SchemaProperty('id', RealmPropertyType.int, primaryKey: true),
      SchemaProperty('img', RealmPropertyType.string, optional: true),
      SchemaProperty('uPic', RealmPropertyType.string, optional: true),
      SchemaProperty('uname', RealmPropertyType.string, optional: true),
      SchemaProperty('img700', RealmPropertyType.string, optional: true),
      SchemaProperty('img300', RealmPropertyType.string, optional: true),
      SchemaProperty('userName', RealmPropertyType.string, optional: true),
      SchemaProperty('img500', RealmPropertyType.string, optional: true),
      SchemaProperty('isOfficial', RealmPropertyType.int, optional: true),
      SchemaProperty('total', RealmPropertyType.int, optional: true),
      SchemaProperty('name', RealmPropertyType.string, optional: true),
      SchemaProperty('listencnt', RealmPropertyType.int, optional: true),
      SchemaProperty('musicList', RealmPropertyType.object,
          linkTarget: 'MusicInfo', collectionType: RealmCollectionType.list),
      SchemaProperty('desc', RealmPropertyType.string, optional: true),
      SchemaProperty('info', RealmPropertyType.string, optional: true),
    ]);
  }
}

class MusicInfo extends _MusicInfo
    with RealmEntity, RealmObjectBase, RealmObject {
  MusicInfo({
    String? musicrid,
    String? barrage,
    String? adType,
    String? artist,
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
    String? tmeMusicianAdtype,
  }) {
    RealmObjectBase.set(this, 'musicrid', musicrid);
    RealmObjectBase.set(this, 'barrage', barrage);
    RealmObjectBase.set(this, 'adType', adType);
    RealmObjectBase.set(this, 'artist', artist);
    RealmObjectBase.set(this, 'pic', pic);
    RealmObjectBase.set(this, 'isstar', isstar);
    RealmObjectBase.set(this, 'rid', rid);
    RealmObjectBase.set(this, 'upPcStr', upPcStr);
    RealmObjectBase.set(this, 'duration', duration);
    RealmObjectBase.set(this, 'score100', score100);
    RealmObjectBase.set(this, 'adSubtype', adSubtype);
    RealmObjectBase.set(this, 'contentType', contentType);
    RealmObjectBase.set(this, 'mvPlayCnt', mvPlayCnt);
    RealmObjectBase.set(this, 'track', track);
    RealmObjectBase.set(this, 'hasLossless', hasLossless);
    RealmObjectBase.set(this, 'hasmv', hasmv);
    RealmObjectBase.set(this, 'releaseDate', releaseDate);
    RealmObjectBase.set(this, 'album', album);
    RealmObjectBase.set(this, 'albumid', albumid);
    RealmObjectBase.set(this, 'pay', pay);
    RealmObjectBase.set(this, 'artistid', artistid);
    RealmObjectBase.set(this, 'albumpic', albumpic);
    RealmObjectBase.set(this, 'originalsongtype', originalsongtype);
    RealmObjectBase.set(this, 'songTimeMinutes', songTimeMinutes);
    RealmObjectBase.set(this, 'isListenFee', isListenFee);
    RealmObjectBase.set(this, 'mvUpPcStr', mvUpPcStr);
    RealmObjectBase.set(this, 'pic120', pic120);
    RealmObjectBase.set(this, 'albuminfo', albuminfo);
    RealmObjectBase.set(this, 'name', name);
    RealmObjectBase.set(this, 'online', online);
    RealmObjectBase.set(this, 'tmeMusicianAdtype', tmeMusicianAdtype);
  }

  MusicInfo._();

  @override
  String? get musicrid =>
      RealmObjectBase.get<String>(this, 'musicrid') as String?;
  @override
  set musicrid(String? value) => RealmObjectBase.set(this, 'musicrid', value);

  @override
  String? get barrage =>
      RealmObjectBase.get<String>(this, 'barrage') as String?;
  @override
  set barrage(String? value) => RealmObjectBase.set(this, 'barrage', value);

  @override
  String? get adType => RealmObjectBase.get<String>(this, 'adType') as String?;
  @override
  set adType(String? value) => RealmObjectBase.set(this, 'adType', value);

  @override
  String? get artist => RealmObjectBase.get<String>(this, 'artist') as String?;
  @override
  set artist(String? value) => RealmObjectBase.set(this, 'artist', value);

  @override
  String? get pic => RealmObjectBase.get<String>(this, 'pic') as String?;
  @override
  set pic(String? value) => RealmObjectBase.set(this, 'pic', value);

  @override
  int? get isstar => RealmObjectBase.get<int>(this, 'isstar') as int?;
  @override
  set isstar(int? value) => RealmObjectBase.set(this, 'isstar', value);

  @override
  int? get rid => RealmObjectBase.get<int>(this, 'rid') as int?;
  @override
  set rid(int? value) => RealmObjectBase.set(this, 'rid', value);

  @override
  String? get upPcStr =>
      RealmObjectBase.get<String>(this, 'upPcStr') as String?;
  @override
  set upPcStr(String? value) => RealmObjectBase.set(this, 'upPcStr', value);

  @override
  int? get duration => RealmObjectBase.get<int>(this, 'duration') as int?;
  @override
  set duration(int? value) => RealmObjectBase.set(this, 'duration', value);

  @override
  String? get score100 =>
      RealmObjectBase.get<String>(this, 'score100') as String?;
  @override
  set score100(String? value) => RealmObjectBase.set(this, 'score100', value);

  @override
  String? get adSubtype =>
      RealmObjectBase.get<String>(this, 'adSubtype') as String?;
  @override
  set adSubtype(String? value) => RealmObjectBase.set(this, 'adSubtype', value);

  @override
  String? get contentType =>
      RealmObjectBase.get<String>(this, 'contentType') as String?;
  @override
  set contentType(String? value) =>
      RealmObjectBase.set(this, 'contentType', value);

  @override
  int? get mvPlayCnt => RealmObjectBase.get<int>(this, 'mvPlayCnt') as int?;
  @override
  set mvPlayCnt(int? value) => RealmObjectBase.set(this, 'mvPlayCnt', value);

  @override
  int? get track => RealmObjectBase.get<int>(this, 'track') as int?;
  @override
  set track(int? value) => RealmObjectBase.set(this, 'track', value);

  @override
  bool? get hasLossless =>
      RealmObjectBase.get<bool>(this, 'hasLossless') as bool?;
  @override
  set hasLossless(bool? value) =>
      RealmObjectBase.set(this, 'hasLossless', value);

  @override
  int? get hasmv => RealmObjectBase.get<int>(this, 'hasmv') as int?;
  @override
  set hasmv(int? value) => RealmObjectBase.set(this, 'hasmv', value);

  @override
  String? get releaseDate =>
      RealmObjectBase.get<String>(this, 'releaseDate') as String?;
  @override
  set releaseDate(String? value) =>
      RealmObjectBase.set(this, 'releaseDate', value);

  @override
  String? get album => RealmObjectBase.get<String>(this, 'album') as String?;
  @override
  set album(String? value) => RealmObjectBase.set(this, 'album', value);

  @override
  int? get albumid => RealmObjectBase.get<int>(this, 'albumid') as int?;
  @override
  set albumid(int? value) => RealmObjectBase.set(this, 'albumid', value);

  @override
  String? get pay => RealmObjectBase.get<String>(this, 'pay') as String?;
  @override
  set pay(String? value) => RealmObjectBase.set(this, 'pay', value);

  @override
  int? get artistid => RealmObjectBase.get<int>(this, 'artistid') as int?;
  @override
  set artistid(int? value) => RealmObjectBase.set(this, 'artistid', value);

  @override
  String? get albumpic =>
      RealmObjectBase.get<String>(this, 'albumpic') as String?;
  @override
  set albumpic(String? value) => RealmObjectBase.set(this, 'albumpic', value);

  @override
  int? get originalsongtype =>
      RealmObjectBase.get<int>(this, 'originalsongtype') as int?;
  @override
  set originalsongtype(int? value) =>
      RealmObjectBase.set(this, 'originalsongtype', value);

  @override
  String? get songTimeMinutes =>
      RealmObjectBase.get<String>(this, 'songTimeMinutes') as String?;
  @override
  set songTimeMinutes(String? value) =>
      RealmObjectBase.set(this, 'songTimeMinutes', value);

  @override
  bool? get isListenFee =>
      RealmObjectBase.get<bool>(this, 'isListenFee') as bool?;
  @override
  set isListenFee(bool? value) =>
      RealmObjectBase.set(this, 'isListenFee', value);

  @override
  String? get mvUpPcStr =>
      RealmObjectBase.get<String>(this, 'mvUpPcStr') as String?;
  @override
  set mvUpPcStr(String? value) => RealmObjectBase.set(this, 'mvUpPcStr', value);

  @override
  String? get pic120 => RealmObjectBase.get<String>(this, 'pic120') as String?;
  @override
  set pic120(String? value) => RealmObjectBase.set(this, 'pic120', value);

  @override
  String? get albuminfo =>
      RealmObjectBase.get<String>(this, 'albuminfo') as String?;
  @override
  set albuminfo(String? value) => RealmObjectBase.set(this, 'albuminfo', value);

  @override
  String? get name => RealmObjectBase.get<String>(this, 'name') as String?;
  @override
  set name(String? value) => RealmObjectBase.set(this, 'name', value);

  @override
  int? get online => RealmObjectBase.get<int>(this, 'online') as int?;
  @override
  set online(int? value) => RealmObjectBase.set(this, 'online', value);

  @override
  String? get tmeMusicianAdtype =>
      RealmObjectBase.get<String>(this, 'tmeMusicianAdtype') as String?;
  @override
  set tmeMusicianAdtype(String? value) =>
      RealmObjectBase.set(this, 'tmeMusicianAdtype', value);

  @override
  Stream<RealmObjectChanges<MusicInfo>> get changes =>
      RealmObjectBase.getChanges<MusicInfo>(this);

  @override
  MusicInfo freeze() => RealmObjectBase.freezeObject<MusicInfo>(this);

  static SchemaObject get schema => _schema ??= _initSchema();
  static SchemaObject? _schema;
  static SchemaObject _initSchema() {
    RealmObjectBase.registerFactory(MusicInfo._);
    return const SchemaObject(ObjectType.realmObject, MusicInfo, 'MusicInfo', [
      SchemaProperty('musicrid', RealmPropertyType.string, optional: true),
      SchemaProperty('barrage', RealmPropertyType.string, optional: true),
      SchemaProperty('adType', RealmPropertyType.string, optional: true),
      SchemaProperty('artist', RealmPropertyType.string, optional: true),
      SchemaProperty('pic', RealmPropertyType.string, optional: true),
      SchemaProperty('isstar', RealmPropertyType.int, optional: true),
      SchemaProperty('rid', RealmPropertyType.int, optional: true),
      SchemaProperty('upPcStr', RealmPropertyType.string, optional: true),
      SchemaProperty('duration', RealmPropertyType.int, optional: true),
      SchemaProperty('score100', RealmPropertyType.string, optional: true),
      SchemaProperty('adSubtype', RealmPropertyType.string, optional: true),
      SchemaProperty('contentType', RealmPropertyType.string, optional: true),
      SchemaProperty('mvPlayCnt', RealmPropertyType.int, optional: true),
      SchemaProperty('track', RealmPropertyType.int, optional: true),
      SchemaProperty('hasLossless', RealmPropertyType.bool, optional: true),
      SchemaProperty('hasmv', RealmPropertyType.int, optional: true),
      SchemaProperty('releaseDate', RealmPropertyType.string, optional: true),
      SchemaProperty('album', RealmPropertyType.string, optional: true),
      SchemaProperty('albumid', RealmPropertyType.int, optional: true),
      SchemaProperty('pay', RealmPropertyType.string, optional: true),
      SchemaProperty('artistid', RealmPropertyType.int, optional: true),
      SchemaProperty('albumpic', RealmPropertyType.string, optional: true),
      SchemaProperty('originalsongtype', RealmPropertyType.int, optional: true),
      SchemaProperty('songTimeMinutes', RealmPropertyType.string,
          optional: true),
      SchemaProperty('isListenFee', RealmPropertyType.bool, optional: true),
      SchemaProperty('mvUpPcStr', RealmPropertyType.string, optional: true),
      SchemaProperty('pic120', RealmPropertyType.string, optional: true),
      SchemaProperty('albuminfo', RealmPropertyType.string, optional: true),
      SchemaProperty('name', RealmPropertyType.string, optional: true),
      SchemaProperty('online', RealmPropertyType.int, optional: true),
      SchemaProperty('tmeMusicianAdtype', RealmPropertyType.string,
          optional: true),
    ]);
  }
}
