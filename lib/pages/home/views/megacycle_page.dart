import 'package:flutter/material.dart';

class MegacyclePage extends StatelessWidget {
  const MegacyclePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<Tab> myTabs = [
      Tab(text: '明教'),
      Tab(text: '霸刀'),
      Tab(text: '霸'),
    ];

    return const Row(
      children: [
        SizedBox(
          width: 100,
          child: Column(
            children: [
              Icon(Icons.headphones),
              Icon(Icons.radio),
            ],
          ),
        ),
        Expanded(
          child: Center(
            child: Text('dd'),
          ),
        ),
      ],
    );
  }
}
