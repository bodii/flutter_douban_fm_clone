import 'package:flutter_douban_fm_clone/pages/home/views/home_page.dart';
import 'package:flutter_douban_fm_clone/pages/home/views/my_song_list_batch_operation_page.dart';
import 'package:flutter_douban_fm_clone/pages/home/views/my_song_list_page.dart';
import 'package:flutter_douban_fm_clone/pages/home/views/no_login_page.dart';
import 'package:flutter_douban_fm_clone/pages/user/views/login_page.dart';
import 'package:flutter_douban_fm_clone/pages/user/views/login_prompt_page.dart';
import 'package:flutter_douban_fm_clone/pages/welcome/views/index.dart';
import 'package:go_router/go_router.dart';

class AppRoute {
  static final GoRouter routes = GoRouter(
    initialLocation: '/home/index/0',
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const WelcomeIndexPage(),
      ),
      GoRoute(
        path: '/home/no_login',
        builder: (context, state) => const NoLoginPage(),
      ),
      GoRoute(
        path: '/user/login/prompt',
        builder: (context, state) => const LoginPromptPage(),
      ),
      GoRoute(
        path: '/user/login',
        builder: (context, state) => const LoginPage(),
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
    ],
    // errorBuilder: (context, state) => ,
    debugLogDiagnostics: true,
  );
}
