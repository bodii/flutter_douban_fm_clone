import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_douban_fm_clone/database/play_list/play_list_db.dart';
import 'package:flutter_douban_fm_clone/models/play_list_model.dart';

class CollectPlayListWidget extends StatelessWidget {
  const CollectPlayListWidget({super.key});

  Future<List<PlayList>> getList() async {
    PlayListDb playListDb = PlayListDb();
    List<Map<String, dynamic>>? dataList = await playListDb.query(limit: 10);
    log(dataList.toString());

    if (dataList == null || dataList.isEmpty) {
      return [];
    }

    return PlayList.fromList(dataList);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: getList(),
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

          return Center(
            child: Text(playlists.first.name!),
          );
        });
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
