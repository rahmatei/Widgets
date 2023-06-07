// GoRouter configuration
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:widgets_example/go_router/page2.dart';
import 'package:widgets_example/go_router/page3.dart';
import 'package:widgets_example/go_router/page3_1.dart';
import 'package:widgets_example/go_router/screen_navigation_go_router.dart';
import 'package:widgets_example/home.dart';

import '../cicular_progress_bar/circular_progress_bar_screen.dart';
import '../clip_path/clip_path_screen.dart';
import '../custom_scroll_view/custom_scroll_view_screen.dart';

final router = GoRouter(
  initialLocation: '/',
  routes: [
    ShellRoute(
      builder: (context, state, child) {
        return ScreenNavigationGoRouter(
          child: child,
        );
      },
      routes: [
        GoRoute(
          name:
              'home', // Optional, add name to your routes. Allows you navigate by name instead of path
          path: '/',
          builder: (context, state) => CircularProgressBar(),
        ),
        GoRoute(
          name: 'page2',
          path: '/page2',
          builder: (context, state) => const Page2(),
        ),
      ],
    ),
    GoRoute(
      path: '/page3',
      name: 'page3',
      builder: (context, state) {
        return const Page3();
      },
      routes: <RouteBase>[
        // Add child routes
        GoRoute(
          path:
              'page3_1', // NOTE: Don't need to specify "/" character for router’s parents
          name: 'page3_1',
          builder: (context, state) {
            final id = state.params['id'];

            return Page3_1(
              id: id.toString(),
            );
          },
        ),
      ],
    )
  ],
);
