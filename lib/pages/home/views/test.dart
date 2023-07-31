import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_douban_fm_clone/common/custom_color.dart';

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

class TestPage extends StatefulWidget {
  const TestPage({super.key});

  @override
  _TestPageState createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {
  double currentPage = images.length - 1.0;
  late PageController controller;

  @override
  void initState() {
    controller = PageController(initialPage: images.length - 1);
    controller.addListener(() {
      setState(() {
        currentPage = controller.page!;
      });
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Center(
        child: Stack(
          children: <Widget>[
            // 两者堆叠在一起。通过PageView滑动的Controller来控制当前显示的page
            background(),
            _CardScrollWidget(currentPage.floor()),
            Positioned.fill(
              child: PageView.builder(
                itemCount: images.length,
                controller: controller,
                reverse: true,
                // scrollDirection: Axis.vertical,
                itemBuilder: (context, index) {
                  return Container();
                },
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget background() {
    return Container(
      width: 220,
      height: 220,
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

class _CardScrollWidget extends StatelessWidget {
  int currentPage;
  double padding = 20.0;
  double verticalInset = 20.0;

  _CardScrollWidget(this.currentPage);

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: (12.0 / 16.0) * 1.2,
      child: LayoutBuilder(
        builder: (context, contraints) {
          var width = contraints.maxWidth;
          var height = contraints.maxHeight;
          var safeWidth = width - 2 * padding;
          var safeHeight = height - 2 * padding;
          var heightOfPrimaryCard = safeHeight;
          var widthOfPrimaryCard = heightOfPrimaryCard * 12 / 16;
          var primaryCardLeft = safeWidth - widthOfPrimaryCard;
          var horizontalInset = primaryCardLeft / 2;
          List<Widget> cardList = [];
          for (var i = 0; i < images.length; i++) {
            var leftPage = i - currentPage;
            bool isOnRight = leftPage > 0;
            var start = padding +
                max(
                    primaryCardLeft -
                        horizontalInset * -leftPage * (isOnRight ? 15 : 1),
                    0);
            var cardItem = Positioned.directional(
                top: padding + verticalInset * max(-leftPage, 0.0),
                bottom: padding + verticalInset * max(-leftPage, 0.0),
                start: start,
                textDirection: TextDirection.rtl,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16.0),
                  child: Container(
                    decoration: const BoxDecoration(
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                              color: Colors.black12,
                              offset: Offset(3.0, 6.0),
                              blurRadius: 10.0)
                        ]),
                    child: AspectRatio(
                      aspectRatio: 12 / 16,
                      child: Stack(
                        fit: StackFit.expand,
                        children: <Widget>[
                          Image.network(images[i], fit: BoxFit.cover),
                          Align(
                            alignment: Alignment.bottomLeft,
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                // 设置标题
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 16, vertical: 8),
                                  child: Text(
                                    title[i],
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 25,
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                // 设置ReaderLater
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 12, bottom: 12),
                                  child: Container(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 22.0, vertical: 6.0),
                                    decoration: BoxDecoration(
                                        color: Colors.blueAccent,
                                        borderRadius:
                                            BorderRadius.circular(20.0)),
                                    child: const Text("点击查看",
                                        style: TextStyle(color: Colors.white)),
                                  ),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ));
            cardList.add(cardItem);
          }
          return Stack(
            children: cardList,
          );
        },
      ),
    );
  }
}
