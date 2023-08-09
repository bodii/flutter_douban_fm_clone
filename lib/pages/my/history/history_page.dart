import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HistoryPage extends StatelessWidget {
  const HistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () {
            context.pop();
          },
        ),
        title: const Text('设置'),
        centerTitle: true,
      ),
      body: const Placeholder(
        child: Center(child: Text('this is history page')),
      ),
    );
  }
}
