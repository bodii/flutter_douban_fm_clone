import 'package:flutter/material.dart';
import 'package:flutter_douban_fm_clone/pages/welcome/widgets/circular_wave.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

class WelcomeIndexPage extends StatelessWidget {
  const WelcomeIndexPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          color: Colors.white,
          child: const CircularWave(),
        ),
        Center(
          child: SizedBox(
            width: 130,
            height: 130,
            child: SvgPicture.asset(
              'assets/icons/logo02.svg',
              colorFilter:
                  const ColorFilter.mode(Colors.white, BlendMode.srcIn),
            ),
          ),
        ),
        Positioned(
          top: 50,
          right: 10,
          child: GestureDetector(
            onTap: () {
              context.go('/home/no_login');
            },
            child: Container(
              width: 70,
              height: 30,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey.shade300),
                borderRadius: BorderRadius.circular(3),
              ),
              alignment: Alignment.center,
              child: Text(
                '跳过1',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey.shade400,
                  fontWeight: FontWeight.normal,
                  inherit: false,
                ),
              ),
            ),
          ),
        ),
        Positioned(
          bottom: 0,
          child: Container(
            color: Colors.white,
            width: MediaQuery.sizeOf(context).width,
            height: 150,
            alignment: Alignment.center,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.asset(
                    'assets/icons/01.webp',
                    width: 50,
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                const Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '与喜欢的音乐不期而遇',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.black87,
                        fontWeight: FontWeight.normal,
                        inherit: false,
                      ),
                    ),
                    Text(
                      '豆瓣FM',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.black45,
                        fontWeight: FontWeight.normal,
                        inherit: false,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}
