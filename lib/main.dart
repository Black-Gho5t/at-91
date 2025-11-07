import 'package:flutter/material.dart';
import 'screens/homeScreen.dart';
import 'utils/colors.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Social Feed App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark, // Tema oscuro
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
      home: const HomeScreen(),
    );
  }
}
