import 'package:flutter/material.dart';
import '../data/mock_data.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _phoneCtrl = TextEditingController();
  final _codeCtrl = TextEditingController();
  bool _otpSent = false;

  @override
  void dispose() {
    _phoneCtrl.dispose();
    _codeCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MakerereMockData.appBackground,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.maybePop(context),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            Text(
              _otpSent ? 'Enter your code' : 'Can we get your number?',
              style: const TextStyle(fontSize: 38, fontWeight: FontWeight.w800),
            ),
            const SizedBox(height: 20),
            if (!_otpSent) ...[
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 14,
                      vertical: 12,
                    ),
                    decoration: BoxDecoration(
                      color: const Color(0xFF111827),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const Text('UG +256'),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: TextField(
                      controller: _phoneCtrl,
                      keyboardType: TextInputType.phone,
                      decoration: const InputDecoration(
                        hintText: 'Phone number',
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 14),
              const Text(
                'We will text you a code to verify you are really you. Message and data rates may apply.',
                style: TextStyle(
                  color: MakerereMockData.softText,
                  fontSize: 16,
                ),
              ),
            ] else ...[
              Text(
                _phoneCtrl.text.isEmpty
                    ? '+256 000 000000'
                    : '+256 ${_phoneCtrl.text}',
                style: const TextStyle(
                  fontSize: 26,
                  color: MakerereMockData.softText,
                ),
              ),
              const SizedBox(height: 16),
              TextField(
                controller: _codeCtrl,
                keyboardType: TextInputType.number,
                maxLength: 6,
                style: const TextStyle(
                  fontSize: 34,
                  letterSpacing: 14,
                  fontWeight: FontWeight.w700,
                ),
                decoration: const InputDecoration(
                  counterText: '',
                  hintText: '------',
                ),
              ),
              const SizedBox(height: 8),
              TextButton(onPressed: () {}, child: const Text('Resend')),
            ],
            const Spacer(),
            SizedBox(
              width: double.infinity,
              height: 58,
              child: ElevatedButton(
                onPressed: () {
                  if (!_otpSent) {
                    if (_phoneCtrl.text.trim().length < 9) return;
                    setState(() => _otpSent = true);
                    return;
                  }
                  if (_codeCtrl.text.trim().length < 6) return;
                  Navigator.pushNamed(context, '/create_profile');
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFEEF0F4),
                  foregroundColor: Colors.black,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                child: Text(
                  _otpSent ? 'Next' : 'Send code',
                  style: const TextStyle(fontSize: 22),
                ),
              ),
            ),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}
