import 'package:flutter/material.dart';
import 'package:flutter_douban_fm_clone/common/controllers/auth_provider.dart';
import 'package:flutter_douban_fm_clone/common/controllers/login.dart';
import 'package:flutter_douban_fm_clone/models/user_model.dart';
import 'package:go_router/go_router.dart';

class UserInfoModify extends StatelessWidget {
  const UserInfoModify({super.key});

  @override
  Widget build(BuildContext context) {
    Login login = context.auth();
    print(login.userInfo!.toJson());

    User userInfo = login.userInfo!;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: IconButton(
          onPressed: () => context.go('/home/index/2'),
          icon: const Icon(Icons.arrow_back_ios_new),
        ),
        title: const Text('修改资料'),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [const Text('昵称'), Text(userInfo.nickname!)],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [const Text('头像'), Text(userInfo.avatar!)],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [const Text('手机号'), Text(userInfo.phone!)],
            ),
            ElevatedButton(
              onPressed: () {},
              child: const Text('修改'),
            ),
          ],
        ),
      ),
    );
  }
}
