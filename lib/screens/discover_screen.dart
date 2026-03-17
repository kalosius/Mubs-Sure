import 'package:flutter/material.dart';
import '../data/mock_data.dart';

class DiscoverScreen extends StatefulWidget {
  const DiscoverScreen({super.key});

  @override
  State<DiscoverScreen> createState() => _DiscoverScreenState();
}

class _DiscoverScreenState extends State<DiscoverScreen> {
  int _index = 0;

  void _nextCard() {
    setState(() {
      _index = (_index + 1) % MakerereMockData.profiles.length;
    });
  }

  @override
  Widget build(BuildContext context) {
    final profile = MakerereMockData.profiles[_index];

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14),
          child: Column(
            children: [
              const SizedBox(height: 6),
              Row(
                children: [
                  const Icon(Icons.favorite, color: MakerereMockData.brandPink),
                  const SizedBox(width: 6),
                  const Text(
                    'mubssure',
                    style: TextStyle(
                      fontSize: 34,
                      fontWeight: FontWeight.w900,
                      color: MakerereMockData.brandPink,
                    ),
                  ),
                  const Spacer(),
                  IconButton(
                    onPressed: () => Navigator.pushNamed(context, '/settings'),
                    icon: const Icon(Icons.tune),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Row(
                children: List.generate(
                  MakerereMockData.profiles.length,
                  (index) => Expanded(
                    child: Container(
                      margin: EdgeInsets.only(
                        right: index == MakerereMockData.profiles.length - 1
                            ? 0
                            : 4,
                      ),
                      height: 4,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: index <= _index
                            ? Colors.white.withValues(alpha: 0.95)
                            : Colors.white.withValues(alpha: 0.3),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 8),
              Expanded(
                child: AnimatedSwitcher(
                  duration: const Duration(milliseconds: 220),
                  transitionBuilder: (child, animation) {
                    return FadeTransition(
                      opacity: animation,
                      child: ScaleTransition(
                        scale: Tween(begin: 0.96, end: 1.0).animate(animation),
                        child: child,
                      ),
                    );
                  },
                  child: Stack(
                    key: ValueKey<int>(_index),
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(24),
                        child: Stack(
                          fit: StackFit.expand,
                          children: [
                            Image.network(
                              profile.imageUrl,
                              fit: BoxFit.cover,
                              errorBuilder: (_, __, ___) =>
                                  Container(color: const Color(0xFF202938)),
                            ),
                            const DecoratedBox(
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                  colors: [
                                    Colors.transparent,
                                    Colors.transparent,
                                    Colors.black87,
                                  ],
                                ),
                              ),
                            ),
                            Positioned(
                              left: 18,
                              right: 18,
                              bottom: 24,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                        '${profile.name}, ${profile.age}',
                                        style: const TextStyle(
                                          fontSize: 42,
                                          fontWeight: FontWeight.w900,
                                          height: 1,
                                        ),
                                      ),
                                      const SizedBox(width: 8),
                                      const Icon(
                                        Icons.verified,
                                        color: Color(0xFF3B82F6),
                                        size: 28,
                                      ),
                                    ],
                                  ),
                                  Text(
                                    '${profile.program} • ${profile.hall}',
                                    style: const TextStyle(
                                      color: Colors.white70,
                                      fontSize: 17,
                                    ),
                                  ),
                                  const SizedBox(height: 8),
                                  Text(
                                    profile.about,
                                    style: const TextStyle(fontSize: 17),
                                  ),
                                  const SizedBox(height: 8),
                                  Wrap(
                                    spacing: 6,
                                    runSpacing: 6,
                                    children: profile.interests
                                        .map(
                                          (e) => Container(
                                            padding: const EdgeInsets.symmetric(
                                              horizontal: 10,
                                              vertical: 6,
                                            ),
                                            decoration: BoxDecoration(
                                              color: Colors.white10,
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                              border: Border.all(
                                                color: Colors.white24,
                                              ),
                                            ),
                                            child: Text(e),
                                          ),
                                        )
                                        .toList(),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Positioned(
                        right: 12,
                        top: 12,
                        child: CircleAvatar(
                          radius: 22,
                          backgroundColor: Colors.black54,
                          child: Text(
                            '${profile.distanceKm}km',
                            style: const TextStyle(fontSize: 12),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _actionButton(
                    Icons.close,
                    const Color(0xFFEC4899),
                    _nextCard,
                  ),
                  const SizedBox(width: 24),
                  _actionButton(
                    Icons.favorite,
                    const Color(0xFF22C55E),
                    _nextCard,
                  ),
                ],
              ),
              const SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }

  Widget _actionButton(IconData icon, Color color, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 84,
        height: 84,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: const Color(0xFF121A2A),
          boxShadow: const [BoxShadow(color: Colors.black38, blurRadius: 12)],
          border: Border.all(color: Colors.white10),
        ),
        child: Icon(icon, color: color, size: 40),
      ),
    );
  }
}
