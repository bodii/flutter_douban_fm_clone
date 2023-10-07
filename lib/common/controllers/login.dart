import 'package:flutter/material.dart';
import 'package:flutter_douban_fm_clone/database/user/login_account_db.dart';
import 'package:flutter_douban_fm_clone/models/user_model.dart';

enum LoginStatue {
  unLoggedin,
  logged,
  logout,
}

class Login extends ChangeNotifier {
  /// The username of login.
  User? get userInfo => _userInfo;
  User? _userInfo;

  void upInfo(User info) async {
    _userInfo = info;

    notifyListeners();
  }

  /// Whether a user has logged in.
  bool get isLoggedIn => _userInfo != null && _userInfo!.id != 0;

  /// Whether a user has logouted.
  bool get isLogOut => _userInfo == null || _userInfo!.id == 0;

  /// Logs in a user.
  void login(User userInfo) async {
    _userInfo = userInfo;
    // 记录设备登录账户
    LoginAccountDb loginAccountDb = LoginAccountDb();
    await loginAccountDb.signInAccount(userInfo);

    notifyListeners();
  }

  /// Logs out the current user.
  void logout() async {
    // 退出设备登录账户
    LoginAccountDb loginAccountDb = LoginAccountDb();
    await loginAccountDb.logOutAccount(_userInfo!);

    _userInfo = null;
    notifyListeners();
  }
}
