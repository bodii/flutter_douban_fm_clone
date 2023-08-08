import 'package:flutter/material.dart';
import 'package:flutter_douban_fm_clone/pages/megacycle/widgets/switch_play_lists.dart';

class MegacyclePage extends StatelessWidget {
  const MegacyclePage({Key? key}) : super(key: key);

  Widget generateLeftBar(Map<String, dynamic> bar) {
    return InkWell(
      onTap: () {
        debugPrint(bar['lable']);
      },
      splashColor: Colors.white,
      child: Container(
        width: 80,
        height: 80,
        margin: const EdgeInsets.symmetric(
          vertical: 18,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.20),
                    offset: const Offset(0.0, 5.0),
                    blurRadius: 8.0,
                    spreadRadius: 0.1,
                  ),
                ],
              ),
              child: CircleAvatar(
                backgroundColor: Colors.white,
                child: Icon(
                  bar['icon'],
                  size: 32,
                  color: Colors.black87.withOpacity(0.78),
                ),
              ),
            ),
            Text(bar['lable']),
          ],
        ),
      ),
    );
  }

  List<Widget> gerenateLeftbars() {
    final List<Map<String, dynamic>> tabs = [
      {'lable': '私人兆赫', 'icon': Icons.headphones, 'children': []},
      {'lable': '豆瓣精选', 'icon': Icons.radio, 'children': []},
      {'lable': '心情场景', 'icon': Icons.local_cafe, 'children': []},
      {'lable': '语言年代', 'icon': Icons.language, 'children': []},
      {'lable': '风格流派', 'icon': Icons.straighten, 'children': []},
    ];
    List<Widget> bars = [];
    for (Map<String, dynamic> tab in tabs) {
      bars.add(generateLeftBar(tab));
    }

    return bars;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      child: Row(
        children: [
          SizedBox(
            width: 100,
            child: Column(
              children: gerenateLeftbars(),
            ),
          ),
          const Expanded(
            child: Center(
              child: SwitchPlayLists(),
            ),
          ),
        ],
      ),
    );
  }
}
