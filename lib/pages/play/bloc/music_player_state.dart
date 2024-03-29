part of 'music_player_bloc.dart';

enum MusicPlayStatus { loading, loaded, playing, pauseing, seeking, stop }

extension MusicPlayStatusX on MusicPlayStatus {
  bool get isLoading => this == MusicPlayStatus.loading;
  bool get isLoaded => this == MusicPlayStatus.loaded;
  bool get isPlay => this == MusicPlayStatus.playing;
  bool get isPause => this == MusicPlayStatus.pauseing;
  bool get isSeeking => this == MusicPlayStatus.seeking;
  bool get isStop => this == MusicPlayStatus.stop;
}

final class MusicPlayerState extends Equatable {
  const MusicPlayerState({
    this.totalDuration = 0,
    this.duration = 0,
    this.status = MusicPlayStatus.stop,
    this.musicUrl = '',
    this.isFavorite = false,
    this.userId = 0,
  });

  final int totalDuration;
  final int duration;
  final MusicPlayStatus status;
  final String musicUrl;
  final bool isFavorite;
  final int userId;

  MusicPlayerState copyWith({
    int? totalDuration,
    int? duration,
    MusicPlayStatus? status,
    String? musicUrl,
    bool? isFavorite,
    int? userId,
  }) =>
      MusicPlayerState(
        totalDuration: totalDuration ?? this.totalDuration,
        duration: duration ?? this.duration,
        status: status ?? this.status,
        musicUrl: musicUrl ?? this.musicUrl,
        isFavorite: isFavorite ?? this.isFavorite,
        userId: userId ?? this.userId,
      );

  @override
  List<Object> get props =>
      [totalDuration, duration, status, musicUrl, isFavorite, userId];
}
