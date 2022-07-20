import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class BottomNavbar extends StatelessWidget {
  const BottomNavbar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final location = GoRouter.of(context).location;
    return BottomNavigationBar(
      currentIndex: () {
        switch (location) {
          case '/wordslist':
            return 1;
          default:
            return 0;
        }
      }(),
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.font_download),
          label: 'Guess words',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.reorder),
          label: 'Wordlist',
        ),
      ],
      onTap: (index) {
        late final String path;
        switch (index) {
          case 0:
            path = '/';
            break;
          case 1:
            path = '/wordslist';
            break;
        }
        GoRouter.of(context).go(path);
      },
    );
  }
}
