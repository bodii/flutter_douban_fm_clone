import 'package:flutter/material.dart';
import 'package:flutter_douban_fm_clone/database/play_list/play_list_db.dart';
import 'package:flutter_douban_fm_clone/models/play_list_model.dart';
import 'package:go_router/go_router.dart';

class CollectPlayListWidget extends StatelessWidget {
  const CollectPlayListWidget({super.key});

  Future<List<PlayList>> getPlayListData() async {
    PlayListDb playListDb = PlayListDb();
    List<PlayList> playList = await playListDb.pageQuery();

    return playList;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      child: FutureBuilder(
          future: getPlayListData(),
          builder: (context, AsyncSnapshot<List<PlayList>> snapshot) {
            if (snapshot.hasError) {
              return Center(
                child: Text(snapshot.error.toString()),
              );
            }

            if (snapshot.connectionState != ConnectionState.done) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }

            List<PlayList>? playlists = snapshot.data;
            if (playlists == null || playlists.isEmpty) {
              return ofNotData();
            }

            return ListView.builder(
              itemCount: playlists.length,
              itemBuilder: (context, index) {
                PlayList playList = playlists[index];

                return ListTile(
                  onTap: () {
                    context.push('/home/index/discovery/detail/${playList.id}');
                  },
                  leading: Image.network(
                    playList.img300!,
                  ),
                  title: Text(
                    playList.name!,
                    maxLines: 2,
                    overflow: TextOverflow.fade,
                  ),
                );
              },
            );
          }),
    );
  }

  Widget ofNotData() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 150, bottom: 25.0),
          child: Image.asset(
            'assets/icons/song_list.png',
            width: 110,
          ),
        ),
        const Text(
          '这里收集了你喜欢的歌单',
          style: TextStyle(color: Colors.black38, fontSize: 13),
        ),
      ],
    );
  }
}
