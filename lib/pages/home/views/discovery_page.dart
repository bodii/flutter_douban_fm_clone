import 'package:flutter/material.dart';
import 'package:flutter_douban_fm_clone/configs/custom_color.dart';

class DiscoveryPage extends StatelessWidget {
  const DiscoveryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: size.width * 0.5,
              margin: const EdgeInsets.only(top: 50),
              padding: const EdgeInsets.only(left: 10),
              child: SizedBox(
                width: double.infinity,
                height: 80,
                child: RawChip(
                  label: const CircleAvatar(
                    backgroundColor: CustomColors.paimary,
                    radius: 35,
                    child: Icon(
                      Icons.play_arrow_sharp,
                      color: Colors.white,
                      size: 35,
                    ),
                  ),
                  backgroundColor: Colors.black12.withOpacity(0.03),
                  side: BorderSide.none,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(40)),
                  padding: const EdgeInsets.only(
                    right: 90,
                    top: 5,
                    bottom: 5,
                  ),
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 50, right: 0),
              padding: const EdgeInsets.only(left: 40, right: 40),
              width: size.width * 0.5,
              child: const Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        'Nov.',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        '28',
                        style: TextStyle(
                          fontSize: 45,
                          fontWeight: FontWeight.bold,
                          height: 1,
                        ),
                      ),
                    ],
                  ),
                  Text(
                    '每日私享歌单',
                    style: TextStyle(fontSize: 16),
                  ),
                ],
              ),
            )
          ],
        ),
        Container(
          width: size.width * 0.9,
          height: 50,
          margin: const EdgeInsets.only(bottom: 30),
          padding: const EdgeInsets.symmetric(horizontal: 8),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.25),
                offset: const Offset(0.0, 5.0),
                blurRadius: 8.0,
                spreadRadius: 0.1,
              ),
            ],
          ),
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.play_arrow_sharp,
                  size: 32,
                  color: CustomColors.paimary,
                )),
            const Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'song name',
                  style: TextStyle(fontSize: 16),
                ),
                Text('singer',
                    style: TextStyle(
                      fontSize: 12,
                      color: CustomColors.tertiary,
                    )),
              ],
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.favorite_border,
                color: CustomColors.neutral,
                size: 28,
              ),
            )
          ]),
        )
      ],
    );
  }
}
