import 'package:flutter/material.dart';
import 'package:flutter_douban_fm_clone/common/custom_color.dart';
import 'package:flutter_douban_fm_clone/common/request.dart';
import 'package:flutter_douban_fm_clone/models/music_info_model.dart';
import 'package:flutter_douban_fm_clone/models/play_list_model.dart';
import 'package:go_router/go_router.dart';

class MegacyclePlayPage extends StatelessWidget {
  const MegacyclePlayPage({super.key, required this.playListId});

  final String playListId;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    bool isUp = false;
    int index = 0;

    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios),
            onPressed: () {
              context.pop();
            },
          ),
        ),
        body: FutureBuilder(
            future: fetchPlayListInfo(int.parse(playListId)),
            builder: (context, AsyncSnapshot<PlayList> snapshot) {
              if (snapshot.connectionState == ConnectionState.none ||
                  !snapshot.hasData) {
                return const Center(child: CircularProgressIndicator());
              }
              if (snapshot.hasError) {
                return const Center(
                  child: Text('not data!'),
                );
              }

              List<MusicInfo> musicList = snapshot.data!.musicList!;
              late MusicInfo musicInfo;
              bool hasExisit = false;
              for (; index < musicList.length; index++) {
                if (musicList[index].isListenFee!) {
                  continue;
                }

                musicInfo = musicList[index];
                hasExisit = true;
                break;
              }

              if (!hasExisit) {
                // context.pop(false);
                return const Center(
                  child: Text('不可播放'),
                );
              }
              print('totalNum: ${musicList.length}, index: $index');

              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  GestureDetector(
                    onTap: () {
                      context.push('/play/music/${musicInfo.rid}');
                    },
                    onVerticalDragCancel: () {
                      // ignore: avoid_print
                      print("onVerticalDragCancel");
                    },
                    onVerticalDragDown: (details) {
                      // ignore: avoid_print
                      // print(
                      // "onVerticalDragDown---${details.globalPosition}---${details.localPosition}");
                      isUp = false;
                    },
                    onVerticalDragEnd: (details) async {
                      // ignore: avoid_print
                      // print(
                      // "onVerticalDragEnd---${details.velocity}---${details.primaryVelocity}");
                      debugPrint('isUp: $isUp');
                      if (isUp) {
                        index++;
                      }
                    },
                    onVerticalDragStart: (details) {
                      // ignore: avoid_print
                      // print(
                      // "onVerticalDragStart---${details.globalPosition}---${details.localPosition}");
                    },
                    onVerticalDragUpdate: (details) {
                      // ignore: avoid_print
                      // print(
                      // "onVerticalDragUpdate---${details.globalPosition}---${details.localPosition}---${details.delta}");
                      isUp = true;
                    },
                    child: Container(
                      width: size.width * 0.5,
                      height: size.height,
                      alignment: Alignment.center,
                      child: SizedBox(
                        width: size.width * 0.5,
                        height: 200,
                        // color: Colors.amber,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(15),
                          child: Image.network(
                            musicInfo.pic!,
                            fit: BoxFit.cover,
                            width: 180,
                            height: 180,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Stack(children: [
                    Center(
                      child: SizedBox(
                        width: 150,
                        height: 186,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              '私人精选 MHz ▾',
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black87),
                            ),
                            const SizedBox(height: 10),
                            Text(
                              musicInfo.name!,
                              style: const TextStyle(
                                  fontSize: 22, fontWeight: FontWeight.w600),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                            Text(
                              musicInfo.artist!,
                              style: const TextStyle(color: Colors.black38),
                            ),
                            const SizedBox(height: 70),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // Text(musicList[index].songTimeMinutes!),
                                SizedBox(
                                  width: 200,
                                  height: 2.5,
                                  child: LinearProgressIndicator(
                                    value: 44 / musicInfo.duration!,
                                    valueColor:
                                        const AlwaysStoppedAnimation<Color>(
                                            CustomColors.secondary),
                                    backgroundColor:
                                        CustomColors.paimary.withOpacity(0.1),
                                  ),
                                ),
                                const Text('00:44',
                                    style: TextStyle(
                                        fontSize: 12, color: Colors.black38)),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 80,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconButton(
                            onPressed: () {},
                            icon: const Icon(Icons.delete_outline, size: 30),
                            selectedIcon:
                                const Icon(Icons.delete_forever, size: 30),
                          ),
                          IconButton(
                            onPressed: () {},
                            icon: Container(
                              width: 50,
                              height: 50,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(50),
                                boxShadow: [
                                  BoxShadow(
                                    color:
                                        CustomColors.paimary.withOpacity(0.25),
                                    offset: const Offset(0, 3.0),
                                    blurRadius: 10.0,
                                    spreadRadius: 0.3,
                                  ),
                                ],
                              ),
                              child: const Icon(
                                Icons.play_arrow,
                                color: CustomColors.paimary,
                                size: 30,
                              ),
                            ),
                            selectedIcon: const Icon(
                              Icons.pause,
                              color: CustomColors.paimary,
                              size: 30,
                            ),
                          ),
                          IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.favorite_border,
                              color: CustomColors.neutral,
                              size: 30,
                            ),
                            selectedIcon: const Icon(Icons.favorite,
                                color: CustomColors.neutral, size: 30),
                          ),
                        ],
                      ),
                    ),
                  ]),
                ],
              );
            }));
  }
}
