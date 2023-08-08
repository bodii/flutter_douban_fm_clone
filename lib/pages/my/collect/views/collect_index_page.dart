import 'package:flutter/material.dart';
import 'package:flutter_douban_fm_clone/pages/my/collect/widgets/collect_album_page.dart';
import 'package:flutter_douban_fm_clone/pages/my/collect/widgets/collect_artist_page.dart';
import 'package:flutter_douban_fm_clone/pages/my/collect/widgets/collect_edit_page.dart';
import 'package:flutter_douban_fm_clone/pages/my/collect/widgets/collect_play_list_page.dart';
import 'package:go_router/go_router.dart';

class CollectIndexPage extends StatelessWidget {
  const CollectIndexPage({
    super.key,
    this.index = '0',
  });

  final String index;

  @override
  Widget build(BuildContext context) {
    int indexNum = int.parse(index);

    const List<Tab> tabs = [
      Tab(text: '歌单'),
      Tab(text: '艺术家'),
      Tab(text: '唱片'),
      Tab(text: '编辑'),
    ];

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
          ),
          onPressed: () {
            context.pop();
          },
        ),
        title: const Text(
          '收藏',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
        ),
      ),
      body: DefaultTabController(
        length: tabs.length,
        initialIndex: indexNum,
        child: SizedBox(
          width: double.infinity,
          height: 500,
          child: Column(
            children: [
              SizedBox(
                width: double.infinity,
                child: TabBar(
                  tabs: tabs,
                  indicator: BoxDecoration(
                    border: Border.all(),
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.transparent,
                  ),
                  labelColor: Colors.black,
                  unselectedLabelColor: Colors.black38,
                  indicatorPadding:
                      const EdgeInsets.symmetric(vertical: 8, horizontal: -20),
                  labelPadding: const EdgeInsets.all(0),
                  indicatorSize: TabBarIndicatorSize.label,
                  overlayColor:
                      const MaterialStatePropertyAll(Colors.transparent),
                  dividerColor: Colors.transparent,
                ),
              ),
              const SizedBox(height: 20),
              const Expanded(
                child: TabBarView(
                  children: [
                    CollectPlayListPage(),
                    CollectArtistPage(),
                    CollectAlbumPage(),
                    CollectEditPage(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget getTab(String tabName, double tabWidth) {
    return Container(
      width: 40,
      height: 20,
      alignment: Alignment.center,
      child: Text(tabName),
    );
  }
}
