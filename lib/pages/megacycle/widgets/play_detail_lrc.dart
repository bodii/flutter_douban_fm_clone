import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_douban_fm_clone/common/functions/string_duration.dart';
import 'package:flutter_douban_fm_clone/models/song_info_and_lrc_model.dart';
import 'package:flutter_douban_fm_clone/pages/megacycle/bloc/music_player_bloc.dart';

class PlayDetailLrcWidget extends StatefulWidget {
  const PlayDetailLrcWidget({super.key, required this.lrcList});

  final List<LrcInfo> lrcList;

  @override
  State<PlayDetailLrcWidget> createState() => _PlayDetailLrcState();
}

class _PlayDetailLrcState extends State<PlayDetailLrcWidget> {
  late ScrollController _controller;
  late Timer _timer;
  Timer? _timerItem;

  int index = 0;
  late Duration time;
  List<Duration> totalTimeList = [];
  late Duration totalTime;

  late double totalHeight;

  List<double> totalOffsetList = [];

  bool isPlay = false;

  static const double itemHeight = 30;

  @override
  void initState() {
    super.initState();

    _controller = ScrollController();

    _controller.addListener(() {
      // totalOffsetList.add(_controller.offset);
      // print('totalOffsetList: $totalOffsetList');
    });
    totalHeight = widget.lrcList.length * itemHeight;
  }

  void _changeCurrentTime(int index) {
    if (index + 1 >= widget.lrcList.length) {
      return;
    }

    String t1 = widget.lrcList[index + 1].time!;
    String t2 = widget.lrcList[index].time!;
    // print('index: $index,  t1: $t1,  t2:$t2');

    Duration t1sDur = StringDuration.parseTimeToDuration(t1);
    Duration t2sDur = StringDuration.parseTimeToDuration(t2);

    time = t1sDur - t2sDur;
    totalTimeList.add(time);
  }

  void _jumpProgress() {
    if (!isPlay) {
      return;
    }

    _timer = Timer.periodic(const Duration(microseconds: 10), (timer) {
      if (totalHeight == index * itemHeight) {
        timer.cancel();
        return;
      }

      if (_timerItem == null || !_timerItem!.isActive) {
        _timerItem = Timer(time, () {
          if (!isPlay) {
            _timerItem!.cancel();
            return;
          }

          if (totalHeight == index * itemHeight) {
            _timerItem!.cancel();
            return;
          }
          index++;

          _animateToIndex(index);

          _changeCurrentTime(index);
        });
      }
    });
  }

  void _animateToIndex(int index) {
    // _controller 控制器执行动画 让歌词列表滚动
    _controller.animateTo(index * itemHeight,
        duration: const Duration(milliseconds: 200), curve: Curves.linear);
  }

  void _play() {
    isPlay = true;

    _changeCurrentTime(index);

    _jumpProgress();
  }

  void _pause() {
    isPlay = false;
  }

  void _stop() {
    isPlay = false;
    index = 0;
  }

  @override
  void dispose() {
    _controller.dispose();
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final List<LrcInfo> lrcList = widget.lrcList;

    return SizedBox(
      width: double.infinity,
      height: double.infinity,
      child: BlocListener<MusicPlayerBloc, MusicPlayerState>(
        listener: (context, state) {
          if (state.status.isPlay) {
            _play();
          } else if (state.status.isPause) {
            _pause();
          } else if (state.status.isStop) {
            _stop();
          }
        },
        child: ListWheelScrollView(
          controller: _controller,
          itemExtent: itemHeight,
          useMagnifier: true,
          // magnification: 1.2,
          overAndUnderCenterOpacity: 0.1,
          perspective: 0.001,
          squeeze: 1.5,
          children: List.generate(lrcList.length, (i) {
            return Container(
              width: double.infinity,
              // padding: const EdgeInsets.only(left: 10),
              alignment: Alignment.centerLeft,
              child: Text(
                lrcList[i].lineLyric!,
                maxLines: 1,
                style: const TextStyle(
                  fontSize: 12,
                  height: 1.5,
                  // color: CustomColors.paimary.withOpacity(0.6),
                ),
                overflow: TextOverflow.ellipsis,
                // textAlign: TextAlign.left,
              ),
            );
          }),
          onSelectedItemChanged: (i) {
            print('cheng item index: $i');
          },
        ),
      ),
    );
  }
}
