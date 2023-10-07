import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_douban_fm_clone/common/controllers/auth_provider.dart';
import 'package:flutter_douban_fm_clone/common/controllers/login.dart';
import 'package:flutter_douban_fm_clone/common/custom_color.dart';
import 'package:flutter_douban_fm_clone/common/functions/stream_ticker.dart';
import 'package:flutter_douban_fm_clone/common/functions/string_duration.dart';
import 'package:flutter_douban_fm_clone/common/request.dart';
import 'package:flutter_douban_fm_clone/database/music/music_basic_db.dart';
import 'package:flutter_douban_fm_clone/models/music_info_model.dart';
import 'package:flutter_douban_fm_clone/models/play_list_model.dart';
import 'package:flutter_douban_fm_clone/pages/play/bloc/music_player_bloc.dart';
import 'package:go_router/go_router.dart';

class MegacyclePlayPage extends StatelessWidget {
  const MegacyclePlayPage({super.key, required this.playListId});

  final String playListId;

  Future<bool> checkFavorite(int musicId, int userId) async {
    MusicBasicDb musicBasicDb = MusicBasicDb();
    bool isExisits =
        await musicBasicDb.hasExists(musicId: musicId, userId: userId);

    return isExisits;
  }

  Future<bool> toggleFavorite(MusicInfo musicInfo, int userId) async {
    MusicBasicDb musicBasicDb = MusicBasicDb();
    bool result = await musicBasicDb.toggle<MusicInfo>(
        info: musicInfo, mySongListId: 1, userId: userId);
    log('toggle result : $result');
    return result;
  }

  @override
  Widget build(BuildContext context) {
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

            debugPrint('old totalNum: ${musicList.length}');
            musicList.removeWhere((m) => m.isListenFee!);
            debugPrint('new totalNum: ${musicList.length}');

            if (musicList.isEmpty) {
              return const Center(
                child: Text('不可播放'),
              );
            }

            MusicInfo musicInfo = musicList[0];

            return withContentWidget(context, musicInfo);
          }),
    );
  }

  BlocProvider<MusicPlayerBloc> withContentWidget(
      BuildContext context, MusicInfo musicInfo) {
    Size size = MediaQuery.sizeOf(context);
    final Login login = context.auth();
    checkFavorite(musicInfo.rid!, login.userInfo!.id);

    return BlocProvider(
      create: (BuildContext context) => MusicPlayerBloc(
        musicInfo.duration!,
        ticker: const StreamTicker(),
      )..add(MusicPlayerLoading(
          musicId: "${musicInfo.rid!}",
          userId: login.userInfo!.id,
        )),
      child: BlocBuilder<MusicPlayerBloc, MusicPlayerState>(
          builder: (context, state) {
        if (state.status.isLoading) {
          return const Center(child: CircularProgressIndicator());
        }

        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
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
                child: Container(
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
                ),
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
                    const SizedBox(height: 30),
                    // 时间
                    SliderTheme(
                      data: SliderTheme.of(context).copyWith(
                        trackHeight: 3, // 轨道高度
                        trackShape:
                            const RectangularSliderTrackShape(), // 轨道形状，可以自定义
                        activeTrackColor: CustomColors.paimary, // 激活的轨道颜色
                        inactiveTrackColor:
                            CustomColors.paimary.withOpacity(0.1), // 未激活的轨道颜色
                        thumbShape: const RoundSliderThumbShape(
                            //  滑块形状，可以自定义
                            enabledThumbRadius: 5 // 滑块大小
                            ),
                        thumbColor: Colors.white, // 滑块颜色
                        overlayShape: const RoundSliderOverlayShape(
                          // 滑块外圈形状，可以自定义
                          overlayRadius: 8, // 滑块外圈大小
                        ),
                        overlayColor: CustomColors
                            .secondary, // 滑块外圈颜色 // 标签形状，可以自定义 // 激活的刻度颜色
                      ),
                      child: Slider(
                        min: 0.0,
                        max: state.totalDuration.toDouble(),
                        value: state.duration.toDouble(),
                        onChanged: (value) {
                          if (value <= state.totalDuration) {
                            context.read<MusicPlayerBloc>().add(
                                MusicPlayerSeeked(duration: value.round()));
                          }
                        },
                      ),
                    ),
                    SizedBox(
                      width: 160,
                      height: 15,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(StringDuration.durationTransform(state.duration),
                              style: const TextStyle(
                                  fontSize: 12, color: Colors.black38)),
                          Text(
                              StringDuration.durationTransform(
                                  state.totalDuration),
                              style: const TextStyle(
                                  fontSize: 12, color: Colors.black38)),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Positioned(
                bottom: 80,
                child: Row(
                  // mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.delete_outline, size: 30),
                      selectedIcon: const Icon(Icons.delete_forever, size: 30),
                    ),
                    IconButton(
                      color: Colors.white,
                      onPressed: () {
                        context
                            .read<MusicPlayerBloc>()
                            .add(const MusicPlayerToggle());
                      },
                      isSelected: state.status.isPlay,
                      icon: Container(
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(50),
                          boxShadow: [
                            BoxShadow(
                              color: CustomColors.paimary.withOpacity(0.25),
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
                      selectedIcon: Container(
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(50),
                          boxShadow: [
                            BoxShadow(
                              color: CustomColors.paimary.withOpacity(0.25),
                              offset: const Offset(0, 3.0),
                              blurRadius: 10.0,
                              spreadRadius: 0.3,
                            ),
                          ],
                        ),
                        child: const Icon(
                          Icons.pause,
                          color: CustomColors.paimary,
                          size: 30,
                        ),
                      ),
                    ),
                    IconButton(
                      onPressed: () async {
                        context
                            .read<MusicPlayerBloc>()
                            .add(MusicFavoriteToggle<MusicInfo>(
                              info: musicInfo,
                              mySongListId: 1,
                            ));
                      },
                      isSelected: state.isFavorite,
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
      }),
    );
  }
}
