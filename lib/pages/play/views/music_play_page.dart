import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_douban_fm_clone/common/custom_color.dart';
import 'package:flutter_douban_fm_clone/common/functions/string_duration.dart';
import 'package:flutter_douban_fm_clone/common/request.dart';
import 'package:flutter_douban_fm_clone/models/song_info_and_lrc_model.dart';
import 'package:flutter_douban_fm_clone/pages/play/bloc/music_player_bloc.dart';
import 'package:flutter_douban_fm_clone/common/functions/stream_ticker.dart';
import 'package:flutter_douban_fm_clone/pages/play/widgets/music_play_lrc.dart';
import 'package:go_router/go_router.dart';

class MusicPlayPage extends StatelessWidget {
  const MusicPlayPage({
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

          SongInfoAndLrc? songInfoAndLrc = snapshot.data;
          if (songInfoAndLrc == null) {
            return const Center(
              child: Text('not data!'),
            );
          }

          SongInfo songInfo = songInfoAndLrc.songInfo!;
          List<LrcInfo> lrcList;
          if (songInfoAndLrc.lrclist == null) {
            lrcList = [];
          } else {
            lrcList = songInfoAndLrc.lrclist!;
          }

          // Player player = Player(totalSeconds: int.parse(songInfo.duration!));
          // debugPrint(songInfo.id!);

          return MegacyclePlayDatail(songInfo: songInfo, lrcList: lrcList);
        },
      ),
    );
  }
}

class MegacyclePlayDatail extends StatelessWidget {
  const MegacyclePlayDatail({
    super.key,
    required this.songInfo,
    required this.lrcList,
  });

  final SongInfo songInfo;
  final List<LrcInfo> lrcList;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => MusicPlayerBloc(
        int.parse(songInfo.duration!),
        ticker: const StreamTicker(),
      )..add(MusicPlayerLoading(musicId: songInfo.id!)),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 40),
        child: BlocBuilder<MusicPlayerBloc, MusicPlayerState>(
          builder: (context, state) {
            if (state.status.isLoading) {
              return const Center(child: CircularProgressIndicator());
            }

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
                  songInfo.songName!,
                  style: const TextStyle(
                      fontSize: 22, fontWeight: FontWeight.w600),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  songInfo.artist!,
                  style: const TextStyle(color: Colors.black38),
                ),
                const SizedBox(height: 40),
                SizedBox(
                  height: 400,
                  child: MusicPlayLrc(lrcList: lrcList),
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
                    max: state.totalDuration.toDouble(),
                    value: state.duration.toDouble(),
                    onChanged: (value) {
                      if (value <= state.totalDuration) {
                        context
                            .read<MusicPlayerBloc>()
                            .add(MusicPlayerSeeked(duration: value.round()));
                      }
                    },
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(StringDuration.durationTransform(state.duration),
                        style: const TextStyle(
                            fontSize: 12, color: Colors.black38)),
                    Text(StringDuration.durationTransform(state.totalDuration),
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
                          )),
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
          },
        ),
      ),
    );
  }
}
