import 'package:flutter/material.dart';
import 'package:flutter_douban_fm_clone/pages/home/widgets/singer/singer_similar_artist_widget.dart';

import '../widgets/singer/index.dart';

class SingerHomePage extends StatelessWidget {
  const SingerHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);

    Map<String, dynamic> singerData = {
      'name': 'Lily Frost',
      'avatar': 'https://img4.kuwo.cn/star/albumcover/800/82/44/1716067319.jpg',
    };

    return Scaffold(
      body: Stack(
        children: [
          SizedBox(
            width: double.infinity,
            height: size.height * 0.40,
            child: ShaderMask(
              shaderCallback: (bounds) {
                return const LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Colors.white54, Colors.white24, Colors.transparent],
                  stops: [0, .4, 1],
                ).createShader(Rect.fromLTRB(0, 0, 0, bounds.height - 30));
              },
              blendMode: BlendMode.dstATop,
              child: Image.network(
                singerData['avatar'],
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
                              debugPrint('<');
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
                                    singerData['avatar'],
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 20.0, right: 10.0),
                                child: Text(
                                  singerData['name'],
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
                    DefaultTabController(
                      length: 4,
                      child: Column(
                        children: [
                          TabBar(
                            tabs: getTabBar(),
                            indicator: BoxDecoration(
                              // color: Colors.black,
                              border: Border.all(),
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.transparent,
                            ),
                            labelColor: Colors.black,
                            unselectedLabelColor: Colors.black38,
                            indicatorPadding: const EdgeInsets.all(0),
                            labelPadding: const EdgeInsets.all(0),
                            indicatorSize: TabBarIndicatorSize.label,
                            overlayColor: const MaterialStatePropertyAll(
                                Colors.transparent),
                            dividerColor: Colors.transparent,
                          ),
                          Container(
                            width: double.infinity,
                            height: size.height * 0.66,
                            margin: const EdgeInsets.only(top: 20),
                            child: TabBarView(children: getTabViews()),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  List<Widget> getTabViews() {
    return <Widget>[
      const SingerFeaturedSongsWidget(),
      const SingerAlbumListWidget(),
      const SingerSimilarArtistWidget(),
      const SingerDetailWidget(),
    ];
  }

  List<Widget> getTabBar() {
    return <Widget>[
      Container(
          width: 120,
          height: 30,
          padding: const EdgeInsets.symmetric(
            horizontal: 5,
            vertical: 3,
          ),
          alignment: Alignment.center,
          child: const Text('精选歌曲')),
      Container(
          width: 55,
          height: 30,
          padding: const EdgeInsets.symmetric(
            horizontal: 5,
            vertical: 3,
          ),
          alignment: Alignment.center,
          child: const Text('唱片')),
      Container(
          width: 210,
          height: 30,
          padding: const EdgeInsets.symmetric(
            horizontal: 5,
            vertical: 3,
          ),
          alignment: Alignment.center,
          child: const Text('相似艺术家')),
      Container(
          width: 55,
          height: 30,
          padding: const EdgeInsets.symmetric(
            horizontal: 5,
            vertical: 3,
          ),
          alignment: Alignment.center,
          child: const Text('详情')),
    ];
  }
}
