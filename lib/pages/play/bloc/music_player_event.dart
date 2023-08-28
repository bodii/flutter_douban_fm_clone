part of 'music_player_bloc.dart';

sealed class MusicPlayerEvent {
  const MusicPlayerEvent();
}

final class MusicPlayerLoading extends MusicPlayerEvent {
  const MusicPlayerLoading({required this.musicId});

  final String musicId;
}

final class MusicPlayerLoaded extends MusicPlayerEvent {
  const MusicPlayerLoaded();
}

final class MusicPlayerStarted extends MusicPlayerEvent {
  const MusicPlayerStarted();
}

final class MusicPlayerPaused extends MusicPlayerEvent {
  const MusicPlayerPaused();
}

final class MusicPlayerResumed extends MusicPlayerEvent {
  const MusicPlayerResumed();
}

final class MusicPlayerSeeked extends MusicPlayerEvent {
  const MusicPlayerSeeked({required this.duration});
  final int duration;
}

final class MusicPlayerStoped extends MusicPlayerEvent {
  const MusicPlayerStoped();
}

final class MusicPlayerToggle extends MusicPlayerEvent {
  const MusicPlayerToggle();
}

final class _MusicPlayerTicked extends MusicPlayerEvent {
  const _MusicPlayerTicked({required this.duration});
  final int duration;
}

final class MusicFileDownloading extends MusicPlayerEvent {
  const MusicFileDownloading({required this.saveName});
  final String saveName;
}

final class MusicFileDownloaded extends MusicPlayerEvent {
  const MusicFileDownloaded();
}
