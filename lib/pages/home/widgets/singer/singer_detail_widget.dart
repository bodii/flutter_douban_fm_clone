import 'package:flutter/material.dart';

class SingerDetailWidget extends StatelessWidget {
  const SingerDetailWidget({super.key});

  Widget getGenreAndStyleWidget() {
    const List<String> genreAndStyle = ['Jazz'];

    List<Widget> list = [];
    for (String gs in genreAndStyle) {
      list.add(getGenreAndStyleItem(gs));
    }

    return Wrap(spacing: 10.0, children: list);
  }

  Widget getGenreAndStyleItem(String genreAndStyle) {
    return Chip(
      label: Text(genreAndStyle),
      backgroundColor: Colors.grey.withOpacity(0.05),
      side: BorderSide.none,
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            '流派与风格',
            style: TextStyle(color: Colors.black38),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20.0),
            child: getGenreAndStyleWidget(),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 18),
            child: Text('简介', style: TextStyle(color: Colors.black38)),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 40.0),
            child: Text(
                style: TextStyle(
                    fontSize: 16, color: Colors.black.withOpacity(0.7)),
                '来自加拿大的女歌手Lily Frost, 早在1989年便开始了她的音乐生涯,可惜这一'
                '路并不平坦. 从加拿大的音乐重地Montreal到埃及的Cairo，再回到Vancouver,最终落'
                '脚在Toronto的她,曾组过以翻唱老歌为主的乐队The Sheiks, 也试过在异国的油轮上以'
                '驻场歌手为职业.直到1992年,和朋友Minstrel Jorge Diaz组成了乐队The Colorifics, '
                'Frost才算是真正开始了她的创作历程. 之后,不但有大学电台选播The Colorifics的歌曲,'
                '乐队还获得了大量现场演出的机会,并在演出的时候出售他们四张自资专辑,销量虽不能算巨大倒'
                '也让人欣慰.\n\n到了1998年, Frost决定单飞,并在器材都是借回来的艰难状况下,录制了首张'
                '个人专辑. 2001年, 随着在德国,日本等地的发行,Frost的名字渐渐出现在乐评人的文章里,'
                '并获得不俗的评价, "Who Am I"一曲更被收录在电影的原声带里. 03年起, Frost又开始了'
                '新专辑的录制,这一次,她几乎一手包办了专辑的所有创作,终于在04年正式完成.'),
          ),
        ],
      ),
    );
  }
}
