import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_douban_fm_clone/common/functions/string_duration.dart';
import 'package:flutter_douban_fm_clone/models/song_info_and_lrc_model.dart';
import 'package:flutter_douban_fm_clone/pages/play/bloc/music_player_bloc.dart';

class MusicPlayLrc extends StatefulWidget {
  const MusicPlayLrc({super.key, required this.lrcList});

  final List<LrcInfo> lrcList;

  @override
  State<MusicPlayLrc> createState() => _MusicPlayLrc();
}

class _MusicPlayLrc extends State<MusicPlayLrc> {
  ScrollController? _controller;

  /// total time timer
  Timer? _timer;

  /// timer for the duration of each line of lyrics
  Timer? _timerItem;

  /// current time index
  late int index;

  /// the difference between the next index time and current index time
  late Duration time;
  late List<Duration> totalTimeList = [];

  /// total height occupied by all lyrics widgets
  late double totalHeight;

  bool isPlay = false;

  /// the height occupied by each line of lyrics widget
  static const double itemHeight = 30;

  late List<LrcInfo> lrcList;

  @override
  void initState() {
    super.initState();

    lrcList = widget.lrcList;
    if (lrcList.isEmpty) {
      return;
    }

    index = 0;

    _controller = ScrollController();

    // _controller?.addListener(() {
    // totalOffsetList.add(_controller.offset);
    // print('totalOffsetList: $totalOffsetList');
    // });

    _initGetTotalTimeList();

    totalHeight = lrcList.length * itemHeight;
  }

  /// get a list of times by each line of lyrics list
  void _initGetTotalTimeList() {
    for (var lrc in lrcList) {
      Duration time = StringDuration.parseTimeToDuration(lrc.time!);
      totalTimeList.add(time);
    }
  }

  /// calculates the difference between the next index time and current
  /// index time
  void _changeCurrentTime(int index) {
    if (index + 1 >= lrcList.length) {
      return;
    }

    String t1 = lrcList[index + 1].time!;
    String t2 = lrcList[index].time!;
    // print('index: $index,  t1: $t1,  t2:$t2');

    Duration t1sDur = StringDuration.parseTimeToDuration(t1);
    Duration t2sDur = StringDuration.parseTimeToDuration(t2);

    time = t1sDur - t2sDur;
  }

  /// animato to lrc list index widget
  void _animateToIndex(int index) {
    if (_controller!.hasClients) {
      // _controller 控制器执行动画 让歌词列表滚动
      _controller?.animateTo(index * itemHeight,
          duration: const Duration(milliseconds: 200), curve: Curves.linear);
    }
  }

  /// jump progress to lrc list widget
  void _jumpProgress() {
    if (!isPlay) {
      return;
    }
    // the exceution time of lyrics times
    _timer = Timer.periodic(const Duration(microseconds: 10), (timer) {
      if (totalHeight == index * itemHeight) {
        timer.cancel();
        return;
      }

      if (_timerItem == null || !_timerItem!.isActive) {
        // the execution time of each line of lyrics
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

  /// listen to play events
  void _play() {
    isPlay = true;

    _changeCurrentTime(index);

    _jumpProgress();
  }

  /// listen to pause events
  void _pause() {
    isPlay = false;
  }

  /// listen to play events
  void _stop() {
    isPlay = false;
    index = 0;
  }

  /// find current seconds to index
  int _findOneTimeToIndex(int seconds) {
    Duration duration = Duration(seconds: seconds);
    int newIndex = totalTimeList.indexWhere(
      (t) => t.compareTo(duration) != -1,
    );

    return newIndex - 1;
  }

  /// listen when the playback time jumps
  void _listenerSeek(int duration) {
    int newIndex = _findOneTimeToIndex(duration);
    if ((newIndex - index).abs() > 2 && newIndex > 0) {
      index = newIndex;
    }
    // print('index: $index, newIndex: $newIndex, duration: $duration');
  }

  @override
  void dispose() {
    _timer?.cancel();
    _controller?.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return lrcList.isEmpty ? _onLrcListIsEmpty() : _onLrcListIsNotEmpty();
  }

  Widget _onLrcListIsEmpty() {
    return const Text('暂无歌词');
  }

  Widget _onLrcListIsNotEmpty() {
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
          } else if (state.status.isSeeking) {
            _listenerSeek(state.duration);
          }
        },
        child: ListWheelScrollView(
          controller: _controller,
          itemExtent: itemHeight,
          useMagnifier: true,
          overAndUnderCenterOpacity: 0.1,
          perspective: 0.001,
          squeeze: 1.5,
          children: List.generate(lrcList.length, (i) {
            return Align(
              alignment: Alignment.topLeft,
              child: Text(
                lrcList[i].lineLyric!,
                maxLines: 1,
                style: const TextStyle(
                  fontSize: 14,
                  height: 2,
                  // color: CustomColors.paimary.withOpacity(0.6),
                ),
                overflow: TextOverflow.ellipsis,
                // textAlign: TextAlign.left,
              ),
            );
          }),
        ),
      ),
    );
  }
}
