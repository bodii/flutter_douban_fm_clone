import 'package:flutter/material.dart';
import 'package:flutter_douban_fm_clone/common/controllers/auth_provider.dart';
import 'package:flutter_douban_fm_clone/common/controllers/login.dart';
import 'package:flutter_douban_fm_clone/common/custom_color.dart';
import 'package:flutter_douban_fm_clone/models/user_model.dart';

import 'package:go_router/go_router.dart';

class MyPage extends StatelessWidget {
  const MyPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Login login = context.auth();

    return SingleChildScrollView(
      child: SizedBox(
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.only(left: 28.0, top: 45, right: 28.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(children: [
                    const CircleAvatar(
                      radius: 26,
                      backgroundColor: CustomColors.paimary,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 28.0),
                      child: Text(
                          login.isLoggedIn ? login.userInfo!.nickname! : '昵称',
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          )),
                    ),
                  ]),
                  GestureDetector(
                    onTap: () {
                      context.push('/user/info/modify');
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
              Container(
                width: double.infinity,
                height: 90,
                alignment: Alignment.bottomLeft,
                child: Row(
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
              ),
              createSongListCardItem(
                'https://d.musicapp.migu.cn/prod/playlist-service/playListimg/ed9196b6-c663-4339-adc5-5e5a86958c1e.jpg',
                '我的红心歌曲',
                7,
                context,
              ),
              createSongListCardItem(
                'https://d.musicapp.migu.cn/prod/playlist-service/playListimg/ed9196b6-c663-4339-adc5-5e5a86958c1e.jpg',
                '我的红心歌曲',
                7,
                context,
              ),
            ],
          ),
        ),
      ),
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
      padding: const EdgeInsets.symmetric(
        vertical: 10,
      ),
      child: GestureDetector(
        onTap: () {
          context.go('/my/songList/$name');
        },
        child: SizedBox(
          width: double.infinity,
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
