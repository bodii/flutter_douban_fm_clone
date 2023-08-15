part of 'music_player_bloc.dart';

sealed class MusicPlayerEvent {
  const MusicPlayerEvent();
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

final class MusicPlayerReset extends MusicPlayerEvent {
  const MusicPlayerReset({required this.duration});
  final int duration;
}

final class MusicPlayerToggle extends MusicPlayerEvent {
  const MusicPlayerToggle();
}

final class _MusicPlayerTicked extends MusicPlayerEvent {
  const _MusicPlayerTicked({required this.duration});
  final int duration;
}
