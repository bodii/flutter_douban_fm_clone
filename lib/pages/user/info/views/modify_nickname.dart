import 'package:flutter/material.dart';
import 'package:flutter_douban_fm_clone/common/controllers/auth_provider.dart';
import 'package:flutter_douban_fm_clone/common/controllers/login.dart';
import 'package:flutter_douban_fm_clone/common/custom_color.dart';
import 'package:flutter_douban_fm_clone/models/user_model.dart';
import 'package:go_router/go_router.dart';

class ModifyNickname extends StatefulWidget {
  const ModifyNickname({Key? key}) : super(key: key);

  @override
  State<ModifyNickname> createState() => _ModifyNicknameState();
}

class _ModifyNicknameState extends State<ModifyNickname> {
  String? newNickname;

  @override
  Widget build(BuildContext context) {
    Login login = context.auth();
    User userInfo = login.userInfo!;
    Size size = MediaQuery.sizeOf(context);

    return Scaffold(
        appBar: AppBar(
            leading: IconButton(
              onPressed: () => context.pop(),
              icon: const Icon(Icons.arrow_back, size: 26),
            ),
            title: const Text("修改昵称")),
        body: SafeArea(
          minimum: const EdgeInsets.symmetric(vertical: 48.0, horizontal: 20.0),
          child: Column(children: [
            const SizedBox(width: double.infinity, child: Text("新昵称：")),
            Container(
              width: size.width * 0.95,
              height: 40.0,
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: Colors.white,
              ),
              child: TextField(
                autofocus: true,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: userInfo.nickname,
                  hintStyle: const TextStyle(
                    textBaseline: TextBaseline.alphabetic,
                    fontSize: 14,
                    height: 2.2,
                    color: Colors.grey,
                  ),
                  contentPadding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
                  disabledBorder: null,
                  enabledBorder: null,
                  fillColor: Colors.white,
                ),
                onChanged: (value) {
                  if (value == "") return;

                  newNickname = value;
                },
              ),
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: () async {
                if (newNickname == null) return;
                userInfo.nickname = newNickname!;
                login.upInfo(userInfo);

                context.pop(true);
              },
              style: ElevatedButton.styleFrom(
                surfaceTintColor: Colors.white,
                backgroundColor: Colors.white,
              ),
              child: const Text(
                '确定',
                style: TextStyle(
                  color: CustomColors.paimary,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ]),
        ));
  }
}
