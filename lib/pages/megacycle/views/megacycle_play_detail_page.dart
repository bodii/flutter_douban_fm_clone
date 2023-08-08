import 'package:flutter/material.dart';
import 'package:flutter_douban_fm_clone/common/custom_color.dart';
import 'package:flutter_douban_fm_clone/common/request.dart';
import 'package:flutter_douban_fm_clone/models/song_info_and_lrc_model.dart';
import 'package:go_router/go_router.dart';

class MegacyclePlayDetailPage extends StatelessWidget {
  const MegacyclePlayDetailPage({
    super.key,
    required this.musicId,
  });
  final String musicId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          leading: IconButton(
        onPressed: () {
          context.pop();
        },
        icon: const Icon(Icons.arrow_back_ios),
      )),
      body: FutureBuilder(
        future: fetchSongInfoAndLrc(musicId),
        builder: (context, AsyncSnapshot<SongInfoAndLrc> snapshot) {
          if (snapshot.connectionState == ConnectionState.none ||
              !snapshot.hasData) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return const Center(
              child: Text('not data!'),
            );
          }

          SongInfoAndLrc songInfoAndLrc = snapshot.data!;

          return Container(
            padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 40),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '${songInfoAndLrc.songinfo!.album} MHz  ▾',
                  style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.black54),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 30),
                Text(
                  songInfoAndLrc.songinfo!.songName!,
                  style: const TextStyle(
                      fontSize: 22, fontWeight: FontWeight.w600),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  songInfoAndLrc.songinfo!.artist!,
                  style: const TextStyle(color: Colors.black38),
                ),
                const SizedBox(height: 50),
                SizedBox(
                  height: 400,
                  child: ListView.builder(
                    itemCount: songInfoAndLrc.lrclist!.length,
                    itemBuilder: (context, index) {
                      return Text(
                        songInfoAndLrc.lrclist![index].lineLyric!,
                        style: const TextStyle(
                            color: Colors.black38, fontSize: 15, height: 2.5),
                      );
                    },
                  ),
                ),
                const SizedBox(height: 20),
                LinearProgressIndicator(
                  value: 44 / int.parse(songInfoAndLrc.songinfo!.duration!),
                  valueColor:
                      const AlwaysStoppedAnimation<Color>(CustomColors.paimary),
                  backgroundColor: CustomColors.paimary.withOpacity(0.1),
                ),
                const Text('00:44',
                    style: TextStyle(fontSize: 12, color: Colors.black38)),
                const SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.delete_outline, size: 30),
                      selectedIcon: const Icon(Icons.delete_forever, size: 30),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: Container(
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(50),
                          boxShadow: [
                            BoxShadow(
                              color: CustomColors.paimary.withOpacity(0.25),
                              offset: const Offset(0, 3.0),
                              blurRadius: 10.0,
                              spreadRadius: 0.3,
                            ),
                          ],
                        ),
                        child: const Icon(
                          Icons.play_arrow,
                          color: CustomColors.paimary,
                          size: 30,
                        ),
                      ),
                      selectedIcon: const Icon(
                        Icons.pause,
                        color: CustomColors.paimary,
                        size: 30,
                      ),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.favorite_border,
                        color: CustomColors.neutral,
                        size: 30,
                      ),
                      selectedIcon: const Icon(Icons.favorite,
                          color: CustomColors.neutral, size: 30),
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
