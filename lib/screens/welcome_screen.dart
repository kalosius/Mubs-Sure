import 'package:flutter/material.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Color(0xFFFF3B62), Color(0xFFFF5B3A), Color(0xFFFF2F6D)],
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Spacer(flex: 2),
                Center(
                  child: Container(
                    width: 76,
                    height: 76,
                    decoration: BoxDecoration(
                      color: Colors.white.withValues(alpha: 0.2),
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: Colors.white30),
                    ),
                    child: const Icon(Icons.local_fire_department, size: 42),
                  ),
                ),
                const SizedBox(height: 14),
                const Center(
                  child: Text(
                    'mubssure',
                    style: TextStyle(
                      fontSize: 48,
                      height: 1,
                      fontWeight: FontWeight.w900,
                      letterSpacing: -1.5,
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                const Center(
                  child: Text(
                    'Makerere students only',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                const SizedBox(height: 36),
                _AuthButton(
                  text: 'Continue with Google',
                  backgroundColor: Colors.white,
                  textColor: Colors.black,
                  leading: const Icon(Icons.g_mobiledata, size: 34),
                  onTap: () => Navigator.pushNamed(context, '/signup'),
                ),
                const SizedBox(height: 12),
                _AuthButton(
                  text: 'Continue with phone number',
                  backgroundColor: Colors.white,
                  textColor: Colors.black,
                  leading: const Icon(Icons.phone_outlined),
                  onTap: () => Navigator.pushNamed(context, '/signup'),
                ),
                const SizedBox(height: 18),
                TextButton(
                  onPressed: () => Navigator.pushNamed(context, '/signup'),
                  child: const Text(
                    'Trouble signing in?',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                const Spacer(flex: 2),
                const Text(
                  'By tapping Continue, you agree to our Terms. We keep discovery on-campus around Makerere and nearby student zones.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 18),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _AuthButton extends StatelessWidget {
  final String text;
  final Widget leading;
  final Color backgroundColor;
  final Color textColor;
  final VoidCallback onTap;

  const _AuthButton({
    required this.text,
    required this.leading,
    required this.backgroundColor,
    required this.textColor,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final ButtonStyle style = ElevatedButton.styleFrom(
      backgroundColor: backgroundColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(28),
        side: BorderSide.none,
      ),
      padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 16),
    );

    return SizedBox(
      width: double.infinity,
      height: 52,
      child: ElevatedButton(
        onPressed: onTap,
        style: style,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            leading,
            const SizedBox(width: 12),
            Text(text, style: TextStyle(color: textColor)),
          ],
        ),
      ),
    );
  }
}
