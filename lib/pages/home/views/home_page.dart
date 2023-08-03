import 'package:flutter/material.dart';
import 'package:flutter_douban_fm_clone/common/custom_color.dart';
import 'package:flutter_douban_fm_clone/pages/home/widgets/tab_indicator.dart';
import 'package:flutter_douban_fm_clone/pages/discovery/views/discovery_page.dart';
import 'package:flutter_douban_fm_clone/pages/user/login/views/my_page.dart';
import 'megacycle_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({
    super.key,
    this.index = '0',
  });

  final String index;

  @override
  Widget build(BuildContext context) {
    int indexNum = int.parse(index);

    const List<Tab> tabs = [
      Tab(text: '兆赫'),
      Tab(text: '发现'),
      Tab(text: '我的'),
    ];

    return DefaultTabController(
      length: tabs.length,
      initialIndex: indexNum,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Row(
            children: [
              SizedBox(
                width: 350,
                child: Center(
                  child: TabBar(
                    tabs: tabs,
                    overlayColor: const MaterialStatePropertyAll(Colors.white),
                    isScrollable: true,
                    indicatorPadding: const EdgeInsets.only(top: 10),
                    indicatorWeight: 2.0,
                    dividerColor: Colors.white,
                    unselectedLabelColor: Colors.black38,
                    unselectedLabelStyle: const TextStyle(
                      fontSize: 20,
                    ),
                    indicator: MyUnderlineTabIndicator(
                      borderSide: const BorderSide(
                        width: 3.0,
                        color: CustomColors.paimary,
                      ),
                      borderRadius: BorderRadius.circular(10),
                      width: 15,
                    ),
                    indicatorSize: TabBarIndicatorSize.label,
                    labelStyle: const TextStyle(
                      fontSize: 20,
                      // backgroundColor: Colors.white,
                      fontWeight: FontWeight.w600,
                    ),
                    labelColor: Colors.black87,
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
        body: const TabBarView(
          children: [
            MegacyclePage(),
            DiscoveryPage(),
            MyPage(),
          ],
        ),
      ),
    );
  }
}
