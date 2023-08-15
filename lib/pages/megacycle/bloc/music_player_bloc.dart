import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'ticker.dart';

part 'music_player_event.dart';
part 'music_player_state.dart';

class MusicPlayerBloc extends Bloc<MusicPlayerEvent, MusicPlayerState> {
  final int totalDuration;
  final Ticker _ticker;

  StreamSubscription<int>? _tickerSubscription;

  MusicPlayerBloc(this.totalDuration, {required Ticker ticker})
      : _ticker = ticker,
        super(MusicPlayerState(totalDuration: totalDuration)) {
    on<MusicPlayerStarted>(_onStarted);
    on<MusicPlayerPaused>(_onPaused);
    on<MusicPlayerResumed>(_onResumed);
    on<MusicPlayerReset>(_onReset);
    on<MusicPlayerToggle>(_onToggle);
    on<_MusicPlayerTicked>(_onTicked);
  }

  @override
  Future<void> close() {
    _tickerSubscription?.cancel();
    return super.close();
  }

  void _onStarted(MusicPlayerStarted event, Emitter<MusicPlayerState> emit) {
    emit(state.copyWith(status: MusicPlayStatus.play));
    _tickerSubscription?.cancel();
    _tickerSubscription = _ticker
        .tick(ticks: 0, total: totalDuration)
        .listen((duration) => add(_MusicPlayerTicked(duration: duration)));
  }

  void _onPaused(MusicPlayerPaused event, Emitter<MusicPlayerState> emit) {
    if (state.status.isPlay) {
      _tickerSubscription?.pause();
      emit(state.copyWith(status: MusicPlayStatus.pause));
    }
  }

  void _onResumed(MusicPlayerResumed event, Emitter<MusicPlayerState> emit) {
    if (state.status.isPause) {
      _tickerSubscription?.resume();
      emit(state.copyWith(status: MusicPlayStatus.play));
    }
  }

  void _onReset(MusicPlayerReset event, Emitter<MusicPlayerState> emit) {
    emit(
        state.copyWith(duration: event.duration, status: MusicPlayStatus.play));
    _tickerSubscription?.cancel();
    _tickerSubscription = _ticker
        .tick(ticks: event.duration, total: totalDuration - state.duration)
        .listen((duration) {
      return add(_MusicPlayerTicked(duration: duration));
    });
  }

  void _onToggle(MusicPlayerToggle event, Emitter<MusicPlayerState> emit) {
    // print('state.duration: ${state.duration}');
    // print('state.totalDuration: ${state.totalDuration}');
    // print('state.status: ${state.status}');

    if (state.status.isPlay) {
      add(const MusicPlayerPaused());
    } else if (state.status.isPause) {
      add(const MusicPlayerResumed());
    } else if (state.status.isStop) {
      add(const MusicPlayerStarted());
    }
  }

  void _onTicked(_MusicPlayerTicked event, Emitter<MusicPlayerState> emit) {
    // print('onTicked event is duration: ${event.duration}');
    emit(
      event.duration >= state.totalDuration
          ? state.copyWith(duration: 0, status: MusicPlayStatus.stop)
          : state.copyWith(
              duration: event.duration, status: MusicPlayStatus.play),
    );
  }
}
