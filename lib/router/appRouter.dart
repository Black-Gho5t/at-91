import 'package:go_router/go_router.dart';
import 'package:flutter/material.dart';

import '../screens/homeScreen.dart';

final appRoutes = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      name: 'home',
      builder: (context, state) => const HomeScreen(),
    ),
  ],
);

import 'package:go_router/go_router.dart';
import 'package:flutter/material.dart';

import '../screens/homeScreen.dart';
import '../screens/subPages/notificationsScreen.dart';
import '../screens/subPages/optionsScreen.dart';
import '../screens/subPages/postScreen.dart';
import '../screens/subPages/ProfileScreen.dart';
import '../widgets/bottom_nav.dart';

int _locationToTabIndex(String location) {
  // Match the beginning of the location to determine selected tab
  if (location.startsWith('/options')) return 1;
  if (location.startsWith('/create')) return 2;
  if (location.startsWith('/profile')) return 3;
  if (location.startsWith('/notifications')) return 4;
  return 0; // default -> home
}

final appRoutes = GoRouter(
  initialLocation: '/',
  routes: [
    ShellRoute(
      builder: (context, state, child) {
        // Use GoRouter from context to get the active location reliably
        final currentIndex = _locationToTabIndex(GoRouter.of(context).location);
        return Scaffold(
          body: child,
          bottomNavigationBar: BottomNavBar(
            currentIndex: currentIndex,
            // onTap navigates to the corresponding route
            onTap:
                (index) =>
                    GoRouter.of(context).go(BottomNavBar.locations[index]),
          ),
        );
      },
      routes: [
        GoRoute(
          path: '/',
          name: 'home',
          builder: (context, state) => const HomeScreen(),
        ),
        GoRoute(
          path: '/options',
          name: 'options',
          builder: (context, state) => const OptionsScreen(),
        ),
        GoRoute(
          path: '/create',
          name: 'create',
          builder: (context, state) => const PostScreen(),
        ),
        GoRoute(
          path: '/profile',
          name: 'profile',
          builder: (context, state) => const ProfileScreen(),
        ),
        GoRoute(
          path: '/notifications',
          name: 'notifications',
          builder: (context, state) => const NotificationsScreen(),
        ),
      ],
    ),
  ],
);
