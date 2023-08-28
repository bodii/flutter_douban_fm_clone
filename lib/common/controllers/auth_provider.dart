import 'package:flutter/widgets.dart';

import 'login.dart';

extension AuahContext on BuildContext {
  Login auth() {
    return AuthProvider.of(this);
  }
}

class AuthProvider extends InheritedWidget {
  const AuthProvider({super.key, required super.child, required this.login});

  final Login login;

  static Login of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<AuthProvider>()!.login;
  }

  @override
  bool updateShouldNotify(AuthProvider oldWidget) {
    return oldWidget.login.isLoggedIn;
  }
}
