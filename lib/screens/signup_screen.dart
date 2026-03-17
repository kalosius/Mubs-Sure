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
            const SizedBox(height: 14),
            Text(
              _otpSent ? 'Enter your code' : 'Can we get your number?',
              style: const TextStyle(
                fontSize: 44,
                fontWeight: FontWeight.w800,
                height: 1.05,
              ),
            ),
            const SizedBox(height: 18),
            AnimatedSwitcher(
              duration: const Duration(milliseconds: 260),
              transitionBuilder: (child, animation) {
                return FadeTransition(
                  opacity: animation,
                  child: SlideTransition(
                    position: Tween<Offset>(
                      begin: const Offset(0.04, 0),
                      end: Offset.zero,
                    ).animate(animation),
                    child: child,
                  ),
                );
              },
              child: _otpSent
                  ? Column(
                      key: const ValueKey('otp'),
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          _phoneCtrl.text.isEmpty
                              ? '+256 000 000000'
                              : '+256 ${_phoneCtrl.text}',
                          style: const TextStyle(
                            fontSize: 30,
                            color: MakerereMockData.softText,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(height: 16),
                        TextField(
                          controller: _codeCtrl,
                          keyboardType: TextInputType.number,
                          maxLength: 6,
                          style: const TextStyle(
                            fontSize: 42,
                            letterSpacing: 16,
                            fontWeight: FontWeight.w700,
                          ),
                          decoration: const InputDecoration(
                            counterText: '',
                            hintText: '------',
                            filled: false,
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Color(0xFF465066)),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: MakerereMockData.brandPink,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 8),
                        const Text(
                          'Did not get anything? No worries, let us try again.',
                          style: TextStyle(
                            color: MakerereMockData.softText,
                            fontSize: 16,
                          ),
                        ),
                        TextButton(
                          onPressed: () {},
                          child: const Text('Resend'),
                        ),
                      ],
                    )
                  : Column(
                      key: const ValueKey('phone'),
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            const Text(
                              'UG +256',
                              style: TextStyle(
                                fontSize: 36,
                                fontWeight: FontWeight.w500,
                                color: MakerereMockData.softText,
                              ),
                            ),
                            const SizedBox(width: 12),
                            Expanded(
                              child: TextField(
                                controller: _phoneCtrl,
                                keyboardType: TextInputType.phone,
                                decoration: const InputDecoration(
                                  hintText: 'Phone number',
                                  filled: false,
                                  enabledBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color(0xFF465066),
                                    ),
                                  ),
                                  focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      color: MakerereMockData.brandPink,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 16),
                        const Text(
                          'We will text you a code to verify you are really you. Message and data rates may apply.',
                          style: TextStyle(
                            color: MakerereMockData.softText,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
            ),
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
                  backgroundColor: _otpSent
                      ? const Color(0xFFF4F5F7)
                      : const Color(0xFF394255),
                  foregroundColor: _otpSent ? Colors.black : Colors.white54,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                child: Text(
                  _otpSent ? 'Next' : 'Continue',
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
