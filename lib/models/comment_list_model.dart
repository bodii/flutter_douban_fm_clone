class CommentList {
  late String? commentTpye;
  late int? currentPage;
  late int? pageSize;
  late String? result;
  late List<Comment>? rows;
  late int? total;
  late int? totalPage;

  CommentList(
      {this.commentTpye,
      this.currentPage,
      this.pageSize,
      this.result,
      this.rows,
      this.total,
      this.totalPage});

  CommentList.fromJson(Map<String, dynamic> json) {
    if (json["comment_tpye"] is String) {
      commentTpye = json["comment_tpye"];
    }
    if (json["currentPage"] is int) {
      currentPage = json["currentPage"];
    }
    if (json["pageSize"] is int) {
      pageSize = json["pageSize"];
    }
    if (json["result"] is String) {
      result = json["result"];
    }
    if (json["rows"] is List) {
      rows = json["rows"] == null
          ? null
          : (json["rows"] as List).map((e) => Comment.fromJson(e)).toList();
    }
    if (json["total"] is int) {
      total = json["total"];
    }
    if (json["totalPage"] is int) {
      totalPage = json["totalPage"];
    }
  }

  static List<CommentList> fromList(List<Map<String, dynamic>> list) {
    return list.map((map) => CommentList.fromJson(map)).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["comment_tpye"] = commentTpye;
    data["currentPage"] = currentPage;
    data["pageSize"] = pageSize;
    data["result"] = result;
    if (rows != null) {
      data["rows"] = rows?.map((e) => e.toJson()).toList();
    }
    data["total"] = total;
    data["totalPage"] = totalPage;
    return data;
  }

  CommentList copyWith({
    String? commentTpye,
    int? currentPage,
    int? pageSize,
    String? result,
    List<Comment>? rows,
    int? total,
    int? totalPage,
  }) =>
      CommentList(
        commentTpye: commentTpye ?? this.commentTpye,
        currentPage: currentPage ?? this.currentPage,
        pageSize: pageSize ?? this.pageSize,
        result: result ?? this.result,
        rows: rows ?? this.rows,
        total: total ?? this.total,
        totalPage: totalPage ?? this.totalPage,
      );
}

class Comment {
  late String? bpic;
  late String? broadcaster;
  late String? color;
  late String? commentTalent;
  late String? commentTalentType;
  late String? id;
  late String? identityIcon;
  late String? isYear;
  late String? isLike;
  late String? kuwoMusician;
  late String? likeNum;
  late String? medalImg;
  late int? medalLevel;
  late String? medalName;
  late String? medalUrl;
  late String? menuTalent;
  late String? menuTalentType;
  late String? mpic;
  late String? msg;
  late String? nameplateImg;
  late String? rankImg;
  late String? rankUrl;
  late int? rankVal;
  late String? singTalent;
  late String? singTalentType;
  late String? state;
  late String? svip;
  late String? time;
  late String? typeface;
  late String? uHangerid;
  late String? uHeadframe;
  late String? uId;
  late String? uName;
  late String? uPic;
  late String? videoTalentType;
  late String? vip;
  late String? vip2;
  late String? vip3;
  late String? vipIcon;

  Comment(
      {this.bpic,
      this.broadcaster,
      this.color,
      this.commentTalent,
      this.commentTalentType,
      this.id,
      this.identityIcon,
      this.isYear,
      this.isLike,
      this.kuwoMusician,
      this.likeNum,
      this.medalImg,
      this.medalLevel,
      this.medalName,
      this.medalUrl,
      this.menuTalent,
      this.menuTalentType,
      this.mpic,
      this.msg,
      this.nameplateImg,
      this.rankImg,
      this.rankUrl,
      this.rankVal,
      this.singTalent,
      this.singTalentType,
      this.state,
      this.svip,
      this.time,
      this.typeface,
      this.uHangerid,
      this.uHeadframe,
      this.uId,
      this.uName,
      this.uPic,
      this.videoTalentType,
      this.vip,
      this.vip2,
      this.vip3,
      this.vipIcon});

  Comment.fromJson(Map<String, dynamic> json) {
    if (json["bpic"] is String) {
      bpic = json["bpic"];
    }
    if (json["broadcaster"] is String) {
      broadcaster = json["broadcaster"];
    }
    if (json["color"] is String) {
      color = json["color"];
    }
    if (json["commentTalent"] is String) {
      commentTalent = json["commentTalent"];
    }
    if (json["commentTalentType"] is String) {
      commentTalentType = json["commentTalentType"];
    }
    if (json["id"] is String) {
      id = json["id"];
    }
    if (json["identity_icon"] is String) {
      identityIcon = json["identity_icon"];
    }
    if (json["isYear"] is String) {
      isYear = json["isYear"];
    }
    if (json["is_like"] is String) {
      isLike = json["is_like"];
    }
    if (json["kuwoMusician"] is String) {
      kuwoMusician = json["kuwoMusician"];
    }
    if (json["like_num"] is String) {
      likeNum = json["like_num"];
    }
    if (json["medalImg"] is String) {
      medalImg = json["medalImg"];
    }
    if (json["medalLevel"] is int) {
      medalLevel = json["medalLevel"];
    }
    if (json["medalName"] is String) {
      medalName = json["medalName"];
    }
    if (json["medalUrl"] is String) {
      medalUrl = json["medalUrl"];
    }
    if (json["menuTalent"] is String) {
      menuTalent = json["menuTalent"];
    }
    if (json["menuTalentType"] is String) {
      menuTalentType = json["menuTalentType"];
    }
    if (json["mpic"] is String) {
      mpic = json["mpic"];
    }
    if (json["msg"] is String) {
      msg = json["msg"];
    }
    if (json["nameplateImg"] is String) {
      nameplateImg = json["nameplateImg"];
    }
    if (json["rankImg"] is String) {
      rankImg = json["rankImg"];
    }
    if (json["rankUrl"] is String) {
      rankUrl = json["rankUrl"];
    }
    if (json["rankVal"] is int) {
      rankVal = json["rankVal"];
    }
    if (json["singTalent"] is String) {
      singTalent = json["singTalent"];
    }
    if (json["singTalentType"] is String) {
      singTalentType = json["singTalentType"];
    }
    if (json["state"] is String) {
      state = json["state"];
    }
    if (json["svip"] is String) {
      svip = json["svip"];
    }
    if (json["time"] is String) {
      time = json["time"];
    }
    if (json["typeface"] is String) {
      typeface = json["typeface"];
    }
    if (json["u_hangerid"] is String) {
      uHangerid = json["u_hangerid"];
    }
    if (json["u_headframe"] is String) {
      uHeadframe = json["u_headframe"];
    }
    if (json["u_id"] is String) {
      uId = json["u_id"];
    }
    if (json["u_name"] is String) {
      uName = json["u_name"];
    }
    if (json["u_pic"] is String) {
      uPic = json["u_pic"];
    }
    if (json["videoTalentType"] is String) {
      videoTalentType = json["videoTalentType"];
    }
    if (json["vip"] is String) {
      vip = json["vip"];
    }
    if (json["vip2"] is String) {
      vip2 = json["vip2"];
    }
    if (json["vip3"] is String) {
      vip3 = json["vip3"];
    }
    if (json["vipIcon"] is String) {
      vipIcon = json["vipIcon"];
    }
  }

  static List<Comment> fromList(List<Map<String, dynamic>> list) {
    return list.map((map) => Comment.fromJson(map)).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["bpic"] = bpic;
    data["broadcaster"] = broadcaster;
    data["color"] = color;
    data["commentTalent"] = commentTalent;
    data["commentTalentType"] = commentTalentType;
    data["id"] = id;
    data["identity_icon"] = identityIcon;
    data["isYear"] = isYear;
    data["is_like"] = isLike;
    data["kuwoMusician"] = kuwoMusician;
    data["like_num"] = likeNum;
    data["medalImg"] = medalImg;
    data["medalLevel"] = medalLevel;
    data["medalName"] = medalName;
    data["medalUrl"] = medalUrl;
    data["menuTalent"] = menuTalent;
    data["menuTalentType"] = menuTalentType;
    data["mpic"] = mpic;
    data["msg"] = msg;
    data["nameplateImg"] = nameplateImg;
    data["rankImg"] = rankImg;
    data["rankUrl"] = rankUrl;
    data["rankVal"] = rankVal;
    data["singTalent"] = singTalent;
    data["singTalentType"] = singTalentType;
    data["state"] = state;
    data["svip"] = svip;
    data["time"] = time;
    data["typeface"] = typeface;
    data["u_hangerid"] = uHangerid;
    data["u_headframe"] = uHeadframe;
    data["u_id"] = uId;
    data["u_name"] = uName;
    data["u_pic"] = uPic;
    data["videoTalentType"] = videoTalentType;
    data["vip"] = vip;
    data["vip2"] = vip2;
    data["vip3"] = vip3;
    data["vipIcon"] = vipIcon;
    return data;
  }

  Comment copyWith({
    String? bpic,
    String? broadcaster,
    String? color,
    String? commentTalent,
    String? commentTalentType,
    String? id,
    String? identityIcon,
    String? isYear,
    String? isLike,
    String? kuwoMusician,
    String? likeNum,
    String? medalImg,
    int? medalLevel,
    String? medalName,
    String? medalUrl,
    String? menuTalent,
    String? menuTalentType,
    String? mpic,
    String? msg,
    String? nameplateImg,
    String? rankImg,
    String? rankUrl,
    int? rankVal,
    String? singTalent,
    String? singTalentType,
    String? state,
    String? svip,
    String? time,
    String? typeface,
    String? uHangerid,
    String? uHeadframe,
    String? uId,
    String? uName,
    String? uPic,
    String? videoTalentType,
    String? vip,
    String? vip2,
    String? vip3,
    String? vipIcon,
  }) =>
      Comment(
        bpic: bpic ?? this.bpic,
        broadcaster: broadcaster ?? this.broadcaster,
        color: color ?? this.color,
        commentTalent: commentTalent ?? this.commentTalent,
        commentTalentType: commentTalentType ?? this.commentTalentType,
        id: id ?? this.id,
        identityIcon: identityIcon ?? this.identityIcon,
        isYear: isYear ?? this.isYear,
        isLike: isLike ?? this.isLike,
        kuwoMusician: kuwoMusician ?? this.kuwoMusician,
        likeNum: likeNum ?? this.likeNum,
        medalImg: medalImg ?? this.medalImg,
        medalLevel: medalLevel ?? this.medalLevel,
        medalName: medalName ?? this.medalName,
        medalUrl: medalUrl ?? this.medalUrl,
        menuTalent: menuTalent ?? this.menuTalent,
        menuTalentType: menuTalentType ?? this.menuTalentType,
        mpic: mpic ?? this.mpic,
        msg: msg ?? this.msg,
        nameplateImg: nameplateImg ?? this.nameplateImg,
        rankImg: rankImg ?? this.rankImg,
        rankUrl: rankUrl ?? this.rankUrl,
        rankVal: rankVal ?? this.rankVal,
        singTalent: singTalent ?? this.singTalent,
        singTalentType: singTalentType ?? this.singTalentType,
        state: state ?? this.state,
        svip: svip ?? this.svip,
        time: time ?? this.time,
        typeface: typeface ?? this.typeface,
        uHangerid: uHangerid ?? this.uHangerid,
        uHeadframe: uHeadframe ?? this.uHeadframe,
        uId: uId ?? this.uId,
        uName: uName ?? this.uName,
        uPic: uPic ?? this.uPic,
        videoTalentType: videoTalentType ?? this.videoTalentType,
        vip: vip ?? this.vip,
        vip2: vip2 ?? this.vip2,
        vip3: vip3 ?? this.vip3,
        vipIcon: vipIcon ?? this.vipIcon,
      );
}
