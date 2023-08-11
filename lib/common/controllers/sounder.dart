import 'package:flutter_douban_fm_clone/common/request.dart';
import 'package:flutter_douban_fm_clone/models/music_play_url_model.dart';
import 'package:just_audio/just_audio.dart';

class NetWorkMusicSounder {
  final AudioPlayer _sounder = AudioPlayer();

  String url = '';

  Future<String> getMusicUrl(String musicId) async {
    MusicPlayUrl url = await fetchMusicPayUrl(int.parse(musicId));

    return url.url!;
  }

  Future<Duration?> loading(String url) async {
    final duration = await _sounder.setUrl(url);

    return duration;
  }

  seek(int seekValue) async {
    await _sounder.seek(Duration(seconds: seekValue));
  }

  play() async {
    await _sounder.play();
  }

  pause() async {
    await _sounder.pause();
  }

  stop() async {
    await _sounder.stop();
  }
}
