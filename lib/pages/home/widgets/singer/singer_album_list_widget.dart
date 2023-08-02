import 'package:flutter/material.dart';
import 'package:flutter_douban_fm_clone/common/request.dart';
import 'package:flutter_douban_fm_clone/models/singer_album_list_model.dart';

class SingerAlbumListWidget extends StatelessWidget {
  const SingerAlbumListWidget({super.key, required this.artistId});

  final int artistId;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    return _generateSongItemList(size.height);
  }

  Widget _generateSongItemList(double height) {
    return FutureBuilder(
      future: fetchSingerAlbumList(artistId),
      builder: (context, AsyncSnapshot<SingerAlbumList> snapshot) {
        if (snapshot.connectionState == ConnectionState.none &&
            !snapshot.hasData) {
          return const Center(child: CircularProgressIndicator());
        }
        if (!snapshot.hasData) {
          return const Center(
            child: Text('not data!'),
          );
        }
        return GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 5,
            crossAxisSpacing: 15,
            childAspectRatio: 0.7,
          ),
          shrinkWrap: true,
          padding: EdgeInsets.zero,
          itemCount: snapshot.data!.albumList!.length,
          itemBuilder: (context, index) =>
              _generateItem(index + 1, snapshot.data!.albumList![index]),
          // padding: const EdgeInsets.symmetric(vertical: 5),
        );
      },
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
