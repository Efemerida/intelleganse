
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sorting_garbage/ui/screens/main_screen.dart';


Page<dynamic> Function(BuildContext, GoRouterState) _getPageBuilder(
    Widget child,
    ) {
  return (context, state) => NoTransitionPage(
    child: child,
    // transitionDuration: Duration(milliseconds: 400),
    // transitionsBuilder: (context, animation, secondaryAnimation, child) {
    //   final offsetAnimation = Tween<Offset>(
    //     begin: Offset(0.0, 0.1),
    //     end: Offset.zero,
    //   ).animate(animation);
    //
    //   final fadeAnimation = Tween<double>(
    //     begin: 0.0,
    //     end: 1.0,
    //   ).animate(animation);
    //
    //   return SlideTransition(
    //     position: offsetAnimation,
    //     child: FadeTransition(opacity: fadeAnimation, child: child),
    //   );
    // },
  );
}

final GoRouter router = GoRouter(
  initialLocation: '/main',
  routes: [
    GoRoute(path: '/main',
        pageBuilder: _getPageBuilder(MainScreen())),
    // GoRoute(path: '/auth',
    //     pageBuilder: _getPageBuilder(AuthPage())),
    // ShellRoute(
    //   builder: (context, state, child) {
    //     return Scaffold(
    //       appBar: MainAppBar(),
    //       body: child,
    //       bottomNavigationBar: AnimatedBottomNavigationBar(),
    //     );
    //   },
    //   routes: [
    //     GoRoute(path: '/home', pageBuilder: _getPageBuilder(MainPage())),
  ],
);
