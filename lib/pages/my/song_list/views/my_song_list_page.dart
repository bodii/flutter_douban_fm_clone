import 'package:flutter/material.dart';
import 'package:flutter_douban_fm_clone/common/custom_color.dart';
import 'package:flutter_douban_fm_clone/database/music/music_basic_db.dart';
import 'package:flutter_douban_fm_clone/models/music_basic_info_model.dart';
import 'package:go_router/go_router.dart';

class MySongListPage extends StatelessWidget {
  const MySongListPage({
    super.key,
    required this.songListName,
  });

  final String songListName;

  Future<List<MusicBasicInfo>> fetchMusicBasicData() async {
    MusicBasicDb musicBasicDb = MusicBasicDb();
    List<MusicBasicInfo> infoList = await musicBasicDb.pageQuery();

    return infoList;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () {
            context.go('/home/index/2');
          },
        ),
        title: Text(
          songListName,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SizedBox(
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Column(
            children: [
              Container(
                margin:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                height: 40,
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.02),
                  borderRadius: BorderRadius.circular(40),
                ),
                child: TextField(
                  decoration: InputDecoration(
                    prefixIcon: const Icon(
                      Icons.search,
                      size: 30,
                      color: Colors.black26,
                    ),
                    hintText: '搜索$songListName',
                    hintStyle: const TextStyle(
                      color: Colors.black38,
                      fontSize: 14,
                    ),
                    border: InputBorder.none,
                  ),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const SizedBox(
                      width: 160,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Icon(Icons.shuffle),
                          SizedBox(
                            width: 130,
                            child: Text(
                              '随机播放 7 首',
                              style: TextStyle(
                                fontSize: 15,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    GestureDetector(
                      child: const Icon(Icons.done_all),
                      onTap: () {
                        debugPrint('多选');
                        context.push('/my/songListOperation/batchOperation');
                      },
                    ),
                  ],
                ),
              ),
              Expanded(
                child: FutureBuilder(
                  future: fetchMusicBasicData(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.none ||
                        !snapshot.hasData) {
                      return const Center(child: CircularProgressIndicator());
                    }
                    if (snapshot.hasError || snapshot.data!.isEmpty) {
                      return const Center(
                        child: Text('not data!'),
                      );
                    }

                    List<MusicBasicInfo> infoList = snapshot.data!;

                    return ListView.builder(
                      itemCount: infoList.length,
                      itemBuilder: (context, index) {
                        return createSongListCardItem(infoList[index], context);
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget createSongListCardItem(
    MusicBasicInfo info,
    BuildContext context,
  ) {
    return ListTile(
      onTap: () {
        context.push('/play/music/${info.id}');
      },
      leading: SizedBox(
        width: 60,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Image.network(
            info.pic!,
            fit: BoxFit.cover,
            width: 70,
            height: 70,
          ),
        ),
      ),
      title: Row(
        children: [
          Text(
            info.name!,
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
      subtitle: Text(
        info.artist!,
        style: const TextStyle(
          color: Colors.black38,
          overflow: TextOverflow.ellipsis,
        ),
      ),
      trailing: GestureDetector(
        child: const Icon(
          Icons.more_horiz,
          color: Colors.black54,
        ),
        onTap: () {
          debugPrint('...');
        },
      ),
    );
  }
}
