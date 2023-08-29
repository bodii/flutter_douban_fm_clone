import 'package:flutter/material.dart';
import 'package:flutter_douban_fm_clone/database/artist/artist_db.dart';
import 'package:flutter_douban_fm_clone/models/artist_model.dart';

class CollectArtistWidget extends StatelessWidget {
  const CollectArtistWidget({super.key});

  Future<List<Artist>> getCollectArtistData(
      [int page = 1, int pageSize = 16]) async {
    ArtistDb artistDb = ArtistDb();
    List<Artist> artistList = await artistDb.pageQuery(page, pageSize);

    return artistList;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: FutureBuilder(
          future: getCollectArtistData(),
          builder: (context, AsyncSnapshot<List<Artist>> snapshot) {
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
            List<Artist> artistList = snapshot.data!;

            return ListView.builder(
              itemCount: artistList.length,
              itemBuilder: (context, index) {
                Artist artist = artistList[index];
                return ListTile(
                  leading: Container(
                      width: 120,
                      height: 120,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(120)),
                      child: Image.network(artist.pic120!)),
                  title: Text(artist.name!),
                );
              },
            );
          }),
    );
  }
}
