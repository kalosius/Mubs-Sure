import 'package:flutter/material.dart';
import '../data/mock_data.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 10),
              Row(
                children: [
                  const CircleAvatar(
                    radius: 36,
                    backgroundColor: Color(0xFF1F2937),
                    child: Icon(Icons.person, size: 40),
                  ),
                  const SizedBox(width: 10),
                  const Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'messychinal',
                          style: TextStyle(
                            fontSize: 33,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                        Text(
                          'Makerere University',
                          style: TextStyle(color: MakerereMockData.softText),
                        ),
                      ],
                    ),
                  ),
                  IconButton(
                    onPressed: () => Navigator.pushNamed(context, '/settings'),
                    icon: const Icon(Icons.settings),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              SizedBox(
                width: double.infinity,
                height: 54,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFEFF1F5),
                    foregroundColor: Colors.black,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  child: const Text(
                    'Edit profile',
                    style: TextStyle(fontSize: 22),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              const Text(
                'Complete your profile to be seen by more people!',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: 10),
              LinearProgressIndicator(
                value: 0.23,
                minHeight: 8,
                backgroundColor: const Color(0xFF273043),
                valueColor: const AlwaysStoppedAnimation(
                  MakerereMockData.brandPink,
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                '23% complete your profile to be seen by more campus matches.',
                style: TextStyle(color: MakerereMockData.softText),
              ),
              const SizedBox(height: 16),
              _todoCard('Add at least 4 photos', '+28%'),
              _todoCard('Add About Me', '+20%'),
              _todoCard('Verify profile', '+8%'),
              const SizedBox(height: 16),
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(18),
                  color: const Color(0xFF151F32),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Mubssure Gold',
                      style: TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      'See who likes you, top picks and more.',
                      style: TextStyle(color: MakerereMockData.softText),
                    ),
                    const SizedBox(height: 10),
                    ElevatedButton(
                      onPressed: () =>
                          Navigator.pushNamed(context, '/settings'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFFFACC15),
                        foregroundColor: Colors.black,
                      ),
                      child: const Text('Upgrade'),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  Widget _todoCard(String title, String gain) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: const Color(0xFF111827),
      ),
      child: Row(
        children: [
          const Icon(Icons.auto_awesome, color: MakerereMockData.brandPink),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              title,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
            ),
          ),
          Text(
            gain,
            style: const TextStyle(
              color: MakerereMockData.brandPink,
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
    );
  }
}
