import 'package:flutter/material.dart';

class CollectEditWidget extends StatelessWidget {
  const CollectEditWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        TextField(
          decoration: InputDecoration(
            hintText: '歌单',
            prefix: Text('标题'),
            border: InputBorder.none,
          ),
        ),
        TextField(
          decoration: InputDecoration(
            hintText: '歌单',
            prefix: Text('标题'),
            border: InputBorder.none,
          ),
        ),
      ],
    );
  }
}
