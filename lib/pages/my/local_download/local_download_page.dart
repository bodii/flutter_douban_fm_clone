import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class LocalDownloadPage extends StatelessWidget {
  const LocalDownloadPage({super.key});

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
        title: const Text('本地'),
        centerTitle: true,
      ),
      body: const Placeholder(
        child: Center(child: Text('this is loacl download page')),
      ),
    );
  }
}
