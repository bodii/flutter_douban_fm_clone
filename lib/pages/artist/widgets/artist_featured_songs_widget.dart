import 'package:flutter/material.dart';
import 'package:flutter_douban_fm_clone/common/request.dart';
import 'package:flutter_douban_fm_clone/models/artist_featured_songs_model.dart';
import 'package:flutter_douban_fm_clone/common/controllers/selecter.dart';

class ArtistFeaturedSongsWidget extends StatelessWidget {
  const ArtistFeaturedSongsWidget({super.key, required this.artistId});

  final int artistId;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    return _generateSongItemList(size.height);
  }

  Widget _generateSongItemList(double height) {
    return SizedBox(
      // height: height,
      child: FutureBuilder(
          future: fetchArtistFeaturedSongs(artistId),
          builder: (context, AsyncSnapshot<ArtistFeaturedSongs> snapshot) {
            if (snapshot.connectionState == ConnectionState.none ||
                !snapshot.hasData) {
              return const Center(child: CircularProgressIndicator());
            }
            if (snapshot.hasError) {
              return const Center(
                child: Text('not data!'),
              );
            }
            return ListView.builder(
              itemCount: snapshot.data!.list!.length,
              itemBuilder: (context, index) =>
                  _generateSongItem(index + 1, snapshot.data!.list![index]),
              padding: const EdgeInsets.symmetric(vertical: 5),
            );
          }),
    );
  }

  Widget _generateSongItem(int index, Song song) {
    BatchSelector selecter = BatchSelector();
    return ListTile(
      onTap: () {
        if (selecter.isSelected) {
          selecter.setNotSelect();
        } else {
          selecter.setSelected();
        }
      },
      // focusColor: Colors.grey.withOpacity(0.05),
      // hoverColor: Colors.grey.withOpacity(0.05),
      splashColor: Colors.grey.withOpacity(0.05),
      selectedTileColor: Colors.grey.withOpacity(0.08),
      selected: selecter.isSelected,
      leading: SizedBox(
        width: 60,
        height: 70,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(5),
          child: Image.network(song.pic!, fit: BoxFit.cover),
        ),
      ),
      title: Text(
        song.name!,
        style: const TextStyle(
          fontSize: 17,
          fontWeight: FontWeight.w400,
          color: Colors.black87,
        ),
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      ),
      subtitle: Text(
        song.artist!,
        style: const TextStyle(
          fontSize: 13,
          fontWeight: FontWeight.w200,
          color: Colors.black54,
        ),
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      ),
      trailing: const Icon(
        Icons.more_horiz,
        color: Colors.black54,
      ),
    );
  }
}
