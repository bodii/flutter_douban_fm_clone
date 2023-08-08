import 'package:flutter/material.dart';
import 'package:flutter_douban_fm_clone/common/custom_color.dart';
import 'package:flutter_douban_fm_clone/common/functions/datetime_to_string.dart';
import 'package:flutter_douban_fm_clone/common/request.dart';
import 'package:flutter_douban_fm_clone/models/play_list_model.dart';
import 'package:flutter_douban_fm_clone/models/recommended_play_list_model.dart';
import 'package:go_router/go_router.dart';

class DiscoveryPage extends StatelessWidget {
  const DiscoveryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    DateTime date = DateTime.now();

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: size.width * 0.5,
              margin: const EdgeInsets.only(top: 50),
              padding: const EdgeInsets.only(left: 10),
              child: SizedBox(
                width: double.infinity,
                height: 80,
                child: RawChip(
                  label: const CircleAvatar(
                    backgroundColor: CustomColors.paimary,
                    radius: 35,
                    child: Icon(
                      Icons.play_arrow_sharp,
                      color: Colors.white,
                      size: 35,
                    ),
                  ),
                  backgroundColor: Colors.black12.withOpacity(0.03),
                  side: BorderSide.none,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(40)),
                  padding: const EdgeInsets.only(
                    right: 90,
                    top: 5,
                    bottom: 5,
                  ),
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 50, right: 0),
              padding: const EdgeInsets.only(left: 40, right: 40),
              width: size.width * 0.5,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        date.toMonthEnAbridged(),
                        style: const TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        '${date.day}',
                        style: const TextStyle(
                          fontSize: 45,
                          fontWeight: FontWeight.bold,
                          height: 1,
                        ),
                      ),
                    ],
                  ),
                  const Text(
                    '每日私享歌单',
                    style: TextStyle(fontSize: 16),
                  ),
                ],
              ),
            )
          ],
        ),
        toPlayList(),
      ],
    );
  }

  Widget toPlayList() {
    return FutureBuilder(
      future: fetchRecommendedPlayList(),
      builder: (context, AsyncSnapshot<RecommendedPlayList> snapshot) {
        if (snapshot.connectionState == ConnectionState.none ||
            !snapshot.hasData) {
          return const Center(child: CircularProgressIndicator());
        }
        if (snapshot.hasError) {
          return const Center(
            child: Text('not data!'),
          );
        }

        List<PlayList> playLists = snapshot.data!.list!;
        playLists = playLists.sublist(1);

        return SingleChildScrollView(
          child: SizedBox(
            width: double.infinity,
            height: 650,
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 25.0, vertical: 20.0),
              child: ListView.builder(
                itemCount: playLists.length,
                itemBuilder: (context, index) {
                  return toPlayListItem(playLists[index], context);
                },
              ),
            ),
          ),
        );
      },
    );
  }

  Widget toPlayListItem(PlayList playList, BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.push('/home/index/discovery/detail/${playList.id}');
      },
      child: SizedBox(
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(playList.name!.trim(),
                        style: const TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis),
                    Text.rich(
                      TextSpan(
                          children: [
                            const TextSpan(text: '来自 '),
                            TextSpan(
                                text: playList.uname!.replaceAll('kuwo', ''),
                                style: TextStyle(
                                  color: Colors.black.withOpacity(0.7),
                                )),
                            const TextSpan(text: ' 的推荐'),
                          ],
                          style: const TextStyle(
                            color: Colors.black38,
                            fontWeight: FontWeight.w600,
                          )),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: ClipRRect(
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(8),
                      topRight: Radius.circular(8)),
                  child: Image.network(
                    playList.img700!,
                    fit: BoxFit.cover,
                    width: double.infinity,
                    height: 230,
                  ),
                ),
              ),
              Container(
                width: double.infinity,
                height: 65,
                padding: const EdgeInsets.symmetric(horizontal: 10),
                decoration: const BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(8),
                        bottomRight: Radius.circular(8))),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Transform.scale(
                        scaleX: -1,
                        child: IconButton(
                          onPressed: () {
                            debugPrint(
                                'hearing -> playlist id: ${playList.id}');
                          },
                          icon: Container(
                            width: 45,
                            height: 45,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(45),
                              color: Colors.white,
                            ),
                            child: const Icon(
                              Icons.hearing_outlined,
                              color: CustomColors.black,
                              size: 26,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 120,
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              IconButton(
                                onPressed: () {
                                  debugPrint(
                                      'share -> playlist id: ${playList.id}');
                                },
                                icon: Container(
                                  width: 38,
                                  height: 38,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(38),
                                    color: Colors.white,
                                  ),
                                  child: const Icon(
                                    Icons.ios_share_outlined,
                                    color: CustomColors.black,
                                    size: 25,
                                  ),
                                ),
                              ),
                              IconButton(
                                onPressed: () {
                                  debugPrint(
                                      'favorite -> playlist id: ${playList.id}');
                                },
                                icon: Container(
                                  width: 38,
                                  height: 38,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(38),
                                    color: Colors.white,
                                  ),
                                  child: const Icon(
                                    Icons.favorite_border_outlined,
                                    color: CustomColors.neutral,
                                    size: 28,
                                  ),
                                ),
                              ),
                            ]),
                      ),
                    ]),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
