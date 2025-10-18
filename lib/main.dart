import 'package:flutter/material.dart';
import 'screens/welcome_screen.dart';
import 'screens/signup_screen.dart';
import 'screens/create_profile_screen.dart';
import 'screens/home_tabs.dart';
import 'screens/chat_screen.dart';
import 'screens/settings_screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final primary = const Color(0xFFFF2D7A);
    return MaterialApp(
      title: 'MubsSure',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: primary,
        colorScheme: ColorScheme.fromSeed(seedColor: primary),
        scaffoldBackgroundColor: const Color(0xFFF6F6F8),
        useMaterial3: true,
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: Colors.white.withOpacity(0.95),
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 14,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide.none,
          ),
        ),
      ),
      initialRoute: '/',
      routes: {
        '/': (_) => const WelcomeScreen(),
        '/signup': (_) => const SignUpScreen(),
        '/create_profile': (_) => const CreateProfileScreen(),
        '/home': (_) => const HomeTabs(),
        '/chat': (_) => const ChatScreen(),
        '/settings': (_) => const SettingsScreen(),
      },
    );
  }
}
