import 'package:flutter/material.dart';
import 'package:flutter_douban_fm_clone/common/custom_color.dart';
import 'package:flutter_douban_fm_clone/common/request.dart';
import 'package:flutter_douban_fm_clone/database/music/music_basic_db.dart';
import 'package:flutter_douban_fm_clone/models/music_info_model.dart';
import 'package:flutter_douban_fm_clone/models/play_list_model.dart';
import 'package:go_router/go_router.dart';

class MegacyclePlayPage extends StatefulWidget {
  const MegacyclePlayPage({super.key, required this.playListId});

  final String playListId;

  @override
  State<MegacyclePlayPage> createState() => _MegacyclePlayPageState();
}

class _MegacyclePlayPageState extends State<MegacyclePlayPage> {
  late PageController pageCon;
  late MusicBasicDb musicBasicDb;

  int index = 0;
  bool isFavorite = false;

  @override
  void initState() {
    super.initState();

    pageCon = PageController();

    musicBasicDb = MusicBasicDb();
  }

  @override
  void dispose() {
    pageCon.dispose();
    super.dispose();
  }

  Future<void> checkFavorite(int musicId) async {
    isFavorite = await musicBasicDb.isExists(musicId);
  }

  Future<bool> addDbFavorite(MusicInfo musicInfo) async {
    return await musicBasicDb.add<MusicInfo>(musicInfo);
  }

  Future<bool> cancelFavorite(int musicId) async {
    return await musicBasicDb.cancel(musicId);
  }

  Future<void> toggleFavorite(MusicInfo musicInfo) async {
    await musicBasicDb.toggle<MusicInfo>(musicInfo, isFavorite);
    setState(() {
      isFavorite = !isFavorite;
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);

    return Scaffold(
        appBar: AppBar(
          surfaceTintColor: Colors.white,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios),
            onPressed: () {
              context.pop();
            },
          ),
        ),
        body: FutureBuilder(
            future: fetchPlayListInfo(int.parse(widget.playListId)),
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

              debugPrint('old totalNum: ${musicList.length}');
              musicList.removeWhere((m) => m.isListenFee!);
              debugPrint('new totalNum: ${musicList.length}');

              if (musicList.isEmpty) {
                return const Center(
                  child: Text('不可播放'),
                );
              }

              MusicInfo musicInfo = musicList[index];

              checkFavorite(musicInfo.rid!);

              return Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      context.push('/play/music/${musicInfo.rid}');
                    },
                    onVerticalDragCancel: () {
                      debugPrint("onVerticalDragCancel");
                    },
                    onVerticalDragDown: (details) {
                      // debugPrint(
                      // "onVerticalDragDown---${details.globalPosition}---${details.localPosition}");
                      // isUp = false;
                    },
                    onVerticalDragEnd: (details) async {
                      // debugPrint(
                      // "onVerticalDragEnd---${details.velocity}---${details.primaryVelocity}");
                      // debugPrint('isUp: $isUp');
                      // if (isUp) {
                      //   index++;
                      // }
                      // debugPrint('index: $index');
                    },
                    onVerticalDragStart: (details) {
                      // debugPrint(
                      // "onVerticalDragStart---${details.globalPosition}---${details.localPosition}");
                    },
                    onVerticalDragUpdate: (details) {
                      // debugPrint(
                      // "onVerticalDragUpdate---${details.globalPosition}---${details.localPosition}---${details.delta}");
                      // isUp = true;
                    },
                    child: SizedBox(
                      width: size.width * 0.4,
                      height: 500,
                      child: PageView.builder(
                          scrollDirection: Axis.vertical,
                          itemCount: musicList.length,
                          controller: pageCon,
                          itemBuilder: (context, i) {
                            index = i;
                            debugPrint('page view index: $i');

                            return Container(
                              width: double.infinity,
                              height: size.height,
                              alignment: Alignment.center,
                              padding: const EdgeInsets.symmetric(vertical: 20),
                              child: SizedBox(
                                height: 160,
                                // color: Colors.amber,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(15),
                                  child: Image.network(
                                    musicInfo.pic!,
                                    fit: BoxFit.cover,
                                    width: 150,
                                    height: 150,
                                  ),
                                ),
                              ),
                            );
                          }),
                    ),
                  ),
                  Stack(children: [
                    Center(
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
                            overflow: TextOverflow.fade,
                          ),
                          Text(
                            musicInfo.artist!,
                            style: const TextStyle(color: Colors.black38),
                            maxLines: 1,
                            overflow: TextOverflow.fade,
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
                    Positioned(
                      bottom: 80,
                      child: Row(
                        // mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: IconButton(
                              onPressed: () {},
                              icon: const Icon(Icons.delete_outline, size: 30),
                              selectedIcon:
                                  const Icon(Icons.delete_forever, size: 30),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: IconButton(
                              onPressed: () {},
                              icon: Container(
                                width: 50,
                                height: 50,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(50),
                                  boxShadow: [
                                    BoxShadow(
                                      color: CustomColors.paimary
                                          .withOpacity(0.25),
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
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: IconButton(
                              onPressed: () async {
                                toggleFavorite(musicInfo);
                              },
                              isSelected: isFavorite,
                              icon: const Icon(
                                Icons.favorite_border,
                                color: CustomColors.neutral,
                                size: 30,
                              ),
                              selectedIcon: const Icon(Icons.favorite,
                                  color: CustomColors.neutral, size: 30),
                            ),
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
