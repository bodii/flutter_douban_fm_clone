class LoginAccount {
  int? id;
  int? userId;
  String? token;
  bool? isLogining;
  int? expirationTime;

  LoginAccount(
      {this.id, this.userId, this.token, this.isLogining, this.expirationTime});

  LoginAccount.fromJson(Map<String, dynamic> json) {
    if (json["id"] is int) {
      id = json["id"];
    }
    if (json["user_id"] is int) {
      userId = json["user_id"];
    }
    if (json["token"] is String) {
      token = json["token"];
    }
    if (json["is_logining"] is int) {
      isLogining = json["is_logining"] == 1;
    }
    if (json["expiration_time"] is int) {
      expirationTime = json["expiration_time"];
    }
  }

  static List<LoginAccount> fromList(List<Map<String, dynamic>> list) {
    return list.map((map) => LoginAccount.fromJson(map)).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data["id"] = id;
    data["user_id"] = userId;
    data["token"] = token;
    data["is_logining"] = isLogining! ? 1 : 0;
    data["expiration_time"] = expirationTime;
    return data;
  }

  LoginAccount copyWith({
    int? id,
    int? userId,
    String? token,
    bool? isLogining,
    int? expirationTime,
  }) =>
      LoginAccount(
        id: id ?? this.id,
        userId: userId ?? this.userId,
        token: token ?? this.token,
        isLogining: isLogining ?? this.isLogining,
        expirationTime: expirationTime ?? this.expirationTime,
      );
}
