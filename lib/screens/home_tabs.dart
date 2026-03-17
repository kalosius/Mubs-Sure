import 'package:flutter/material.dart';
import 'discover_screen.dart';
import 'explore_screen.dart';
import 'likes_screen.dart';
import 'messages_screen.dart';
import 'profile_screen.dart';

class HomeTabs extends StatefulWidget {
  const HomeTabs({super.key});

  @override
  State<HomeTabs> createState() => _HomeTabsState();
}

class _HomeTabsState extends State<HomeTabs> {
  int _idx = 0;
  final pages = const [
    DiscoverScreen(),
    ExploreScreen(),
    LikesScreen(),
    MessagesScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[_idx],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: const Color(0xFF090E1B),
        selectedItemColor: const Color(0xFFFF2F6D),
        unselectedItemColor: const Color(0xFF7E8798),
        selectedLabelStyle: const TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w700,
          letterSpacing: 0.1,
        ),
        unselectedLabelStyle: const TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w500,
        ),
        elevation: 0,
        type: BottomNavigationBarType.fixed,
        currentIndex: _idx,
        onTap: (i) => setState(() => _idx = i),
        items: [
          BottomNavigationBarItem(
            icon: ImageIcon(AssetImage('assets/images/logo.png')),
            label: 'Swipe',
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.explore_outlined),
            label: 'Explore',
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.favorite_border),
            label: 'Likes',
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.chat_bubble_outline),
            label: 'Chat',
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
