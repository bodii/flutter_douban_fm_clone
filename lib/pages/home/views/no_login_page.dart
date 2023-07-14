import 'package:flutter/material.dart';
import 'package:flutter_douban_fm_clone/configs/custom_color.dart';
import 'package:flutter_svg/flutter_svg.dart';

class NoLoginPage extends StatelessWidget {
  const NoLoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('no_login')),
      body: Center(
        child: Container(
          width: 200,
          height: 200,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            children: [
              Image.asset(
                'assets/icons/music_symbol01.png',
                width: 100,
                height: 100,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
