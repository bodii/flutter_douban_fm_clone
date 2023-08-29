import 'package:flutter/material.dart';
import 'package:flutter_douban_fm_clone/database/album/album_db.dart';
import 'package:flutter_douban_fm_clone/models/album_model.dart';

class CollectAlbumWidget extends StatelessWidget {
  const CollectAlbumWidget({super.key});

  Future<List<Album>> getCollectAlbumData(
      [int page = 1, int pageSize = 16]) async {
    AlbumDb albumDb = AlbumDb();
    List<Album> albumList = await albumDb.pageQuery();

    return albumList;
  }

  @override
  Widget build(BuildContext context) {
    return _generateSongItemList();
  }

  Widget _generateSongItemList() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0),
      child: FutureBuilder(
        future: getCollectAlbumData(),
        builder: (context, AsyncSnapshot<List<Album>> snapshot) {
          if (snapshot.connectionState == ConnectionState.none ||
              !snapshot.hasData) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError ||
              !snapshot.hasData ||
              snapshot.data!.isEmpty) {
            return const Center(
              child: Text('not data!'),
            );
          }
          List<Album> albumList = snapshot.data!;
          return GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 5,
              crossAxisSpacing: 15,
              childAspectRatio: 0.7,
            ),
            shrinkWrap: true,
            padding: EdgeInsets.zero,
            itemCount: albumList.length,
            itemBuilder: (context, index) =>
                _generateItem(index + 1, albumList[index]),
            // padding: const EdgeInsets.symmetric(vertical: 5),
          );
        },
      ),
    );
  }

  Widget _generateItem(int index, Album album) {
    return GestureDetector(
      onTap: () {
        debugPrint('点击了唱片: ${album.albumid}');
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 170,
            height: 170,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(5),
              child: Image.network(album.pic!),
            ),
          ),
          const SizedBox(height: 10),
          Text(
            album.album!,
            style: const TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w400,
              color: Colors.black87,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          Text(
            album.artist!,
            style: const TextStyle(
              fontSize: 11,
              fontWeight: FontWeight.w400,
              color: Colors.black54,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          Text(
            album.releaseDate!,
            style: const TextStyle(
              fontSize: 10,
              fontWeight: FontWeight.w400,
              color: Colors.black54,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}
