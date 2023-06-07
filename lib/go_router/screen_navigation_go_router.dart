import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ScreenNavigationGoRouter extends StatelessWidget {
  final Widget child;
  const ScreenNavigationGoRouter({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: child),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _calculateSelectedIndex(context), // TODO
        onTap: (value) {
          // navigate to other sections (just change the pages, bottomNavigation always visible on the screen)
          switch (value) {
            case 0:
              context.goNamed('home');
              // context.goNamed('feed'); to navigate by name
              break;
            case 1:
              context.goNamed('page2');
          }
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Main',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.newspaper),
            label: 'RowMan',
          ),
        ],
      ),
    );
  }
}

int _calculateSelectedIndex(BuildContext context) {
  final String location = GoRouterState.of(context).location;

  if (location.startsWith('/home')) {
    return 0;
  }
  if (location.startsWith('/page2')) {
    return 1;
  }
  return 0;
}
