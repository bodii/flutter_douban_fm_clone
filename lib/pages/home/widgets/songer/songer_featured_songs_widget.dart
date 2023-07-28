import 'package:flutter/material.dart';
import 'package:flutter_douban_fm_clone/pages/home/controllers/selecter.dart';

class SongerFeaturedSongsWidget extends StatelessWidget {
  const SongerFeaturedSongsWidget({super.key});

  // http://www.kuwo.cn/api/www/search/searchMusicBykeyWord?key=Lily Frost&pn=1&rn=20&httpsStatus=1&reqId=dca187f0-2d19-11ee-b2a7-41a7244ceb03&plat=web_www&from=

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
          'cover':
              'https://img4.kuwo.cn/star/albumcover/800/36/43/625933834.jpg',
        },
        {
          'song_id': 2,
          'song_name': 'Where Is Love',
          'singer': 'Lily Frost',
          'play_url': '',
          'cover':
              'https://img4.kuwo.cn/star/albumcover/800/36/43/625933834.jpg',
        },
        {
          'song_id': 3,
          'song_name': 'Blissed Out',
          'singer': 'Lily Frost',
          'play_url': '',
          'cover':
              'https://img4.kuwo.cn/star/albumcover/800/36/43/625933834.jpg',
        },
        {
          'song_id': 4,
          'song_name': 'Silver Sun',
          'singer': 'Lily Frost',
          'play_url': '',
          'cover':
              'https://img4.kuwo.cn/star/albumcover/800/36/43/625933834.jpg',
        },
        {
          'song_id': 5,
          'song_name': 'Camden Town',
          'singer': 'Lily Frost',
          'play_url': '',
          'cover':
              'https://img4.kuwo.cn/star/albumcover/800/36/43/625933834.jpg',
        },
        {
          'song_id': 6,
          'song_name': 'Pantomine',
          'singer': 'Lily Frost',
          'play_url': '',
          'cover':
              'https://img4.kuwo.cn/star/albumcover/800/36/43/625933834.jpg',
        },
        {
          'song_id': 7,
          'song_name': 'Black Narcissus',
          'singer': 'Lily Frost',
          'play_url': '',
          'cover':
              'https://img4.kuwo.cn/star/albumcover/800/36/43/625933834.jpg',
        },
        {
          'song_id': 8,
          'song_name': 'Insatiable',
          'singer': 'Lily Frost',
          'play_url': '',
          'cover':
              'https://img4.kuwo.cn/star/albumcover/800/36/43/625933834.jpg',
        },
        {
          'song_id': 9,
          'song_name': 'Out Of Blue',
          'singer': 'Lily Frost',
          'play_url': '',
          'cover':
              'https://img4.kuwo.cn/star/albumcover/800/36/43/625933834.jpg',
        },
        {
          'song_id': 10,
          'song_name': 'Pearl',
          'singer': 'Lily Frost',
          'play_url': '',
          'cover':
              'https://img4.kuwo.cn/star/albumcover/800/36/43/625933834.jpg',
        },
        {
          'song_id': 11,
          'song_name': 'Hidden Track',
          'singer': 'Lily Frost',
          'play_url': '',
          'cover':
              'https://img4.kuwo.cn/star/albumcover/800/36/43/625933834.jpg',
        },
      ],
    };
    Size size = MediaQuery.sizeOf(context);
    return _generateSongItemList(albumData['play_list'], size.height);
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
              padding: const EdgeInsets.symmetric(vertical: 12),
              // margin: const EdgeInsets.only(bottom: 4),
              color: selecter.isSelected ? Colors.grey.withOpacity(0.08) : null,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: 60,
                    height: 60,
                    margin: const EdgeInsets.only(right: 15),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(5),
                      child: Image.network(song['cover']),
                    ),
                  ),
                  SizedBox(
                    width: 260,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(song['song_name'],
                            style: const TextStyle(
                              fontSize: 17,
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
