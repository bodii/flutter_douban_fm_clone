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
    ],
    // errorBuilder: (context, state) => ,
    debugLogDiagnostics: true,
  );
}
