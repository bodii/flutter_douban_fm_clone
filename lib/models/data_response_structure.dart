class ResponseStruct {
  late final int? code;
  late final int? curTime;
  late final Map<String, dynamic>? data;
  late final String? msg;
  late final String? profileId;
  late final String? reqId;
  late final String? tId;

  ResponseStruct({
    this.code,
    this.curTime,
    this.data,
    this.msg,
    this.profileId,
    this.reqId,
    this.tId,
  });

  ResponseStruct copyWith({
    int? code,
    int? curTime,
    dynamic data,
    String? msg,
    String? profileId,
    String? reqId,
    String? tId,
  }) =>
      ResponseStruct(
        code: code ?? this.code,
        curTime: curTime ?? this.curTime,
        data: data ?? this.data,
        msg: msg ?? this.msg,
        profileId: profileId ?? this.profileId,
        reqId: reqId ?? this.reqId,
        tId: tId ?? this.tId,
      );

  ResponseStruct.fromJson(Map<String, dynamic> json) {
    if (json["code"] is int) {
      code = json["code"];
    }
    if (json["curTime"] is int) {
      curTime = json["curTime"];
    }

    if (json['data'] is Map<String, dynamic>) {
      data = json["data"];
    }

    if (json["msg"] is String) {
      msg = json["msg"];
    }
    if (json["profileId"] is String) {
      profileId = json["profileId"];
    }
    if (json["reqId"] is String) {
      reqId = json["reqId"];
    }
    if (json["tId"] is String) {
      tId = json["tId"];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data["code"] = code;
    data["curTime"] = curTime;
    data["data"] = data;
    data["msg"] = msg;
    data["profileId"] = profileId;
    data["reqId"] = reqId;
    data["tId"] = tId;
    return data;
  }
}
