import 'dart:async';
import 'dart:developer';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_douban_fm_clone/common/functions/stream_ticker.dart';
import 'package:flutter_douban_fm_clone/common/handler/file_download.dart';
import 'package:flutter_douban_fm_clone/common/request.dart';
import 'package:flutter_douban_fm_clone/database/music/music_basic_db.dart';
import 'package:flutter_douban_fm_clone/models/music_basic_info_model.dart';
import 'package:flutter_douban_fm_clone/models/music_play_url_model.dart';
import 'package:flutter_douban_fm_clone/common/handler/music_background_play.dart';
import 'package:flutter_douban_fm_clone/models/song_info_and_lrc_model.dart';
import 'package:just_audio/just_audio.dart';

part 'music_player_event.dart';
part 'music_player_state.dart';

class MusicPlayerBloc extends Bloc<MusicPlayerEvent, MusicPlayerState> {
  final int totalDuration;
  final StreamTicker _ticker;

  StreamSubscription<int>? _tickerSubscription;

  MusicBackgroundPlay? _backgroundMusic;

  MusicPlayerBloc(this.totalDuration, {required StreamTicker ticker})
      : _ticker = ticker,
        super(MusicPlayerState(
            totalDuration: totalDuration, status: MusicPlayStatus.loading)) {
    on<MusicPlayerLoading>(_onLoading);
    on<MusicPlayerLoaded>(_onLoaded);
    on<MusicPlayerStarted>(_onStarted);
    on<MusicPlayerPaused>(_onPaused);
    on<MusicPlayerResumed>(_onResumed);
    on<MusicPlayerSeeked>(_onSeeked);
    on<MusicPlayerToggle>(_onToggle);
    on<MusicPlayerStoped>(_onStoped);
    on<_MusicPlayerTicked>(_onTicked);
    on<MusicFileDownloading>(_onDownloading);
    on<MusicFavoriteToggle>(_onFavoriteToggle);
  }

  @override
  Future<void> close() {
    _tickerSubscription?.cancel();
    _backgroundMusic?.cancel();

    return super.close();
  }

  Future<void> _onLoading(
      MusicPlayerLoading event, Emitter<MusicPlayerState> emit) async {
    MusicPlayUrl musicPlayUrl =
        await fetchMusicPayUrl(int.parse(event.musicId));
    log('music url: ${musicPlayUrl.url}');

    // add url path
    if (musicPlayUrl.url!.isNotEmpty) {
      emit(state.copyWith(musicUrl: musicPlayUrl.url));
    }

    // create background play object
    _backgroundMusic = MusicBackgroundPlay(sourceAddr: musicPlayUrl.url!);
    // load audio file
    bool? success = await _backgroundMusic?.load();
    // music play in background is loaded failure
    if (!success!) {
      _backgroundMusic?.cancel();
      emit(state.copyWith(status: MusicPlayStatus.loaded));
      return;
    }
    // music play in background is loaded success
    // listen status
    _backgroundMusic?.useBackgroundListener().listen((PlayerState playerState) {
      final processingState = playerState.processingState;
      if (processingState == ProcessingState.idle ||
          processingState == ProcessingState.loading) {
        log('audio play file loading...');
      } else if (processingState == ProcessingState.buffering) {
        log('audio play file buffering...');
      } else if (processingState == ProcessingState.ready) {
        add(MusicPlayerLoaded(musicId: int.parse(event.musicId)));
      } else if (processingState == ProcessingState.completed) {
        add(const MusicPlayerStoped());
      }
    });
  }

  void _onLoaded(
      MusicPlayerLoaded event, Emitter<MusicPlayerState> emit) async {
    MusicBasicDb musicBasicDb = MusicBasicDb();
    bool isFavorite = await musicBasicDb.isExists(event.musicId);

    emit(
        state.copyWith(status: MusicPlayStatus.loaded, isFavorite: isFavorite));
  }

  void _onStarted(MusicPlayerStarted event, Emitter<MusicPlayerState> emit) {
    print('current status: ${state.status}');
    emit(state.copyWith(status: MusicPlayStatus.playing));
    _tickerSubscription?.cancel();
    _tickerSubscription = _ticker
        .tick(ticks: 0, total: totalDuration)
        .listen((duration) => add(_MusicPlayerTicked(duration: duration)));

    // music file play
    _backgroundMusic?.play();
  }

  void _onPaused(MusicPlayerPaused event, Emitter<MusicPlayerState> emit) {
    if (!state.status.isPlay) {
      return;
    }

    _tickerSubscription?.pause();
    emit(state.copyWith(status: MusicPlayStatus.pauseing));
    // music file pause
    _backgroundMusic?.pause();
  }

  void _onResumed(MusicPlayerResumed event, Emitter<MusicPlayerState> emit) {
    if (state.status.isPause) {
      _tickerSubscription?.resume();
      emit(state.copyWith(status: MusicPlayStatus.playing));
    }

    // music file resum
    _backgroundMusic?.play();
  }

  void _onSeeked(MusicPlayerSeeked event, Emitter<MusicPlayerState> emit) {
    emit(state.copyWith(
        duration: event.duration, status: MusicPlayStatus.seeking));
    _tickerSubscription?.cancel();
    _tickerSubscription = _ticker
        .tick(ticks: event.duration, total: totalDuration - state.duration)
        .listen((duration) {
      return add(_MusicPlayerTicked(duration: duration));
    });

    // music file seek
    _backgroundMusic?.seek(Duration(seconds: event.duration));

    emit(state.copyWith(status: MusicPlayStatus.playing));
  }

  void _onToggle(MusicPlayerToggle event, Emitter<MusicPlayerState> emit) {
    print('state.status: ${state.status}');
    if (state.status.isPlay) {
      add(const MusicPlayerPaused());
    } else if (state.status.isPause) {
      add(const MusicPlayerResumed());
    } else if (state.status.isStop || state.status.isLoaded) {
      add(const MusicPlayerStarted());
    }
  }

  void _onStoped(MusicPlayerStoped event, Emitter<MusicPlayerState> emit) {
    emit(state.copyWith(status: MusicPlayStatus.stop));

    // music file stop
    _backgroundMusic?.stop();
  }

  void _onTicked(_MusicPlayerTicked event, Emitter<MusicPlayerState> emit) {
    emit(
      event.duration >= state.totalDuration
          ? state.copyWith(duration: 0, status: MusicPlayStatus.stop)
          : state.copyWith(
              duration: event.duration, status: MusicPlayStatus.playing),
    );
  }

  void _onDownloading(
      MusicFileDownloading event, Emitter<MusicPlayerState> emit) async {
    log('music url: ${state.musicUrl}');
    log('save name: ${event.saveName}');
    try {
      FileDownlaod downloader = FileDownlaod(
        downloadUrl: state.musicUrl,
        saveFileName: event.saveName,
      );

      await downloader.init();
      await downloader.request();
    } catch (e) {
      log(e.toString());
    }
  }

  void _onDownloaded(
      MusicFileDownloading event, Emitter<MusicPlayerState> emit) {}

  void _onFavoriteToggle(
      MusicFavoriteToggle event, Emitter<MusicPlayerState> emit) async {
    MusicBasicDb musicBasicDb = MusicBasicDb();
    bool result =
        await musicBasicDb.toggle<MusicBasicInfo>(event.info, state.isFavorite);

    emit(state.copyWith(isFavorite: result));
  }
}
