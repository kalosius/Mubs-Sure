import 'package:flutter/material.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Colors taken to visually match the provided mockup
    const backgroundPink = Color(0xFFFBF5F8);
    const titlePink = Color(0xFFF63D8E);
    const emailButtonPink = Color(0xFFF7D6E6);
    const facebookBlue = Color(0xFF1877F2);

    return Scaffold(
      backgroundColor: backgroundPink,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 28.0),
          child: Column(
            children: [
              const Spacer(flex: 2),
              SizedBox(
                width: 88,
                height: 88,
                child: Image.asset(
                  'assets/images/logotransparent for icon.png',
                  fit: BoxFit.contain,
                ),
              ),
              const SizedBox(height: 14),
              Text(
                'MubsSure',
                style: const TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                  color: titlePink,
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                'Find your perfect match today',
                style: TextStyle(color: Colors.black54),
              ),
              const SizedBox(height: 40),

              // Buttons column
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  _AuthButton(
                    text: 'Continue with email',
                    backgroundColor: emailButtonPink,
                    textColor: Colors.black87,
                    leading: const Icon(
                      Icons.mail_outline,
                      color: Colors.black87,
                    ),
                    onTap: () => Navigator.pushNamed(context, '/signup'),
                  ),
                  const SizedBox(height: 12),
                  _AuthButton(
                    text: 'Continue with Google',
                    backgroundColor: Colors.white,
                    textColor: Colors.black87,
                    leading: const Icon(
                      Icons.g_mobiledata,
                      color: Colors.black54,
                    ),
                    border: BorderSide(color: Colors.grey.shade300),
                    onTap: () => Navigator.pushNamed(context, '/home'),
                  ),
                  const SizedBox(height: 12),
                  _AuthButton(
                    text: 'Continue with Apple',
                    backgroundColor: Colors.black,
                    textColor: Colors.white,
                    leading: const Icon(Icons.apple, color: Colors.white),
                    onTap: () => Navigator.pushNamed(context, '/home'),
                  ),
                  const SizedBox(height: 12),
                  _AuthButton(
                    text: 'Continue with Facebook',
                    backgroundColor: facebookBlue,
                    textColor: Colors.white,
                    leading: const Icon(Icons.facebook, color: Colors.white),
                    onTap: () => Navigator.pushNamed(context, '/home'),
                  ),
                ],
              ),

              const Spacer(flex: 3),

              // Bottom sentence with link-style buttons
              Padding(
                padding: const EdgeInsets.only(bottom: 16.0),
                child: Center(
                  child: Wrap(
                    alignment: WrapAlignment.center,
                    crossAxisAlignment: WrapCrossAlignment.center,
                    children: [
                      const Text(
                        'By continuing, you agree to our ',
                        style: TextStyle(color: Colors.black54, fontSize: 12),
                      ),
                      TextButton(
                        onPressed: () {
                          // placeholder action - keep inline link styling
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('Terms of Service')),
                          );
                        },
                        style: TextButton.styleFrom(
                          padding: EdgeInsets.zero,
                          minimumSize: const Size(0, 0),
                          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        ),
                        child: const Text(
                          'Terms of Service',
                          style: TextStyle(color: titlePink, fontSize: 12),
                        ),
                      ),
                      const Text(
                        ' and ',
                        style: TextStyle(color: Colors.black54, fontSize: 12),
                      ),
                      TextButton(
                        onPressed: () {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('Privacy Policy')),
                          );
                        },
                        style: TextButton.styleFrom(
                          padding: EdgeInsets.zero,
                          minimumSize: const Size(0, 0),
                          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        ),
                        child: const Text(
                          'Privacy Policy',
                          style: TextStyle(color: titlePink, fontSize: 12),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
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
  final BorderSide? border;
  final VoidCallback onTap;

  const _AuthButton({
    super.key,
    required this.text,
    required this.leading,
    required this.backgroundColor,
    required this.textColor,
    this.border,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final ButtonStyle style = ElevatedButton.styleFrom(
      backgroundColor: backgroundColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(24),
        side: border ?? BorderSide.none,
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
