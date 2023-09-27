part of 'music_player_bloc.dart';

sealed class MusicPlayerEvent {
  const MusicPlayerEvent();
}

final class MusicPlayerLoading extends MusicPlayerEvent {
  const MusicPlayerLoading({required this.musicId, required this.userId});

  final String musicId;
  final int userId;
}

final class MusicPlayerLoaded extends MusicPlayerEvent {
  const MusicPlayerLoaded({required this.musicId});

  final int musicId;
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

final class MusicFavoriteToggle<T> extends MusicPlayerEvent {
  const MusicFavoriteToggle({required this.info, required this.mySongListId});

  final T info;
  final int mySongListId;
}
