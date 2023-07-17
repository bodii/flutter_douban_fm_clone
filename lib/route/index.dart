import 'package:flutter_douban_fm_clone/pages/home/views/no_login_page.dart';
import 'package:flutter_douban_fm_clone/pages/user/views/login_page.dart';
import 'package:flutter_douban_fm_clone/pages/user/views/login_prompt_page.dart';
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
    ],
    // errorBuilder: (context, state) => ,
    debugLogDiagnostics: true,
  );
}
