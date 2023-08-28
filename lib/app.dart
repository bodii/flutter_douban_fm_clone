import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_douban_fm_clone/common/controllers/auth_provider.dart';
import 'package:flutter_douban_fm_clone/common/controllers/login.dart';
import 'package:flutter_douban_fm_clone/database/user/login_account_db.dart';
import 'package:flutter_douban_fm_clone/models/user_model.dart';
import 'package:flutter_douban_fm_clone/route/index.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  // This widget is the root of your application.

  Login login = Login();

  @override
  void initState() {
    super.initState();

    _getAccoutInfo();
  }

  Future<User?> _getLigInAccout() async {
    LoginAccountDb loginAccountDb = LoginAccountDb();
    User? userInfo = await loginAccountDb.queryLoginUserInfo();

    return userInfo;
  }

  Future<void> _getAccoutInfo() async {
    User? userInfo = await _getLigInAccout();
    if (userInfo != null && userInfo.id != null) {
      login.login(userInfo);
    }
  }

  @override
  Widget build(BuildContext context) {
    return AuthProvider(
      login: login,
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        title: 'Flutter douban FM clone',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.grey),
          useMaterial3: true,
        ),
        routerConfig: AppRoute.routes,
      ),
    );
  }
}
