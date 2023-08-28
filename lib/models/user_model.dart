class User {
  int? id;
  String? username;
  String? nickname;
  String? avatar;
  String? phone;
  String? password;
  String? token;
  String? signUpDate;
  String? signInLateDate;

  User(
      {this.id,
      this.username,
      this.nickname,
      this.avatar,
      this.phone,
      this.password,
      this.token,
      this.signUpDate,
      this.signInLateDate});

  User.fromJson(Map<String, dynamic> json) {
    if (json["id"] is int) {
      id = json["id"];
    }
    if (json["username"] is String) {
      username = json["username"];
    }
    if (json["nickname"] is String) {
      nickname = json["nickname"];
    }
    if (json["avatar"] is String) {
      avatar = json["avatar"];
    }
    if (json["phone"] is String) {
      phone = json["phone"];
    }
    if (json["password"] is String) {
      password = json["password"];
    }
    if (json["token"] is String) {
      token = json["token"];
    }
    if (json["signUpDate"] is String) {
      signUpDate = json["signUpDate"];
    }
    if (json["signInLateDate"] is String) {
      signInLateDate = json["signInLateDate"];
    }
  }

  static List<User> fromList(List<Map<String, dynamic>> list) {
    return list.map((map) => User.fromJson(map)).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["id"] = id;
    _data["username"] = username;
    _data["nickname"] = nickname;
    _data["avatar"] = avatar;
    _data["phone"] = phone;
    _data["password"] = password;
    _data["token"] = token;
    _data["signUpDate"] = signUpDate;
    _data["signInLateDate"] = signInLateDate;
    return _data;
  }

  User copyWith({
    int? id,
    String? username,
    String? nickname,
    String? avatar,
    String? phone,
    String? password,
    String? token,
    String? signUpDate,
    String? signInLateDate,
  }) =>
      User(
        id: id ?? this.id,
        username: username ?? this.username,
        nickname: nickname ?? this.nickname,
        avatar: avatar ?? this.avatar,
        phone: phone ?? this.phone,
        password: password ?? this.password,
        token: token ?? this.token,
        signUpDate: signUpDate ?? this.signUpDate,
        signInLateDate: signInLateDate ?? this.signInLateDate,
      );
}
