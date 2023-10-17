import 'package:flutter/material.dart';
import 'package:flutter_douban_fm_clone/common/custom_color.dart';
import 'package:flutter_douban_fm_clone/common/request.dart';
import 'package:flutter_douban_fm_clone/models/play_list_model.dart';
import 'package:flutter_douban_fm_clone/models/recommended_play_list_model.dart';
import 'package:go_router/go_router.dart';

class SwitchPlayLists extends StatefulWidget {
  const SwitchPlayLists({super.key});

  @override
  State createState() => _SwitchPlayListsState();
}

class _SwitchPlayListsState extends State<SwitchPlayLists> {
  double currentPage = 0;
  final PageController controller = PageController();

  @override
  void initState() {
    super.initState();

    controller.addListener(() {
      setState(() {
        currentPage = controller.page!;
      });

      debugPrint('$currentPage');
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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

          RecommendedPlayList rePlayList = snapshot.data!;
          PlayList playList = rePlayList.list![1];

          return GestureDetector(
            onTap: () {
              context.push('/megacycle/playList/${playList.id}');
            },
            child: Stack(
              alignment: Alignment.center,
              children: [
                background(height: 290),
                background(height: 250),
                // 两者堆叠在一起。通过PageView滑动的Controller来控制当前显示的page
                // CardScrollWidget(currentPage.floor()),
                Draggable(
                  feedback: background(height: 220),
                  child: content(playList),
                ),
              ],
            ),
          );
        });
  }

  Widget content(PlayList playList) {
    return SizedBox(
      width: 220,
      child: Positioned.fill(
        child: PageView.builder(
          // itemCount: images.length,
          controller: controller,
          reverse: false,
          scrollDirection: Axis.vertical,
          itemBuilder: (context, index) {
            double dd = (index - currentPage).abs();
            if (dd > 1.0 && dd < 0.51) {
              return background();
            }

            return SizedBox(
              width: 100,
              height: 250,
              child: Image.network(playList.img300!),
            );
            // });
          },
        ),
      ),
    );
  }

  Widget background({double height = 270}) {
    return Container(
      width: 220,
      height: height,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.25),
            offset: const Offset(0.0, 5.0),
            blurRadius: 8.0,
            spreadRadius: 0.1,
          ),
        ],
        gradient: const LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          stops: [0.0, 1.0],
          colors: [CustomColors.lightOrange, CustomColors.tangerine],
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      child: const Align(
        alignment: Alignment.center,
        child: Text(
          '?',
          style: TextStyle(
            fontSize: 180.0,
            color: CustomColors.darkOrange,
            height: 1.0,
          ),
        ),
      ),
    );
  }
}
