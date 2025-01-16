import 'package:chuck_interceptor/chuck.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:movie/core/connectivity/network_info.dart';
import 'package:movie/features/bookmark/bookmark_page.dart';
import 'package:movie/features/detail/detail_page.dart';
import 'package:movie/features/home/home_page.dart';
import 'package:movie/features/others/scaffold_with_navbar/scaffold_with_navbar.dart';
import 'package:movie/features/search/search_page.dart';

part "name_routes.dart";

final GlobalKey<NavigatorState> rootNavigatorKey = GlobalKey<NavigatorState>();
final NetworkInfo networkInfo = sl<NetworkInfo>();
final Chuck chuck = Chuck(navigatorKey: rootNavigatorKey);
final GetIt sl = GetIt.instance;

final GoRouter router = GoRouter(
  initialLocation: '/home',
  routes: [
    StatefulShellRoute.indexedStack(
      builder: (context, state, navigationShell) {
        return ScaffoldWithNavBar(navigationShell: navigationShell);
      },
      branches: [
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/home',
              builder: (context, state) => const HomePage(),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/search',
              builder: (context, state) => const SearchPage(),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/watchlist',
              builder: (context, state) => const BookmarkPage(),
            ),
          ],
        ),
      ],
    ),
    GoRoute(
      path: '/detail/:id',
      builder: (BuildContext context, GoRouterState state) {
        final movieId = int.parse(state.pathParameters['id']!);
        return DetailPage(movieId: movieId);
      },
    ),
  ],
);
