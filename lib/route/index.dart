import 'package:flutter_douban_fm_clone/pages/error/views/error_page.dart';
import 'package:flutter_douban_fm_clone/pages/home/views/home_page.dart';
import 'package:flutter_douban_fm_clone/pages/my/song_list/views/my_song_list_batch_operation_page.dart';
import 'package:flutter_douban_fm_clone/pages/album/views/best_album_song_list_page.dart';
import 'package:flutter_douban_fm_clone/pages/my/song_list/views/my_song_list_page.dart';
import 'package:flutter_douban_fm_clone/pages/user/info/views/modify_user_info.dart';
import 'package:flutter_douban_fm_clone/pages/user/login/views/no_login_page.dart';
import 'package:flutter_douban_fm_clone/pages/artist/views/artist_home_page.dart';
import 'package:flutter_douban_fm_clone/pages/user/login/views/login_page.dart';
import 'package:flutter_douban_fm_clone/pages/user/login/views/login_prompt_page.dart';
import 'package:flutter_douban_fm_clone/pages/welcome/views/index.dart';
import 'package:go_router/go_router.dart';

class AppRoute {
  static final GoRouter routes = GoRouter(
    initialLocation: '/',
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const WelcomeIndexPage(),
      ),
      GoRoute(
        path: '/user/login/no_login',
        builder: (context, state) => const NoLoginPage(),
      ),
      GoRoute(
        path: '/user/login/prompt',
        builder: (context, state) => const LoginPromptPage(),
      ),
      GoRoute(
        path: '/user/login/home',
        builder: (context, state) => const LoginPage(),
      ),
      GoRoute(
        path: '/user/info/modify',
        builder: (context, state) => const UserInfoModify(),
      ),
      GoRoute(
        path: '/home/index/:index',
        builder: (context, state) => HomePage(
          index: state.pathParameters['index'] ?? '0',
        ),
      ),
      GoRoute(
        path: '/my/songList/:mySongListName',
        builder: (context, state) => MySongListPage(
          songListName: state.pathParameters['mySongListName'] ?? '',
        ),
      ),
      GoRoute(
        path: '/my/songListOperation/BatchOperation',
        builder: (context, state) => const MySongListBatchOperationPage(),
      ),
      GoRoute(
        path: '/best/album/songList',
        builder: (context, state) => const BestAlbumSongListPage(),
      ),
      GoRoute(
        path: '/artist/home',
        builder: (context, state) => const ArtistHomePage(),
      )
    ],
    errorBuilder: (context, state) => ErrorPage(state.error!),
    debugLogDiagnostics: true,
  );
}
