import 'package:flutter/material.dart';
import 'package:flutter_douban_fm_clone/common/custom_color.dart';
import 'package:flutter_douban_fm_clone/pages/home/controllers/selecter.dart';
import 'package:go_router/go_router.dart';

class BestAlbumSongListPage extends StatelessWidget {
  const BestAlbumSongListPage({super.key});

  @override
  Widget build(BuildContext context) {
    Map<String, dynamic> albumData = {
      'album_id': 1,
      'album_name': 'Situation',
      'singer': 'Lily Frost',
      'album_cover':
          'https://img4.kuwo.cn/star/albumcover/800/36/43/625933834.jpg',
      'mark': 7.7,
      'mark_number': 252,
      'release_date': '2004',
      'introduction': '这张专辑在整体上还是延续着Frost的一贯路线,融合了Jazz和复古曲风'
          '的Lounge-Pop,然后尽量在歌曲之间求变化. 开场曲"Les Vaisseaux Nocturnes"'
          '是首轻盈略带可爱的法语小品. "Silver Sun"谧谧幽幽,点缀式的电音完美地衬托出'
          'Frost轻柔的声音,让听者仿如安坐在山间湖水旁."Out Of Blue"富有浓郁的拉丁气息,'
          '最末一首bonus track则是玩味颇重的复古舞曲。',
      'play_list': [
        {
          'song_id': 1,
          'song_name': 'Les Vaisseaux Nocturnes',
          'singer': 'Lily Frost',
          'play_url': '',
        },
        {
          'song_id': 2,
          'song_name': 'Where Is Love',
          'singer': 'Lily Frost',
          'play_url': '',
        },
        {
          'song_id': 3,
          'song_name': 'Blissed Out',
          'singer': 'Lily Frost',
          'play_url': '',
        },
        {
          'song_id': 4,
          'song_name': 'Silver Sun',
          'singer': 'Lily Frost',
          'play_url': '',
        },
        {
          'song_id': 5,
          'song_name': 'Camden Town',
          'singer': 'Lily Frost',
          'play_url': '',
        },
        {
          'song_id': 6,
          'song_name': 'Pantomine',
          'singer': 'Lily Frost',
          'play_url': '',
        },
        {
          'song_id': 7,
          'song_name': 'Black Narcissus',
          'singer': 'Lily Frost',
          'play_url': '',
        },
        {
          'song_id': 8,
          'song_name': 'Insatiable',
          'singer': 'Lily Frost',
          'play_url': '',
        },
        {
          'song_id': 9,
          'song_name': 'Out Of Blue',
          'singer': 'Lily Frost',
          'play_url': '',
        },
        {
          'song_id': 10,
          'song_name': 'Pearl',
          'singer': 'Lily Frost',
          'play_url': '',
        },
        {
          'song_id': 11,
          'song_name': 'Hidden Track',
          'singer': 'Lily Frost',
          'play_url': '',
        },
      ],
    };

    Size size = MediaQuery.sizeOf(context);
    return Scaffold(
      body: Stack(
        children: [
          SizedBox(
            width: double.infinity,
            height: size.height * 0.47,
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
                albumData['album_cover'],
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
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                          albumData['album_name'],
                          style: const TextStyle(
                              fontSize: 23, fontWeight: FontWeight.w600),
                        ),
                        InkWell(
                          onTap: () {
                            context.go('/singer/home');
                          },
                          child: SizedBox(
                            width: 90,
                            height: 28,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  albumData['singer'],
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
                        Row(
                          children: [
                            const Icon(Icons.star, size: 18),
                            const Icon(Icons.star, size: 18),
                            const Icon(Icons.star, size: 18),
                            const Icon(Icons.star, size: 18),
                            const Icon(Icons.star_outline, size: 18),
                            const SizedBox(width: 8),
                            Text(
                              '${albumData['mark']}',
                              style: const TextStyle(fontSize: 12),
                            ),
                            const SizedBox(width: 8),
                            Text('${albumData['mark_number']} 人评分',
                                style: const TextStyle(fontSize: 12)),
                          ],
                        ),
                        Text(
                          '发行于${albumData['release_date']}',
                          style: const TextStyle(
                              fontSize: 12, fontWeight: FontWeight.w300),
                        ),
                        Container(
                          height: 40,
                          margin: const EdgeInsets.only(
                              top: 25, bottom: 30, right: 15),
                          child: Text(albumData['introduction'],
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
                                    Text('${albumData['play_list'].length} 首'),
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
                      albumData['play_list'], size.height * 0.53),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _generateSongItemList(
      List<Map<String, dynamic>> songList, double height) {
    return SizedBox(
      height: height,
      child: ListView.builder(
        itemCount: songList.length,
        itemBuilder: (context, index) =>
            _generateSongItem(index + 1, songList[index]),
        padding: const EdgeInsets.symmetric(vertical: 5),
      ),
    );
  }

  Widget _generateSongItem(int index, Map<String, dynamic> song) {
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
                        Text(song['song_name'],
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                            )),
                        Text(
                          song['singer'],
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
