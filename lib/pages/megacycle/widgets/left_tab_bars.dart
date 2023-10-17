import 'package:flutter/material.dart';

import 'switch_play_lists.dart';

class LeftTabBar extends StatefulWidget {
  const LeftTabBar({super.key, required this.tabs});

  final List<Map<String, dynamic>> tabs;

  @override
  LeftTabBarState createState() => LeftTabBarState();
}

class LeftTabBarState extends State<LeftTabBar> {
  int checkIndex = 0;
  int enableIndex = 0;
  int subEnableIndex = 0;
  List<bool> selectsed = List.generate(5, (index) => false);
  List<int> items = List.generate(3, (index) => index);

  ScrollController contr = ScrollController();

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> tabs = widget.tabs;

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 30.0),
          child: SizedBox(
            width: 120,
            child: ListView.builder(
              controller: contr,
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              itemCount: tabs.length,
              itemBuilder: (context, int index) {
                return InkWell(
                  splashColor: Colors.white,
                  highlightColor: Colors.white,
                  onTap: () {
                    List<dynamic> subTabsa = tabs[index]['children'];
                    setState(() {
                      checkIndex = index;
                      if (subTabsa.isEmpty) {
                        enableIndex = checkIndex;
                      }

                      selectsed[index] = !selectsed[index];
                    });
                  },
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 18,
                        child: checkIndex == index
                            ? Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                    const SizedBox(height: 77),
                                    Container(
                                      width: 6,
                                      height: 6,
                                      decoration: BoxDecoration(
                                        color: Colors.greenAccent,
                                        borderRadius: BorderRadius.circular(6),
                                      ),
                                    ),
                                  ])
                            : const SizedBox(width: 6),
                      ),
                      SizedBox(
                        width: 70,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 10.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  SizedBox(
                                    height: 85,
                                    child: Column(
                                      children: [
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(bottom: 8),
                                          child: index < 2
                                              ? Container(
                                                  width: 50,
                                                  height: 50,
                                                  decoration: BoxDecoration(
                                                    color: Colors.white,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            50),
                                                    boxShadow: [
                                                      BoxShadow(
                                                        color: Colors.grey
                                                            .withOpacity(0.25),
                                                        offset: const Offset(
                                                            0.0, 5.0),
                                                        blurRadius: 12.0,
                                                        spreadRadius: 0.1,
                                                      ),
                                                    ],
                                                  ),
                                                  child: Icon(
                                                    tabs[index]['icon'],
                                                    size: 26,
                                                  ))
                                              : Container(
                                                  width: 50,
                                                  height: 50,
                                                  alignment:
                                                      Alignment.bottomCenter,
                                                  child: Icon(
                                                    tabs[index]['icon'],
                                                    size: 26,
                                                  ),
                                                ),
                                        ),
                                        Text(tabs[index]['lable']),
                                      ],
                                    ),
                                  ),
                                  selectsed[index] && index >= 2
                                      ? secondTab(
                                          tabs: tabs[index]['children'],
                                          checkCurIndex: index)
                                      : const SizedBox.shrink(),
                                ],
                              ),
                            ),
                            if (index == 1)
                              const Padding(
                                  padding: EdgeInsets.only(top: 20),
                                  child: Divider(
                                    height: 2,
                                    color: Colors.black26,
                                  )),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: 5,
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(height: 65),
                              index >= 2
                                  ? Icon(selectsed[index]
                                      ? Icons.arrow_drop_up
                                      : Icons.arrow_drop_down)
                                  : const SizedBox.shrink(),
                            ]),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ),
        const Expanded(
          child: SizedBox(
            height: double.infinity,
            child: Center(child: SwitchPlayLists()),
          ),
        ),
      ],
    );
  }

  Widget secondTab({required List<dynamic> tabs, int checkCurIndex = 0}) {
    if (tabs.isEmpty) {
      return const SizedBox.shrink();
    }

    return ListView.builder(
      controller: contr,
      shrinkWrap: true,
      itemCount: tabs.length,
      itemBuilder: (context, index) {
        final tab = tabs[index] as Map<String, dynamic>;
        return SizedBox(
          width: double.infinity,
          child: InkWell(
              onTap: () {
                setState(() {
                  enableIndex = checkCurIndex;
                  subEnableIndex = index;
                });
              },
              // radius: 30,
              borderRadius: BorderRadius.circular(50),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 15.0),
                child: Center(child: Text(tab['name']!)),
              )),
        );
      },
    );
  }
}
