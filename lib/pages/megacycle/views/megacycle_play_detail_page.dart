import 'package:flutter/material.dart';
import 'package:flutter_douban_fm_clone/common/controllers/player.dart';
import 'package:flutter_douban_fm_clone/common/custom_color.dart';
import 'package:flutter_douban_fm_clone/common/request.dart';
import 'package:flutter_douban_fm_clone/models/song_info_and_lrc_model.dart';
import 'package:flutter_douban_fm_clone/pages/megacycle/widgets/play_detail_lrc.dart';
import 'package:go_router/go_router.dart';

class MegacyclePlayDetailPage extends StatelessWidget {
  const MegacyclePlayDetailPage({
    super.key,
    required this.musicId,
  });
  final String musicId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          surfaceTintColor: Colors.white,
          leading: IconButton(
            onPressed: () {
              context.pop();
            },
            icon: const Icon(Icons.arrow_back_ios),
          )),
      body: FutureBuilder(
        future: fetchSongInfoAndLrc(musicId),
        builder: (context, AsyncSnapshot<SongInfoAndLrc> snapshot) {
          if (snapshot.connectionState == ConnectionState.none ||
              !snapshot.hasData) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return const Center(
              child: Text('not data!'),
            );
          }

          SongInfoAndLrc songInfoAndLrc = snapshot.data!;
          Songinfo songinfo = songInfoAndLrc.songinfo!;
          List<LrcInfo> lrcList = songInfoAndLrc.lrclist!;
          // debugPrint(songinfo.toJson().toString());
          // for (LrcInfo lrc in lrcList) {
          //   debugPrint(lrc.toJson().toString());
          // }

          Player player = Player(totalSeconds: int.parse(songinfo.duration!));
          // debugPrint(songinfo.id!);

          return Container(
            padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 40),
            child: ListenableBuilder(
                listenable: player,
                builder: (context, widget) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        '私人精选 MHz ▾',
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: Colors.black54),
                      ),
                      const SizedBox(height: 30),
                      Text(
                        songinfo.songName!,
                        style: const TextStyle(
                            fontSize: 22, fontWeight: FontWeight.w600),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      Text(
                        songinfo.artist!,
                        style: const TextStyle(color: Colors.black38),
                      ),
                      const SizedBox(height: 40),
                      SizedBox(
                        height: 400,
                        child: PlayDetailLrcWidget(
                          lrcList: lrcList,
                          player: player,
                        ),
                        // ListView.builder(
                        //   itemCount: lrcList.length,
                        //   itemBuilder: (context, index) {
                        //     return Text(
                        //       lrcList[index].lineLyric!,
                        //       style: const TextStyle(
                        //           color: Colors.black38,
                        //           fontSize: 15,
                        //           height: 2.5),
                        //     );
                        //   },
                        // ),
                      ),
                      const SizedBox(height: 15),
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
                          max: player.totalSeconds.toDouble() + 1,
                          value: player.current.toDouble(),
                          onChanged: (value) {
                            if (value <= player.totalSeconds) {
                              player.current = value.floor();
                            }
                          },
                        ),
                      ),
                      // LinearProgressIndicator(
                      //   value: player.playRatio,
                      //   valueColor: const AlwaysStoppedAnimation<Color>(
                      //       CustomColors.paimary),
                      //   backgroundColor: CustomColors.paimary.withOpacity(0.1),
                      // ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(player.currentTime,
                              style: const TextStyle(
                                  fontSize: 12, color: Colors.black38)),
                          Text(player.totalTime,
                              style: const TextStyle(
                                  fontSize: 12, color: Colors.black38)),
                        ],
                      ),
                      const SizedBox(height: 15),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          IconButton(
                            onPressed: () {},
                            icon: const Icon(Icons.delete_outline, size: 30),
                            selectedIcon:
                                const Icon(Icons.delete_forever, size: 30),
                          ),
                          IconButton(
                            color: Colors.white,
                            onPressed: () {
                              player.toggle();
                            },
                            isSelected: player.isPlay,
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
                                )),
                            selectedIcon: Container(
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
                                Icons.pause,
                                color: CustomColors.paimary,
                                size: 30,
                              ),
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
                    ],
                  );
                }),
          );
        },
      ),
    );
  }
}
