import 'package:flutter/material.dart';
import 'package:flutter_douban_fm_clone/common/custom_color.dart';
import 'package:go_router/go_router.dart';

class NoLoginPage extends StatelessWidget {
  const NoLoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.2),
                    offset: const Offset(10, 10),
                    blurRadius: 20,
                    spreadRadius: 20,
                  ),
                ],
                borderRadius: BorderRadius.circular(10),
              ),
              width: 280,
              height: 330,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Image.asset(
                    'assets/icons/music_symbol01.png',
                    width: 100,
                    height: 100,
                  ),
                  const Text('登录后才可进行更多操作'),
                  OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      side: const BorderSide(color: CustomColors.paimary),
                      foregroundColor: CustomColors.secondary,
                    ),
                    onPressed: () {
                      context.go('/user/login/prompt');
                    },
                    child: const Text(
                      '立即登录',
                      style: TextStyle(
                        color: CustomColors.paimary,
                        fontSize: 15,
                      ),
                    ),
                  )
                ],
              ),
            ),
            IconButton(
              onPressed: () {
                context.go('/home/index/0');
              },
              icon: const Icon(Icons.close, size: 30),
            ),
          ],
        ),
      ),
    );
  }
}
