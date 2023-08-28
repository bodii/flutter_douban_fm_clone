import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
// ignore: depend_on_referenced_packages
import 'package:audio_session/audio_session.dart';

enum MusicFileResourceType { url, file, asset, package }

enum MusicBackgroundPlayState {
  /// The player has not loaded an [AudioSource].
  idle,

  /// The player is loading an [AudioSource].
  loading,

  /// The player is buffering audio and unable to play.
  buffering,

  /// The player is has enough audio buffered and is able to play.
  ready,

  /// The player has reached the end of the audio.
  completed,

  canceled,

  unknown,
}

class MusicBackgroundPlay with WidgetsBindingObserver {
  MusicBackgroundPlay({
    required this.sourceAddr,
    this.resourceType = MusicFileResourceType.url,
  });

  /// resource path or url path
  final String sourceAddr;
  final MusicFileResourceType resourceType;

  MusicBackgroundPlayState _status = MusicBackgroundPlayState.loading;

  /// audio file time
  Duration? duration;

  AudioPlayer? _player;

  /// return player
  // AudioPlayer get player => _player;

  MusicBackgroundPlayState get status => _status;

  bool _loaded = false;

  Future<bool> load() async {
    _player = AudioPlayer();

    _ambiguate(WidgetsBinding.instance)!.addObserver(this);
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

      duration = await _player?.setAudioSource(AudioSource.uri(sourceUri));
      await _player?.setLoopMode(LoopMode.off);

      _loaded = true;

      return true;
    } catch (e) {
      log("Error: loading audio source: $e", error: e);
      return false;
    }
  }

  void cancel() {
    _ambiguate(WidgetsBinding.instance)!.removeObserver(this);
    // Release decoders and buffers back to the operating system making them
    // available for other apps to use.
    _player?.dispose();

    _status = MusicBackgroundPlayState.canceled;
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.paused) {
      // Release the player's resources when not in use. We use "stop" so that
      // if the app resumes later, it will still remember what position to
      // resume from.
      _player?.stop();
    }
  }

  /// return player stream
  Stream<PlayerState> useBackgroundListener() {
    assert(_loaded, 'music background play is not loaded');

    return _player!.playerStateStream;
  }

  void useBackgroundListenerUpdateStatusValue() {
    assert(_loaded, 'music background play is not loaded');

    _player!.playerStateStream.listen((PlayerState playerState) {
      final processingState = playerState.processingState;
      if (processingState == ProcessingState.idle) {
        _status = MusicBackgroundPlayState.idle;
      } else if (processingState == ProcessingState.loading) {
        _status = MusicBackgroundPlayState.loading;
      } else if (processingState == ProcessingState.buffering) {
        _status = MusicBackgroundPlayState.buffering;
      } else if (processingState == ProcessingState.ready) {
        _status = MusicBackgroundPlayState.ready;
      } else if (processingState == ProcessingState.completed) {
        _status = MusicBackgroundPlayState.completed;
      } else {
        _status = MusicBackgroundPlayState.unknown;
      }
    });
  }

  T? _ambiguate<T>(T? value) => value;

  /// music file play
  Future<void> play() async {
    await _player?.play();
  }

  /// music file pause
  Future<void> pause() async {
    _player?.pause();
  }

  /// music file seek
  ///
  /// [duration] this is seek to time point
  Future<void> seek(Duration duration) async {
    _player?.seek(duration);
  }

  /// stop music
  Future<void> stop() async {
    // music file pause
    _player?.seek(Duration.zero);
    _player?.pause();
  }
}
