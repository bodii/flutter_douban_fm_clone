import 'package:flutter/material.dart';
import 'package:flutter_douban_fm_clone/common/controllers/auth_provider.dart';
import 'package:flutter_douban_fm_clone/common/controllers/login.dart';
import 'package:go_router/go_router.dart';

class UserInfoModify extends StatelessWidget {
  const UserInfoModify({super.key});

  @override
  Widget build(BuildContext context) {
    Login login = context.auth();
    print(login.userInfo!.toJson());
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: IconButton(
          onPressed: () => context.pop(),
          icon: const Icon(Icons.arrow_back_ios_new),
        ),
        title: const Text('修改资料'),
      ),
      body: const Center(
        child: Text('修改资料页'),
      ),
    );
  }
}
