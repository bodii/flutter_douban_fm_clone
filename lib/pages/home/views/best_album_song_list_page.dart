import 'package:flutter/material.dart';
import 'package:flutter_douban_fm_clone/common/custom_color.dart';
import 'package:flutter_douban_fm_clone/common/request.dart';
import 'package:flutter_douban_fm_clone/models/album_info_model.dart';
import 'package:flutter_douban_fm_clone/models/music_info_model.dart';
import 'package:flutter_douban_fm_clone/common/controllers/selecter.dart';
import 'package:go_router/go_router.dart';

class BestAlbumSongListPage extends StatelessWidget {
  const BestAlbumSongListPage({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    return Scaffold(
      body: FutureBuilder(
        future: fetchAlbumInfo(130087),
        builder: (context, AsyncSnapshot<AlbumInfo> snapshot) {
          if (snapshot.connectionState == ConnectionState.none ||
              !snapshot.hasData) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return const Center(
              child: Text('not data!'),
            );
          }

          AlbumInfo albumInfo = snapshot.data!;

          return Stack(
            children: [
              SizedBox(
                width: double.infinity,
                height: size.height * 0.47,
                child: ShaderMask(
                  shaderCallback: (bounds) {
                    return const LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.white54,
                        Colors.white24,
                        Colors.transparent
                      ],
                      stops: [0, .4, 1],
                    ).createShader(Rect.fromLTRB(0, 0, 0, bounds.height - 30));
                  },
                  blendMode: BlendMode.dstATop,
                  child: Image.network(
                    albumInfo.pic!,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SingleChildScrollView(
                child: SizedBox(
                  width: double.infinity,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: double.infinity,
                        height: size.height * 0.47,
                        padding: const EdgeInsets.fromLTRB(25, 50, 25, 0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 25,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      debugPrint('<');
                                    },
                                    child: const Icon(Icons.arrow_back_ios),
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      debugPrint('share');
                                    },
                                    child: const Icon(Icons.ios_share_sharp),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              width: 38,
                              height: 22,
                              margin: const EdgeInsets.only(top: 80, bottom: 8),
                              decoration: BoxDecoration(
                                color: Colors.black,
                                borderRadius: BorderRadius.circular(3),
                              ),
                              alignment: Alignment.center,
                              child: const Text(
                                '唱片',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 10,
                                  height: 1,
                                ),
                              ),
                            ),
                            Text(
                              albumInfo.album!,
                              style: const TextStyle(
                                  fontSize: 23, fontWeight: FontWeight.w600),
                            ),
                            InkWell(
                              onTap: () {
                                context.go('/artist/home');
                              },
                              child: SizedBox(
                                width: 90,
                                height: 28,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      albumInfo.artist!,
                                      style: const TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w300),
                                    ),
                                    const Icon(
                                      Icons.arrow_forward_ios,
                                      size: 15,
                                    )
                                  ],
                                ),
                              ),
                            ),
                            const Row(
                              children: [
                                Icon(Icons.star, size: 18),
                                Icon(Icons.star, size: 18),
                                Icon(Icons.star, size: 18),
                                Icon(Icons.star, size: 18),
                                Icon(Icons.star_outline, size: 18),
                                SizedBox(width: 8),
                                Text(
                                  '7.7',
                                  style: TextStyle(fontSize: 12),
                                ),
                                SizedBox(width: 8),
                                Text('252 人评分', style: TextStyle(fontSize: 12)),
                              ],
                            ),
                            Text(
                              '发行于${albumInfo.releaseDate}',
                              style: const TextStyle(
                                  fontSize: 12, fontWeight: FontWeight.w300),
                            ),
                            Container(
                              height: 40,
                              margin: const EdgeInsets.only(
                                  top: 25, bottom: 30, right: 15),
                              child: Text(albumInfo.albuminfo!,
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 2,
                                  style: const TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w300,
                                    height: 1.2,
                                    color: Colors.black87,
                                  )),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SizedBox(
                                  width: 75,
                                  child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        const Icon(Icons.play_arrow, size: 30),
                                        Text('${albumInfo.total} 首'),
                                      ]),
                                ),
                                const SizedBox(
                                  width: 140,
                                  height: 40,
                                  child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Icon(
                                          Icons.favorite_border,
                                          color: CustomColors.neutral,
                                          size: 28,
                                        ),
                                        Icon(
                                          Icons.download_rounded,
                                          color: Colors.black12,
                                          size: 28,
                                        ),
                                        Icon(Icons.done_all),
                                      ]),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      _generateSongItemList(
                          albumInfo.musicList!, size.height * 0.53),
                    ],
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  Widget _generateSongItemList(List<MusicInfo> musicList, double height) {
    return SizedBox(
      height: height,
      child: ListView.builder(
        itemCount: musicList.length,
        itemBuilder: (context, index) =>
            _generateSongItem(index + 1, musicList[index]),
        padding: const EdgeInsets.symmetric(vertical: 5),
      ),
    );
  }

  Widget _generateSongItem(int index, MusicInfo music) {
    BatchSelector selecter = BatchSelector();
    return InkWell(
      onTap: () {
        if (selecter.isSelected) {
          selecter.setNotSelect();
        } else {
          selecter.setSelected();
        }
      },
      focusColor: Colors.grey.withOpacity(0.05),
      hoverColor: Colors.grey.withOpacity(0.05),
      splashColor: Colors.grey.withOpacity(0.05),
      highlightColor: Colors.grey.withOpacity(0.08),
      child: ListenableBuilder(
          listenable: selecter,
          builder: (context, widget) {
            return Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              // margin: const EdgeInsets.only(bottom: 4),
              color: selecter.isSelected ? Colors.grey.withOpacity(0.08) : null,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: 40,
                    alignment: Alignment.center,
                    child: selecter.isSelected
                        ? const RotatedBox(
                            quarterTurns: 3, child: Icon(Icons.sort))
                        : Text(
                            '$index',
                            style: const TextStyle(
                              color: Colors.black12,
                              fontSize: 16,
                            ),
                            maxLines: 1,
                          ),
                  ),
                  SizedBox(
                    width: 300,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(music.name!,
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                            )),
                        Text(
                          music.artist!,
                          style: const TextStyle(
                              fontSize: 13, fontWeight: FontWeight.w200),
                        ),
                      ],
                    ),
                  ),
                  const Icon(
                    Icons.more_horiz,
                    color: Colors.black54,
                  ),
                ],
              ),
            );
          }),
    );
  }
}
