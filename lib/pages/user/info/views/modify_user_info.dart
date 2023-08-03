import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class UserInfoModify extends StatelessWidget {
  const UserInfoModify({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => context.pop(),
          icon: const Icon(Icons.arrow_back_ios_new),
        ),
        title: const Text('修改资料'),
      ),
      body: const Center(
        child: Text('修改资料页'),
      ),
    );
  }
}
