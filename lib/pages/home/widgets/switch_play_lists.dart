import 'package:flutter/material.dart';
import 'package:flutter_douban_fm_clone/configs/custom_color.dart';
import 'package:go_router/go_router.dart';

const List<String> images = [
  "https://img2.kuwo.cn/star/albumcover/500/1/39/533516405.jpg",
  "https://img3.kuwo.cn/star/albumcover/500/27/55/1740400437.jpg",
  "https://img3.kuwo.cn/star/albumcover/500/29/9/3717046493.jpg",
  "https://img4.kuwo.cn/star/albumcover/500/78/59/2677128017.jpg",
];

const List<String> title = [
  " If We Ever Broke Up ",
  " I'll Do It(Sped Up Version) ",
  " golden hour ",
  " Players(Explicit) ",
];

class SwitchPlayLists extends StatefulWidget {
  const SwitchPlayLists({super.key});

  @override
  _SwitchPlayListsState createState() => _SwitchPlayListsState();
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
    return InkWell(
      onTap: () {
        context.go('/best/album/songList');
      },
      child: Stack(
        alignment: Alignment.center,
        children: [
          background(height: 290),
          background(height: 250),
          // 两者堆叠在一起。通过PageView滑动的Controller来控制当前显示的page
          // CardScrollWidget(currentPage.floor()),
          Positioned.fill(
            child: PageView.builder(
              // itemCount: images.length,
              controller: controller,
              reverse: false,
              scrollDirection: Axis.vertical,
              itemBuilder: (context, index) {
                debugPrint('index: $index, current: $currentPage');
                double dd = (index - currentPage).abs();
                if (dd > 1.0 && dd < 0.51) {
                  return background();
                }
                // index = images.length - 1 - index;
                debugPrint('$index');
                return const SizedBox();
              },
            ),
          ),
        ],
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

class CardScrollWidget extends StatelessWidget {
  const CardScrollWidget(this.currentPage, {super.key});

  final int currentPage;
  final double padding = 20.0;
  final double verticalInset = 20.0;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 220,
      height: 220,
      // aspectRatio: (12.0 / 16.0) * 1.2,
      child: Positioned.directional(
        // top: padding + verticalInset * max(-leftPage, 0.0),
        // bottom: padding + verticalInset * max(-leftPage, 0.0),
        // start: start,
        textDirection: TextDirection.rtl,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10.0),
          child: SizedBox(
            width: 220,
            height: 220,
            child: AspectRatio(
              aspectRatio: 12 / 16,
              child: Stack(
                fit: StackFit.expand,
                children: [
                  SizedBox(
                    width: 200,
                    height: 200,
                    child: Image.network(
                      images[currentPage],
                      // fit: BoxFit.fill,
                    ),
                  ),
                  // Align(
                  //   alignment: Alignment.bottomLeft,
                  //   child: Column(
                  //     mainAxisSize: MainAxisSize.min,
                  //     crossAxisAlignment: CrossAxisAlignment.start,
                  //     children: [
                  // 设置标题
                  // Padding(
                  //   padding: const EdgeInsets.symmetric(
                  //       horizontal: 16, vertical: 8),
                  //   child: Text(
                  //     title[i],
                  //     style: const TextStyle(
                  //       color: Colors.white,
                  //       fontSize: 25,
                  //     ),
                  //   ),
                  // ),
                  // const SizedBox(
                  //   height: 10,
                  // ),
                  // 设置ReaderLater
                  // Padding(
                  //   padding: const EdgeInsets.only(left: 12, bottom: 12),
                  //   child: Container(
                  //     padding: const EdgeInsets.symmetric(
                  //         horizontal: 22.0, vertical: 6.0),
                  //     decoration: BoxDecoration(
                  //         color: Colors.blueAccent,
                  //         borderRadius: BorderRadius.circular(20.0)),
                  //     child: const Text("点击查看",
                  //         style: TextStyle(color: Colors.white)),
                  //   ),
                  // )
                  // ],
                  // ),
                  // )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
