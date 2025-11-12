import 'package:at_91_f/screens/login_screen.dart';
import 'package:at_91_f/services/auth_service.dart';
import 'package:at_91_f/screens/homeScreen.dart';
import 'package:at_91_f/screens/register_screen.dart';
import 'package:at_91_f/screens/subPages/ProfileScreen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:at_91_f/widgets/bottom_nav.dart';
import '../screens/subPages/postScreen.dart';
import '../screens/subPages/notificationsScreen.dart';
import '../screens/subPages/optionsScreen.dart';

class AppRouter {
  /// Create a GoRouter using the provided [authService]. This ensures
  /// the router and the rest of the app share the same auth instance.
  static GoRouter createRouter(AuthService authService) {
    return GoRouter(
      refreshListenable: authService,
      // Ensure the router starts on the correct initial location based on
      // the cached Firebase user. This makes the app not show the login
      // screen briefly when the user is already signed in.
      initialLocation: authService.isAuthenticated ? '/home' : '/',
      routes: [
        // Public routes
        GoRoute(
          path: '/',
          builder: (context, state) => LoginScreen(authService: authService),
        ),
        GoRoute(
          path: '/register',
          builder: (context, state) => RegisterScreen(authService: authService),
        ),

        // ShellRoute provides a common Scaffold (with BottomNavBar) for the main app pages
        ShellRoute(
          builder: (context, state, child) {
            // compute current index based on current location (use state's uri.path)
            final loc = state.uri.path;
            final idx = BottomNavBar.locations.indexWhere((l) => l == loc);
            final currentIndex = idx < 0 ? 0 : idx;
            return Scaffold(
              body: child,
              bottomNavigationBar: BottomNavBar(
                currentIndex: currentIndex,
                onTap: (i) {
                  final dest = BottomNavBar.locations[i];
                  // navigate to destination; GoRouter ignores if already at the same route
                  GoRouter.of(context).go(dest);
                },
              ),
            );
          },
          routes: [
            GoRoute(
              path: '/home',
              pageBuilder:
                  (context, state) =>
                      NoTransitionPage(child: const HomeScreen()),
              redirect: (context, state) {
                if (!authService.isAuthenticated) return '/';
                return null;
              },
            ),
            GoRoute(
              path: '/profile',
              pageBuilder:
                  (context, state) =>
                      NoTransitionPage(child: const ProfileScreen()),
              redirect: (context, state) {
                if (!authService.isAuthenticated) return '/';
                return null;
              },
            ),
            GoRoute(
              path: '/create',
              name: 'create',
              pageBuilder:
                  (context, state) =>
                      NoTransitionPage(child: const PostScreen()),
            ),
            GoRoute(
              path: '/notifications',
              name: 'notifications',
              pageBuilder:
                  (context, state) =>
                      NoTransitionPage(child: const NotificationsScreen()),
            ),
            GoRoute(
              path: '/options',
              name: 'options',
              pageBuilder:
                  (context, state) =>
                      NoTransitionPage(child: const OptionsScreen()),
            ),
          ],
        ),
      ],
    );
  }
}
