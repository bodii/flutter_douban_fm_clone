part of 'music_player_bloc.dart';

enum MusicPlayStatus { play, pause, stop }

extension MusicPlayStatusX on MusicPlayStatus {
  bool get isPlay => this == MusicPlayStatus.play;
  bool get isPause => this == MusicPlayStatus.pause;
  bool get isStop => this == MusicPlayStatus.stop;
}

final class MusicPlayerState extends Equatable {
  const MusicPlayerState({
    this.totalDuration = 0,
    this.duration = 0,
    this.status = MusicPlayStatus.stop,
  });

  final int totalDuration;
  final int duration;
  final MusicPlayStatus status;

  MusicPlayerState copyWith({
    int? totalDuration,
    int? duration,
    MusicPlayStatus? status,
  }) =>
      MusicPlayerState(
        totalDuration: totalDuration ?? this.totalDuration,
        duration: duration ?? this.duration,
        status: status ?? this.status,
      );

  @override
  List<Object> get props => [totalDuration, duration, status];
}
