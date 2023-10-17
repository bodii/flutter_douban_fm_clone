import 'package:flutter/material.dart';
import 'package:flutter_douban_fm_clone/pages/megacycle/widgets/bars_data.dart';
import 'package:flutter_douban_fm_clone/pages/megacycle/widgets/left_tab_bars.dart';

class MegacyclePage extends StatelessWidget {
  const MegacyclePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const List<Map<String, dynamic>> tabs = barData;
    return const LeftTabBar(tabs: tabs);
  }
}
