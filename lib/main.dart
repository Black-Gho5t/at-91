import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'router/app_router.dart';
import 'services/auth_service.dart';
import 'utils/colors.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  final authService = AuthService();
  // Wait for the first Firebase auth state event so we can decide the
  // router's initial location. Use a short timeout to avoid blocking
  // app startup indefinitely if the platform doesn't deliver an event
  // quickly (rare but possible in some environments).
  try {
    await authService.ready.timeout(const Duration(seconds: 3));
  } catch (_) {
    // Timeout: proceed anyway. The router will still react to
    // auth state changes because AuthService is a ChangeNotifier.
  }

  runApp(MyApp(authService: authService));
}

// runApp(const MyApp());

class MyApp extends StatelessWidget {
  final AuthService authService;

  const MyApp({super.key, required this.authService});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: authService,
      child: MaterialApp.router(
        title: 'Social Feed App',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          brightness: Brightness.dark,
          scaffoldBackgroundColor: AppColors.backgroundColor,
          appBarTheme: const AppBarTheme(
            backgroundColor: AppColors.backgroundColor,
            elevation: 0,
            foregroundColor: AppColors.textColor,
          ),
          textTheme: const TextTheme(
            bodyLarge: TextStyle(color: AppColors.textColor),
            bodyMedium: TextStyle(color: AppColors.textColor),
            titleLarge: TextStyle(color: AppColors.textColor),
          ),
          iconTheme: const IconThemeData(color: AppColors.iconColor),
        ),
        routerConfig: AppRouter.createRouter(authService),
      ),
    );
  }
}
