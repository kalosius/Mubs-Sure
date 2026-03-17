import 'package:flutter/material.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _emailCtrl = TextEditingController();
  final _passCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    const pageBg = Color(0xFFFBF5F8);
    const inputBg = Color(0xFFF7D6E6);
    const primaryPink = Color(0xFFF63D8E);

    return Scaffold(
      backgroundColor: pageBg,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: Colors.black,
        centerTitle: true,
        title: const Text(
          'Sign up',
          style: TextStyle(fontWeight: FontWeight.w600),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.maybePop(context),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          children: [
            const SizedBox(height: 12),
            _ColoredTextField(
              controller: _emailCtrl,
              hint: 'Email or phone number',
              background: inputBg,
            ),
            const SizedBox(height: 12),
            _ColoredTextField(
              controller: _passCtrl,
              hint: 'Password',
              background: inputBg,
              obscure: true,
            ),
            const Spacer(),

            // Continue button
            SizedBox(
              width: double.infinity,
              height: 56,
              child: ElevatedButton(
                onPressed: () =>
                    Navigator.pushNamed(context, '/create_profile'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: primaryPink,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(28),
                  ),
                ),
                child: const Text(
                  'Continue',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
              ),
            ),

            const SizedBox(height: 12),
            // Bottom small text
            Padding(
              padding: const EdgeInsets.only(bottom: 24.0, top: 6.0),
              child: Center(
                child: Wrap(
                  alignment: WrapAlignment.center,
                  children: [
                    const Text(
                      'By continuing, you agree to our Terms. Learn how we collect, use and share your data in our ',
                      style: TextStyle(fontSize: 11, color: Colors.black54),
                    ),
                    TextButton(
                      onPressed: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Cookies Policy')),
                        );
                      },
                      style: TextButton.styleFrom(
                        padding: EdgeInsets.zero,
                        minimumSize: const Size(0, 0),
                        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      ),
                      child: const Text(
                        'Cookies Policy',
                        style: TextStyle(fontSize: 11, color: primaryPink),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ColoredTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hint;
  final Color background;
  final bool obscure;

  const _ColoredTextField({
    super.key,
    required this.controller,
    required this.hint,
    required this.background,
    this.obscure = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: background,
        borderRadius: BorderRadius.circular(6),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: TextField(
        controller: controller,
        obscureText: obscure,
        decoration: InputDecoration(hintText: hint, border: InputBorder.none),
      ),
    );
  }
}
