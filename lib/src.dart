import 'package:auth_frontend_flutter/screens/auth_screen.dart';
import 'package:auth_frontend_flutter/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class Src extends StatelessWidget {
  Src({super.key});

  final GoRouter router = GoRouter(
    initialLocation: '/signup',
    routes: [
      ShellRoute(
        routes: [
          GoRoute(
            path: '/signup',
            builder: (context, state) => const AuthPage(),
          ),
          GoRoute(
            path: '/login',
            builder: (context, state) =>
                const AuthPage(authType: AuthType.login),
          ),
        ],
        builder: (context, state, child) => AuthShell(child: child),
      ),
      GoRoute(
        path: '/',
        builder: (context, state) => const HomeScreen(),
      )
    ],
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Flutter auth with node.js backend',
      routerConfig: router,
    );
  }
}
