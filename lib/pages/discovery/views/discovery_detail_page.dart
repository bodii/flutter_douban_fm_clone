import 'package:flutter/material.dart';
import 'package:flutter_douban_fm_clone/common/custom_color.dart';
import 'package:flutter_douban_fm_clone/common/request.dart';
import 'package:flutter_douban_fm_clone/database/play_list/play_list_db.dart';
import 'package:flutter_douban_fm_clone/models/music_info_model.dart';
import 'package:flutter_douban_fm_clone/models/play_list_model.dart';
import 'package:go_router/go_router.dart';

class DiscoveryDetailPage extends StatefulWidget {
  const DiscoveryDetailPage({super.key, required this.playListId});

  final String playListId;

  @override
  State<DiscoveryDetailPage> createState() => _DiscoveryDetailPageState();
}

class _DiscoveryDetailPageState extends State<DiscoveryDetailPage> {
  late PlayListDb playListDb;
  bool isFavorite = false;

  @override
  void initState() {
    super.initState();

    playListDb = PlayListDb();

    checkFavorite(int.parse(widget.playListId));
  }

  Future<void> checkFavorite(int playListId) async {
    isFavorite = await playListDb.isExists(playListId);
  }

  Future<bool> addDbFavorite(PlayList playList) async {
    bool success = await playListDb.add(playList);
    return success;
  }

  Future<bool> cancelFavorite(int playListId) async {
    bool success = await playListDb.cancel(playListId);
    return success;
  }

  Future<void> toggleFavorite(PlayList playList) async {
    bool result = await playListDb.toggle(playList, isFavorite);

    setState(() {
      isFavorite = result;
    });
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: fetchPlayListInfo(int.parse(widget.playListId)),
        builder: (context, AsyncSnapshot<PlayList> snapshot) {
          if (snapshot.connectionState == ConnectionState.none ||
              !snapshot.hasData) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return const Center(
              child: Text('not data!'),
            );
          }

          final PlayList playList = snapshot.data!;

          return _mainBuild(playList, context);
        });
  }

  Widget _mainBuild(PlayList playList, BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    List<MusicInfo> musicList = playList.musicList!;

    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 580,
            child: Stack(
              children: [
                Container(
                  width: double.infinity,
                  height: 520,
                  color: Colors.blue,
                  child: Padding(
                    padding: const EdgeInsets.only(
                        left: 20.0, top: 50.0, right: 20.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            IconButton(
                                onPressed: () {
                                  context.pop();
                                },
                                icon: const Icon(Icons.arrow_back_ios)),
                            IconButton(
                                onPressed: () {
                                  debugPrint('check more');
                                },
                                icon: const Icon(Icons.more_vert)),
                          ],
                        ),
                        Text(
                          playList.name!,
                          style: const TextStyle(
                              fontSize: 22, fontWeight: FontWeight.w900),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                        Text(
                          playList.info!,
                          style: const TextStyle(fontSize: 12),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 25.0),
                          child: Image.network(
                            playList.img700!,
                            fit: BoxFit.cover,
                            width: double.infinity,
                            height: 250,
                          ),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  bottom: 27,
                  child: Container(
                    width: size.width,
                    height: 65,
                    alignment: Alignment.center,
                    child: Container(
                      width: size.width * 0.9,
                      height: double.infinity,
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.20),
                            offset: const Offset(0.0, 5.0),
                            blurRadius: 8.0,
                            spreadRadius: 0.1,
                          ),
                        ],
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            width: 100,
                            child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Icon(
                                    Icons.play_arrow_sharp,
                                    size: 32,
                                  ),
                                  Text('${playList.total} 首',
                                      style: const TextStyle(
                                        fontSize: 12,
                                        color: CustomColors.tertiary,
                                      )),
                                ]),
                          ),
                          SizedBox(
                            width: 100,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                IconButton(
                                  onPressed: () {},
                                  icon: const Icon(
                                    Icons.ios_share_outlined,
                                    size: 23,
                                  ),
                                ),
                                IconButton(
                                  onPressed: () async {
                                    await toggleFavorite(playList);
                                  },
                                  isSelected: isFavorite,
                                  icon: const Icon(
                                    Icons.favorite_border,
                                    color: CustomColors.neutral,
                                    size: 23,
                                  ),
                                  selectedIcon: const Icon(
                                    Icons.favorite,
                                    color: CustomColors.neutral,
                                    size: 23,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(40),
                      child: Image.network(playList.uPic!,
                          width: 40, height: 40, fit: BoxFit.cover),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Text(
                        playList.uname!.replaceAll('kuwo', ''),
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w900,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
                const Text('播放列表'),
                SizedBox(
                  width: double.infinity,
                  height: 250,
                  child: ListView.builder(
                    itemCount: musicList.length,
                    itemBuilder: (context, index) {
                      MusicInfo musicInfo = musicList[index];
                      return ListTile(
                        leading: Text('${index + 1}',
                            style: const TextStyle(
                              color: Colors.black26,
                            )),
                        title: Text(musicInfo.name!,
                            style: const TextStyle(
                              color: Colors.black87,
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                            )),
                        subtitle: Text(musicInfo.artist!,
                            style: const TextStyle(
                              color: Colors.black26,
                              fontSize: 13,
                            )),
                        trailing: IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.more_horiz,
                            size: 20,
                            color: Colors.black54,
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
