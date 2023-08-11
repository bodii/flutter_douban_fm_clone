import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_douban_fm_clone/common/controllers/player.dart';
import 'package:flutter_douban_fm_clone/common/functions/string_duration.dart';
import 'package:flutter_douban_fm_clone/models/song_info_and_lrc_model.dart';

class PlayDetailLrcWidget extends StatefulWidget {
  const PlayDetailLrcWidget(
      {super.key, required this.lrcList, required this.player});

  final List<LrcInfo> lrcList;
  final Player player;

  @override
  State<PlayDetailLrcWidget> createState() => _PlayDetailLrcState();
}

class _PlayDetailLrcState extends State<PlayDetailLrcWidget> {
  late ScrollController _controller;
  late Timer _timer;
  Timer? _timerItem;

  int index = 0;
  late Duration time;

  @override
  void initState() {
    super.initState();

    _controller = ScrollController();
    _controller.addListener(() {});
    final int maxHeight = widget.lrcList.length * 30;

    getTime();

    jump(maxHeight);
  }

  void getTime() {
    if (index + 1 >= widget.lrcList.length) {
      return;
    }

    String t1 = widget.lrcList[index + 1].time!;
    String t2 = widget.lrcList[index].time!;
    print('index: $index,  t1: $t1,  t2:$t2');

    Duration t1sDur = StringDuration.parseTimeToDuration(t1);
    Duration t2sDur = StringDuration.parseTimeToDuration(t2);

    time = t1sDur - t2sDur;
  }

  void jump(int totalHeight) {
    _timer = Timer.periodic(const Duration(microseconds: 10), (timer) {
      if (totalHeight == index * 30) {
        timer.cancel();
        return;
      }

      if (_timerItem == null || !_timerItem!.isActive) {
        _timerItem = Timer(time, () {
          if (totalHeight == index * 30) {
            _timerItem!.cancel();
            return;
          }
          index++;

          _timeChange(index);

          getTime();
        });
      }
    });
  }

  void _timeChange(int index) {
    // _controller 控制器执行动画 让歌词列表滚动
    _controller.animateTo(index * 30,
        duration: const Duration(milliseconds: 200), curve: Curves.linear);
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
      child: ListWheelScrollView(
        controller: _controller,
        itemExtent: 30,
        useMagnifier: true,
        magnification: 1.2,
        overAndUnderCenterOpacity: 0.1,
        perspective: 0.001,
        squeeze: 1.5,
        children: List.generate(lrcList.length, (index) {
          return Text(
            lrcList[index].lineLyric!,
            maxLines: 1,
            style: const TextStyle(fontSize: 12),
            overflow: TextOverflow.ellipsis,
          );
        }),
      ),
    );
  }
}
