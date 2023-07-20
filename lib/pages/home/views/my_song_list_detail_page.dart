import 'package:flutter/material.dart';
import 'package:flutter_douban_fm_clone/configs/custom_color.dart';
import 'package:go_router/go_router.dart';

class MySongListDetailPage extends StatelessWidget {
  const MySongListDetailPage({
    super.key,
    required this.songListName,
  });

  final String songListName;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () {
            context.go('/home/index/2');
          },
        ),
        title: Center(
          child: Text(
            songListName,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18),
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.symmetric(vertical: 10),
                width: double.infinity,
                height: 40,
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.02),
                  borderRadius: BorderRadius.circular(40),
                ),
                child: TextField(
                  decoration: InputDecoration(
                    prefixIcon: const Icon(
                      Icons.search,
                      size: 30,
                      color: Colors.black26,
                    ),
                    hintText: '搜索$songListName',
                    hintStyle: const TextStyle(
                      color: Colors.black38,
                      fontSize: 14,
                    ),
                    border: InputBorder.none,
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 18),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: 160,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Icon(Icons.shuffle),
                          SizedBox(
                            width: 130,
                            child: Text(
                              '随机播放 7 首',
                              style: TextStyle(
                                fontSize: 15,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Icon(Icons.done_all)
                  ],
                ),
              ),
              Column(
                children: [
                  createSongListCardItem(
                    'https://img4.kuwo.cn/star/albumcover/500/1/29/1934979845.jpg',
                    '向云端',
                    '小霞&海洋Bo',
                    context,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget createSongListCardItem(
    String? coverSrc,
    String songName,
    String singer,
    BuildContext context,
  ) {
    String src = coverSrc ?? '';
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 10,
      ),
      child: InkWell(
        onTap: () {
          debugPrint(songName);
          context.go('/my/song_list/detail/$songName');
        },
        child: SizedBox(
          width: double.infinity,
          height: 65,
          child: Row(
            children: [
              SizedBox(
                width: 65,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.network(
                    src,
                    fit: BoxFit.cover,
                    width: 65,
                    height: 65,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 18.0),
                child: SizedBox(
                  width: 250,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            songName,
                            style: const TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          const Icon(
                            Icons.favorite,
                            color: CustomColors.neutral,
                            size: 18,
                          )
                        ],
                      ),
                      Text(
                        singer,
                        style: const TextStyle(
                          color: Colors.black38,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              InkWell(
                child: const Icon(
                  Icons.more_horiz,
                  color: Colors.black54,
                ),
                onTap: () {
                  debugPrint('...');
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
