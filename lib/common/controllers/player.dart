import 'dart:async';

import 'package:flutter/material.dart';

enum PlayerStatus {
  play,
  pause,
  stop,
}

final class Player extends ChangeNotifier {
  Player({
    required this.totalSeconds,
  });

  final int totalSeconds;

  int _currentSeconds = 0;

  int get current => _currentSeconds;

  PlayerStatus status = PlayerStatus.stop;

  bool get isPlay => status == PlayerStatus.play;
  bool get isPause => status == PlayerStatus.pause;
  bool get isStop => status == PlayerStatus.stop;

  late Timer _timer;

  int get remainingSeconds => totalSeconds - _currentSeconds;

  double get playRatio => _currentSeconds / totalSeconds;

  set current(int seconds) {
    _currentSeconds = seconds;
    notifyListeners();

    play();
  }

  /// currentSeconds => '01:01'
  String get currentTime => _durationTransform(_currentSeconds);

  String get totalTime => _durationTransform(totalSeconds);

  String _durationTransform(int seconds) {
    final d = Duration(seconds: seconds);
    return d.toString().substring(2, 7);
  }

  void play() {
    if (status == PlayerStatus.play) {
      return;
    }

    if (status == PlayerStatus.stop) {
      _currentSeconds = 0;
    }

    if (_currentSeconds == totalSeconds) {
      stop();
      return;
    }

    status = PlayerStatus.play;
    notifyListeners();

    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_currentSeconds == totalSeconds) {
        status = PlayerStatus.stop;
        _timer.cancel();
      } else {
        _currentSeconds++;
      }

      notifyListeners();
    });
  }

  void stop() {
    if (status == PlayerStatus.play) {
      _timer.cancel();
    }

    if (_currentSeconds == totalSeconds) {
      status = PlayerStatus.stop;
    } else {
      status = PlayerStatus.pause;
    }

    notifyListeners();
  }

  void toggle() {
    if (status != PlayerStatus.play) {
      play();
    } else {
      stop();
    }
  }

  void initSounder() {}
}
