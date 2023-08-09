import 'package:flutter/material.dart';

class CollectPlayListWidget extends StatelessWidget {
  const CollectPlayListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 150, bottom: 25.0),
          child: Image.asset(
            'assets/icons/song_list.png',
            width: 110,
          ),
        ),
        const Text(
          '这里收集了你喜欢的歌单',
          style: TextStyle(color: Colors.black38, fontSize: 13),
        ),
      ],
    );
  }
}
