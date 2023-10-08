import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_douban_fm_clone/common/controllers/auth_provider.dart';
import 'package:flutter_douban_fm_clone/common/controllers/login.dart';
import 'package:flutter_douban_fm_clone/common/custom_color.dart';
import 'package:flutter_douban_fm_clone/database/user/user_db.dart';
import 'package:flutter_douban_fm_clone/models/user_model.dart';
import 'package:go_router/go_router.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

class UserInfoModify extends StatefulWidget {
  const UserInfoModify({super.key});

  @override
  State<UserInfoModify> createState() => _UserInfoModifyState();
}

class _UserInfoModifyState extends State<UserInfoModify> {
  @override
  Widget build(BuildContext context) {
    Login login = context.auth();
    print(login.userInfo!);

    User userInfo = login.userInfo!;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        leading: IconButton(
          onPressed: () => context.go('/home/index/2'),
          icon: const Icon(Icons.arrow_back, size: 26),
        ),
        title: const Text('修改资料'),
      ),
      body: SafeArea(
        // minimum: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
        child: Column(
          children: [
            getItem(
              "头像",
              value: userInfo.avatar,
              isImage: true,
              onEvent: () async {
                // 打开相册，并选择照片
                final XFile? pickedFile =
                    await ImagePicker().pickImage(source: ImageSource.gallery);
                if (pickedFile == null) return;

                // 裁切
                final CroppedFile? croppedFile = await ImageCropper().cropImage(
                  sourcePath: pickedFile.path,
                  aspectRatioPresets: [CropAspectRatioPreset.square],
                  cropStyle: CropStyle.circle,
                );
                if (croppedFile == null) return;

                // 保存到数据
                userInfo.avatar = croppedFile.path;
                // 更新登录信息
                login.upInfo(userInfo);

                // 保存到数据库
                UserDb userdb = UserDb();
                final int row = await userdb.update(
                    {"avatar": croppedFile.path},
                    where: "id = ?",
                    whereArgs: [userInfo.id]);
                log("avatar save result: ${row > 0}");

                // 更新状态
                setState(() {});
              },
            ),
            getItem(
              "昵称",
              value: userInfo.nickname,
              onEvent: () async {
                // 去修改密码页
                bool? result = await context.push('/user/modify/nickname');
                if (result != null && result) {
                  setState(() {});
                }
              },
            ),
            Container(
              height: 13,
              decoration: BoxDecoration(
                  boxShadow: [BoxShadow(color: Colors.grey.shade500)],
                  color: Colors.grey.shade100),
            ),
            getItem(
              "修改手机号",
              value: userInfo.phone.replaceRange(3, 7, "****"),
              onEvent: () {
                context.push("/user/modify/phone");
              },
            ),
            getItem(
              "修改密码",
              value: "",
              onEvent: () {
                context.push("/user/modify/password");
              },
            ),
            Container(
              height: 13,
              decoration: BoxDecoration(
                  boxShadow: [BoxShadow(color: Colors.grey.shade500)],
                  color: Colors.grey.shade100),
            ),
            getItem(
              "退出登录",
              value: "",
              onEvent: () {
                // 退出登录
                login.logout();
                // 去登录
                context.go('/user/sign_in/no');
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget getItem(
    String title, {
    String value = "",
    Function()? onEvent,
    bool isImage = false,
  }) {
    return Title(
      color: Colors.white,
      child: GestureDetector(
        onTap: onEvent,
        child: Container(
          decoration: const BoxDecoration(
              color: Colors.white,
              border: Border(
                  bottom: BorderSide(color: Colors.black12, width: 0.2))),
          padding: const EdgeInsets.symmetric(vertical: 25.0, horizontal: 23),
          margin: const EdgeInsets.only(bottom: 1),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(title,
                  style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                      color: Colors.black.withOpacity(0.8))),
              Row(
                children: [
                  Visibility(
                      visible: value != "",
                      child: isImage
                          ? SizedBox(
                              width: 45,
                              height: 45,
                              child: ClipOval(
                                child: Image.file(
                                  File(value),
                                  errorBuilder: (context, error, stackTrace) =>
                                      Container(color: CustomColors.paimary),
                                ),
                              ),
                            )
                          : Text(value,
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                color: Colors.grey.shade700,
                              ))),
                  const Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Icon(
                      Icons.arrow_forward_ios,
                      size: 16,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
