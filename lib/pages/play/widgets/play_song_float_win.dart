import 'package:flutter/material.dart';
import 'package:flutter_douban_fm_clone/common/custom_color.dart';

import 'package:just_audio/just_audio.dart';

final class PlaySongFloatWin {
  static void show({required BuildContext context}) {
    Size size = MediaQuery.of(context).size;

    //1、创建 overlayEntry
    OverlayEntry floatWin = OverlayEntry(
      builder: (context) {
        return Positioned(
          top: size.height * 0.9,
          left: size.width * 0.05,
          right: size.width * 0.05,
          child: Material(
            child: Container(
              width: size.width * 0.9,
              height: 50,
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
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                      onPressed: () async {
                        try {
                          final player = AudioPlayer(); // Create a player
                          await player.setUrl(// Load a URL
                              'https://m701.music.126.net/20230803155759/0b8239d8916cc9f68713f8e878aad10a/jdymusic/obj/wo3DlMOGwrbDjj7DisKw/28133412272/3473/fd93/cac4/eeb73cecc8a429b86733bd626ecc5d08.mp3'); // Schemes: (https: | file: | asset: )
                          player.play(); // Play without waiting for completion
                        } on PlayerException catch (e) {
                          // iOS/macOS: maps to NSError.code
                          // Android: maps to ExoPlayerException.type
                          // Web: maps to MediaError.code
                          // Linux/Windows: maps to PlayerErrorCode.index
                          debugPrint("Error code: ${e.code}");
                          // iOS/macOS: maps to NSError.localizedDescription
                          // Android: maps to ExoPlaybackException.getMessage()
                          // Web/Linux: a generic message
                          // Windows: MediaPlayerError.message
                          debugPrint("Error message: ${e.message}");
                        } on PlayerInterruptedException catch (e) {
                          // This call was interrupted since another audio source was loaded or the
                          // player was stopped or disposed before this audio source could complete
                          // loading.
                          debugPrint("Connection aborted: ${e.message}");
                        } catch (e) {
                          // Fallback for all other errors
                          debugPrint('An error occured: $e');
                        }
                      },
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
                      Text('artist',
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
                ],
              ),
            ),
          ),
        );
      },
    );

    //插入到 Overlay中显示 OverlayEntry
    Overlay.of(context).insert(floatWin);

    // //延时两秒，移除 OverlayEntry
    // Future.delayed(Duration(seconds: 4)).then((value) {
    //   overlayEntry.remove();
    // });
  }
}
