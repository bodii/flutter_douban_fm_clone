class SongerFeaturedSongs {
  final int? code;
  final int? curTime;
  final dynamic data;
  final String? msg;
  final String? profileId;
  final String? reqId;
  final String? tId;

  SongerFeaturedSongs({
    this.code,
    this.curTime,
    this.data,
    this.msg,
    this.profileId,
    this.reqId,
    this.tId,
  });

  SongerFeaturedSongs copyWith({
    int? code,
    int? curTime,
    dynamic data,
    String? msg,
    String? profileId,
    String? reqId,
    String? tId,
  }) =>
      SongerFeaturedSongs(
        code: code ?? this.code,
        curTime: curTime ?? this.curTime,
        data: data ?? this.data,
        msg: msg ?? this.msg,
        profileId: profileId ?? this.profileId,
        reqId: reqId ?? this.reqId,
        tId: tId ?? this.tId,
      );
}
