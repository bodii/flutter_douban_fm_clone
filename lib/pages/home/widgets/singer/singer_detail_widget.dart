import 'package:flutter/material.dart';
import 'package:flutter_douban_fm_clone/common/functions/html_entities_to_string.dart';
import 'package:flutter_douban_fm_clone/models/singer_detail_model.dart';

class SingerDetailWidget extends StatelessWidget {
  const SingerDetailWidget({super.key, required this.singerDetail});

  final SingerDetail singerDetail;

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

  Widget _getBasicInfoWidget() {
    Map<String, String?> titleAndValue = {
      '姓名': singerDetail.name!.htmlEntitiesToString(),
      '英文名': singerDetail.aartist!.htmlEntitiesToString(),
      '性别': singerDetail.gener,
      '国籍': singerDetail.country,
      '出生地': singerDetail.birthplace,
      '语言': singerDetail.language,
      '生日': singerDetail.birthday,
      '星座': singerDetail.constellation,
      '身高': singerDetail.tall,
      '体重': singerDetail.weight,
    };

    List<String> titles = titleAndValue.keys.toList();
    List<String> values =
        titleAndValue.values.map((e) => e != '' ? e! : ' - ').toList();

    List<Row> cols = [];

    for (var i = 0; i < titles.length / 2; i++) {
      int index = i * 2;
      Row col = Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 150,
            child: Text.rich(TextSpan(children: [
              TextSpan(
                  text: '${titles[index]}：',
                  style: const TextStyle(color: Colors.black38)),
              TextSpan(
                  text: values[index],
                  style: const TextStyle(color: Colors.black87)),
            ])),
          ),
          SizedBox(
            width: 120,
            child: Text.rich(TextSpan(children: [
              TextSpan(
                  text: '${titles[index + 1]}：',
                  style: const TextStyle(color: Colors.black38)),
              TextSpan(
                  text: values[index + 1],
                  style: const TextStyle(color: Colors.black87)),
            ])),
          ),
        ],
      );
      cols.add(col);
    }

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 12.0),
      child: Column(
        children: cols,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            '基本信息',
            style: TextStyle(color: Colors.black38),
          ),
          _getBasicInfoWidget(),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 18),
            child: Text('简介', style: TextStyle(color: Colors.black38)),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 40.0),
            child: Text(
              singerDetail.info!
                  .htmlEntitiesToString()
                  .replaceAll('<br/>', '\n\n'),
              style:
                  TextStyle(fontSize: 16, color: Colors.black.withOpacity(0.7)),
            ),
          ),
        ],
      ),
    );
  }
}
