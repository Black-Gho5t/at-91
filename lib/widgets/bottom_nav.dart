import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class BottomNavBar extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int>? onTap;

  // Public list of locations to map tabs to routes (order must match items)
  static const List<String> locations = [
    '/',
    '/options',
    '/create',
    '/profile',
    '/notifications',
  ];

  const BottomNavBar({Key? key, this.currentIndex = 0, this.onTap})
      : super(key: key);

  int _safeIndex(int i) => (i >= 0 && i < locations.length) ? i : 0;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      currentIndex: _safeIndex(currentIndex),
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
        BottomNavigationBarItem(icon: Icon(Icons.explore), label: 'Options'),
        BottomNavigationBarItem(icon: Icon(Icons.add_box_outlined), label: 'Create'),
        BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        BottomNavigationBarItem(icon: Icon(Icons.notifications_none), label: 'Notifications'),
      ],
      onTap: (index) {
        if (onTap != null) {
          onTap!(index);
          return;
        }

        // Fallback: if no callback provided, navigate with go_router
        final loc = locations[_safeIndex(index)];
        GoRouter.of(context).go(loc);
      },
    );
  }
}
