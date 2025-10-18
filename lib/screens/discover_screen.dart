import 'package:flutter/material.dart';
import '../widgets/profile_card.dart';
import 'settings_screen.dart';

class DiscoverScreen extends StatelessWidget {
  const DiscoverScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Discover'),
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: Colors.black,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.menu, color: Colors.black),
          onPressed: () {
            // open side menu placeholder
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(const SnackBar(content: Text('Open side menu')));
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings, color: Colors.black),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const SettingsScreen()),
              );
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Stack(
                alignment: Alignment.center,
                children: [
                  // constrain width so card scales on smaller devices
                  ConstrainedBox(
                    constraints: const BoxConstraints(maxWidth: 360),
                    child: const ProfileCard(
                      name: 'Ethan',
                      age: 28,
                      job: 'Software Engineer',
                      about:
                          'I love hiking, coding, and exploring new cities. Looking for someone adventurous and kind.',
                    ),
                  ),

                  // overlay action buttons near bottom of card
                  Positioned(
                    bottom: 24,
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        // dismiss button
                        Container(
                          width: 64,
                          height: 64,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(32),
                            boxShadow: [
                              BoxShadow(color: Colors.black12, blurRadius: 6),
                            ],
                          ),
                          child: IconButton(
                            icon: const Icon(Icons.clear, color: Colors.pink),
                            onPressed: () {},
                          ),
                        ),
                        const SizedBox(width: 24),
                        // like button
                        Container(
                          width: 64,
                          height: 64,
                          decoration: BoxDecoration(
                            color: Color(0xFFF63D8E),
                            borderRadius: BorderRadius.circular(32),
                            boxShadow: [
                              BoxShadow(color: Colors.black12, blurRadius: 6),
                            ],
                          ),
                          child: IconButton(
                            icon: const Icon(
                              Icons.favorite,
                              color: Colors.white,
                            ),
                            onPressed: () {},
                          ),
                        ),
                      ],
                    ),
                  ),

                  // message icon at top-right corner of card
                  Positioned(
                    top: 12,
                    right: 24,
                    child: Container(
                      width: 44,
                      height: 44,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: [
                          BoxShadow(color: Colors.black12, blurRadius: 6),
                        ],
                      ),
                      child: IconButton(
                        icon: const Icon(Icons.message, color: Colors.pink),
                        onPressed: () {},
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
