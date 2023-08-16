import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
// ignore: depend_on_referenced_packages
import 'package:audio_session/audio_session.dart';

enum MusicFileResourceType { url, file, asset, package }

class MusicPlayInBackground with WidgetsBindingObserver {
  MusicPlayInBackground({
    required this.sourceAddr,
    this.resourceType = MusicFileResourceType.url,
  });

  /// resource path or url path
  final String sourceAddr;
  final MusicFileResourceType resourceType;

  /// audio file time
  Duration? duration;

  final _player = AudioPlayer();

  /// return player
  AudioPlayer get player => _player;

  Future<void> load() async {
    ambiguate(WidgetsBinding.instance)!.addObserver(this);
    // SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    //   statusBarColor: Colors.black,
    // ));

    // Inform the operating system of our app's audio attributes etc.
    // We pick a reasonable default for an app that plays speech.
    final session = await AudioSession.instance;
    await session.configure(const AudioSessionConfiguration.speech());
    // Listen to errors during playback.

    // _player.playbackEventStream.listen((event) {},
    //     onError: (Object e, StackTrace stackTrace) {
    //   print('A stream error occurred: $e');
    // });

    try {
      Uri sourceUri;
      switch (resourceType) {
        case MusicFileResourceType.file:
          sourceUri = Uri.file(sourceAddr);
        case MusicFileResourceType.url:
          sourceUri = Uri.parse(sourceAddr);
        case MusicFileResourceType.asset:
          sourceUri = Uri.parse('asset:///$sourceAddr');
        case MusicFileResourceType.package:
          sourceUri = Uri.parse('asset:///packages/$sourceAddr');
      }

      duration = await _player.setAudioSource(AudioSource.uri(sourceUri));
      await _player.setLoopMode(LoopMode.off);
    } catch (e) {
      log("Error: loading audio source: $e", error: e);
    }
  }

  void cancel() {
    ambiguate(WidgetsBinding.instance)!.removeObserver(this);
    // Release decoders and buffers back to the operating system making them
    // available for other apps to use.
    _player.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.paused) {
      // Release the player's resources when not in use. We use "stop" so that
      // if the app resumes later, it will still remember what position to
      // resume from.
      _player.stop();
    }
  }

  /// return player stream
  Stream<PlayerState> withBackground() {
    return _player.playerStateStream;
  }
}

class PositionData {
  final Duration position;
  final Duration bufferedPosition;
  final Duration duration;

  PositionData(this.position, this.bufferedPosition, this.duration);
}

T? ambiguate<T>(T? value) => value;
