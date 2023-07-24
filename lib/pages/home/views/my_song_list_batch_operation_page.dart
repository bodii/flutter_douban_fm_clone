import 'package:flutter/material.dart';
import 'package:flutter_douban_fm_clone/configs/custom_color.dart';
import 'package:flutter_douban_fm_clone/pages/home/controllers/selecter.dart';

class MySongListBatchOperationPage extends StatelessWidget {
  const MySongListBatchOperationPage({super.key});

  @override
  Widget build(BuildContext context) {
    BatchSelector selector1 = BatchSelector();
    BatchSelector selector2 = BatchSelector();

    AllSelector allSelect = AllSelector();
    allSelect.add([selector1, selector2]);

    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          onTap: () {
            // Navigator.pop(context);
          },
          child: const Icon(
            Icons.close_outlined,
            size: 32,
            color: Colors.black87,
          ),
        ),
        title: const Center(
          child: Text(
            '批量操作',
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18.0),
          child: Column(
            children: [
              createSongListCardItem(
                'https://img4.kuwo.cn/star/albumcover/500/1/29/1934979845.jpg',
                '向云端',
                '小霞&海洋Bo',
                context,
                selector1,
                allSelect,
              ),
              createSongListCardItem(
                'https://img4.kuwo.cn/star/albumcover/500/1/29/1934979845.jpg',
                '向云端',
                '小霞&海洋Bo',
                context,
                selector2,
                allSelect,
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        width: double.infinity,
        height: 100,
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                onTap: () {
                  allSelect.toggle();
                },
                child: Row(
                  children: [
                    Transform.scale(
                      scale: 0.8,
                      child: ListenableBuilder(
                          listenable: allSelect,
                          builder: (BuildContext context, Widget? child) {
                            return Checkbox(
                              value: allSelect.isAllSelected,
                              onChanged: (value) {},
                            );
                          }),
                    ),
                    const Text(
                      '全选',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              Row(children: [
                const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: Text('离线',
                        style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                          color: Colors.black26,
                        ))),
                TextButton(
                    onPressed: () {},
                    child: const Text('删除',
                        style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ))),
                TextButton(
                  onPressed: () {},
                  child: const Text('添加到',
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      )),
                ),
              ]),
            ],
          ),
        ),
      ),
    );
  }

  Widget createSongListCardItem(
      String? coverSrc,
      String songName,
      String singer,
      BuildContext context,
      BatchSelector selector,
      AllSelector allSelector,
      {bool isCheck = false}) {
    String src = coverSrc ?? '';
    return InkWell(
      onTap: () => selector.toggle(allSelector),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 10,
        ),
        child: SizedBox(
          width: double.infinity,
          height: 65,
          child: Row(
            children: [
              Transform.scale(
                scale: 0.8,
                child: ListenableBuilder(
                    listenable: selector,
                    builder: (BuildContext context, Widget? child) {
                      return Checkbox(
                        value: selector.isSelected,
                        onChanged: (value) {},
                      );
                    }),
              ),
              SizedBox(
                width: 65,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.network(
                    src,
                    fit: BoxFit.cover,
                    width: 65,
                    height: 65,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 18.0),
                child: SizedBox(
                  width: 220,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            songName,
                            style: const TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.only(left: 7.0),
                            child: Icon(
                              Icons.favorite,
                              color: CustomColors.neutral,
                              size: 17,
                            ),
                          )
                        ],
                      ),
                      Text(
                        singer,
                        style: const TextStyle(
                          color: Colors.black38,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
