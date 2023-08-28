import 'package:flutter/material.dart';
import 'package:flutter_douban_fm_clone/common/functions/html_entities_to_string.dart';
import 'package:flutter_douban_fm_clone/common/request.dart';
import 'package:flutter_douban_fm_clone/models/artist_model.dart';
import 'package:go_router/go_router.dart';

import '../widgets/index.dart';

class ArtistHomePage extends StatelessWidget {
  const ArtistHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    const List<Tab> tabs = [
      Tab(text: '精选歌曲'),
      Tab(text: '唱片'),
      Tab(text: '相似艺术家'),
      Tab(text: '详情'),
    ];

    return Scaffold(
      body: FutureBuilder(
          future: fetchArtistDetail(79436),
          builder: (context, AsyncSnapshot<Artist> snapshot) {
            if (snapshot.connectionState == ConnectionState.none ||
                !snapshot.hasData) {
              return const Center(child: CircularProgressIndicator());
            }
            if (snapshot.hasError) {
              return const Center(
                child: Text('not data!'),
              );
            }

            Artist artistDetail = snapshot.data!;

            return Stack(
              children: [
                SizedBox(
                  width: double.infinity,
                  height: size.height * 0.40,
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
                      ).createShader(
                          Rect.fromLTRB(0, 0, 0, bounds.height - 30));
                    },
                    blendMode: BlendMode.dstATop,
                    child: Image.network(
                      artistDetail.pic300!,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: double.infinity,
                      height: size.height,
                      padding: const EdgeInsets.fromLTRB(25, 50, 25, 0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 35,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    context.go('/best/album/songList');
                                  },
                                  child: const Icon(Icons.arrow_back_ios),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 40),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    SizedBox(
                                      width: 85,
                                      height: 85,
                                      child: CircleAvatar(
                                        radius: 85,
                                        backgroundImage: NetworkImage(
                                          artistDetail.pic300!,
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 20.0, right: 10.0),
                                      child: Text(
                                        artistDetail.name!
                                            .htmlEntitiesToString(),
                                        style: const TextStyle(
                                          fontSize: 22,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                OutlinedButton(
                                  onPressed: () {
                                    debugPrint('点击喜欢');
                                  },
                                  style: OutlinedButton.styleFrom(
                                    side: const BorderSide(width: 0.9),
                                    padding: const EdgeInsets.symmetric(
                                      vertical: 11.0,
                                      horizontal: 18.0,
                                    ),
                                    minimumSize: const Size(35, 20),
                                  ),
                                  child: const Text(
                                    '喜欢',
                                    style: TextStyle(
                                      color: Colors.black54,
                                      height: 1,
                                      fontSize: 15,
                                      fontWeight: FontWeight.w600,
                                    ),
                                    maxLines: 1,
                                  ),
                                )
                              ],
                            ),
                          ),
                          Expanded(
                            child: DefaultTabController(
                              length: 4,
                              child: Column(
                                children: [
                                  TabBar(
                                    tabs: tabs,
                                    indicator: BoxDecoration(
                                      // color: Colors.black,
                                      border: Border.all(),
                                      borderRadius: BorderRadius.circular(20),
                                      color: Colors.transparent,
                                    ),
                                    labelColor: Colors.black,
                                    unselectedLabelColor: Colors.black38,
                                    indicatorPadding:
                                        const EdgeInsets.symmetric(
                                            vertical: 6, horizontal: -20),
                                    labelPadding: const EdgeInsets.all(0),
                                    indicatorSize: TabBarIndicatorSize.label,
                                    overlayColor:
                                        const MaterialStatePropertyAll(
                                            Colors.transparent),
                                    dividerColor: Colors.transparent,
                                  ),
                                  Container(
                                    width: double.infinity,
                                    height: size.height * 0.6,
                                    margin: const EdgeInsets.only(top: 20),
                                    child: TabBarView(
                                      children: getTabViews(artistDetail),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            );
          }),
    );
  }

  List<Widget> getTabViews(Artist artistData) {
    return <Widget>[
      ArtistFeaturedSongsWidget(artistId: artistData.id!),
      ArtistAlbumListWidget(artistId: artistData.id!),
      const ArtistSimilarArtistWidget(),
      ArtistDetailWidget(artistDetail: artistData),
    ];
  }
}
