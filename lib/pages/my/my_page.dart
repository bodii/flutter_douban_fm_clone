import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_douban_fm_clone/common/controllers/auth_provider.dart';
import 'package:flutter_douban_fm_clone/common/controllers/login.dart';
import 'package:flutter_douban_fm_clone/common/custom_color.dart';
import 'package:flutter_douban_fm_clone/database/my_song_list/my_song_list_db.dart';
import 'package:flutter_douban_fm_clone/database/user/user_db.dart';
import 'package:flutter_douban_fm_clone/models/my_song_list_model.dart';
import 'package:flutter_douban_fm_clone/models/user_model.dart';

import 'package:go_router/go_router.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

class MyPage extends StatefulWidget {
  const MyPage({super.key});

  @override
  State<MyPage> createState() => _MyPageState();
}

class _MyPageState extends State<MyPage> {
  @override
  Widget build(BuildContext context) {
    Login login = context.auth();

    return login.isLoggedIn
        ? withLoginWidget(context, login)
        : withNoLoginWidget(context);
  }

  Widget withNoLoginWidget(BuildContext context) {
    return Center(
      child: SizedBox(
        width: 140,
        height: 40,
        child: ElevatedButton(
          onPressed: () {
            context.go('/user/sign_in');
          },
          child: const Text('去登录'),
        ),
      ),
    );
  }

  Widget withLoginWidget(BuildContext context, Login login) {
    User userInfo = login.userInfo!;
    return Padding(
      padding: const EdgeInsets.only(left: 28.0, top: 45, right: 28.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(children: [
                GestureDetector(
                  onTap: () async {
                    // 打开相册，并选择照片
                    final XFile? pickedFile = await ImagePicker()
                        .pickImage(source: ImageSource.gallery);
                    if (pickedFile == null) return;

                    // 裁切
                    final CroppedFile? croppedFile =
                        await ImageCropper().cropImage(
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
                  child: SizedBox(
                    width: 55,
                    height: 55,
                    child: ClipOval(
                      child: (userInfo.avatar != "")
                          ? Image.file(File(userInfo.avatar))
                          : Container(color: CustomColors.paimary),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 28.0),
                  child: Text(userInfo.nickname,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      )),
                ),
              ]),
              GestureDetector(
                onTap: () {
                  context.go('/user/info/modify');
                },
                child: Container(
                  width: 75,
                  height: 30,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Colors.grey.withOpacity(0.05),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: const Text(
                    '修改资料',
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.black87,
                    ),
                  ),
                ),
              ),
            ],
          ),
          GestureDetector(
            onTap: () {
              context.push('/my/collect/index/0');
            },
            child: Container(
              width: double.infinity,
              height: 110,
              margin: const EdgeInsets.symmetric(vertical: 30.0),
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.1),
                    offset: const Offset(0.0, 5.0),
                    blurRadius: 8.0,
                    spreadRadius: 0.1,
                  ),
                ],
                borderRadius: const BorderRadius.all(
                  Radius.circular(20),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 35.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Icon(
                          Icons.star_border_purple500_outlined,
                          size: 32,
                        ),
                        Text(
                          '我的收藏',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Image.asset('./assets/icons/decoration01.jpeg'),
                ],
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              createIconButtonItem(() {
                context.push('/my/local/download');
              }, Icons.file_download, name: '本地'),
              createIconButtonItem(() {
                context.push('/my/history');
              }, Icons.history, name: '历史'),
              createIconButtonItem(() {
                context.go('/my/settings');
              }, Icons.settings_outlined, name: '设置'),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                '我创建的歌单',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.add,
                  size: 35,
                ),
              )
            ],
          ),
          Expanded(
              child: FutureBuilder(
            future: fetchMySongList(userInfo.id),
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return const Center(child: CircularProgressIndicator());
              }
              if (snapshot.hasError) {
                return const Center(
                  child: Text('not data!'),
                );
              }

              List<MySongList> list = snapshot.data!;
              print(list.length);

              return ListView.builder(
                itemCount: list.length,
                itemExtent: 100,
                itemBuilder: (context, index) {
                  MySongList info = list[index];
                  return createSongListCardItem(
                    info.cover,
                    info.name,
                    info.songNum,
                    context,
                  );
                },
              );
            },
          )),
        ],
      ),
    );
  }

  Future<List<MySongList>> fetchMySongList(int userId) async {
    MySongListDb mySongListDb = MySongListDb();

    return await mySongListDb.pageQuery(userId: userId);
  }

  Widget createSongListCardItem2(
    String? coverSrc,
    String name,
    int num,
    BuildContext context,
  ) {
    String src = coverSrc ?? '';
    return ListTile(
      onTap: () {
        context.go('/my/songList/$name');
      },
      leading: Stack(
        alignment: Alignment.center,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.network(
              src,
              fit: BoxFit.cover,
              width: 120,
              height: 95,
            ),
          ),
          Opacity(
            opacity: 0.25,
            child: Container(
              width: double.infinity,
              height: double.infinity,
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(8),
              ),
            ),
          ),
          const Icon(
            Icons.favorite,
            color: CustomColors.neutral,
          )
        ],
      ),
      title: Text(
        name,
        style: const TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.bold,
        ),
      ),
      subtitle: Text('$num首', style: const TextStyle(color: Colors.black38)),
    );
  }

  Widget createSongListCardItem(
    String? coverSrc,
    String name,
    int num,
    BuildContext context,
  ) {
    String src = coverSrc ?? '';
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: GestureDetector(
        onTap: () {
          context.go('/my/songList/$name');
        },
        child: SizedBox(
          height: 75,
          child: Row(
            children: [
              SizedBox(
                width: 120,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.network(
                        src,
                        fit: BoxFit.cover,
                        width: 120,
                        height: 95,
                      ),
                    ),
                    Opacity(
                      opacity: 0.25,
                      child: Container(
                        width: double.infinity,
                        height: double.infinity,
                        decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                    ),
                    const Icon(
                      Icons.favorite,
                      color: CustomColors.neutral,
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 18.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text('$num首',
                        style: const TextStyle(color: Colors.black38)),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget createIconButtonItem(void Function()? onTap, IconData? icon,
      {required String name}) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Column(
          children: [
            Icon(icon, size: 32),
            Text(
              name,
              style: const TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
