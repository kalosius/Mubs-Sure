import 'package:flutter/material.dart';
import 'screens/welcome_screen.dart';
import 'screens/signup_screen.dart';
import 'screens/create_profile_screen.dart';
import 'screens/home_tabs.dart';
import 'screens/chat_screen.dart';
import 'screens/settings_screen.dart';
import 'data/mock_data.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    const primary = MakerereMockData.brandPink;
    return MaterialApp(
      title: 'MubsSure',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: primary,
        colorScheme: const ColorScheme.dark(
          primary: MakerereMockData.brandPink,
          secondary: MakerereMockData.brandOrange,
          surface: MakerereMockData.appBackground,
        ),
        scaffoldBackgroundColor: MakerereMockData.appBackground,
        useMaterial3: true,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.transparent,
          foregroundColor: Colors.white,
          centerTitle: false,
          elevation: 0,
        ),
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: const Color(0xFF141C2B),
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 14,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(14),
            borderSide: BorderSide.none,
          ),
          hintStyle: const TextStyle(color: MakerereMockData.softText),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: primary,
            foregroundColor: Colors.white,
            textStyle: const TextStyle(fontWeight: FontWeight.w700),
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
