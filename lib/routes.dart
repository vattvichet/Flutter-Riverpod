import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpodVichet/page1.dart';
import 'package:riverpodVichet/page2.dart';

import 'main.dart';

final _key = GlobalKey<NavigatorState>();

enum AppRoute { page1, page2 }

final routerProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    navigatorKey: _key,
    initialLocation: '/',
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) {
          return const MyHomePage();
        },
      ),
      GoRoute(
        path: '/${AppRoute.page1.name}',
        name: AppRoute.page1.name,
        builder: (context, state) {
          return const Page1View();
        },
      ),
      GoRoute(
        path: '/${AppRoute.page2.name}',
        name: AppRoute.page2.name,
        builder: (context, state) {
          return const Page2View();
        },
      ),
    ],
  );
});
