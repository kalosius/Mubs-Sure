import 'package:flutter/material.dart';
import '../data/mock_data.dart';

class ExploreScreen extends StatelessWidget {
  const ExploreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cards = <_ExploreCardData>[
      const _ExploreCardData(
        'Short-term fun',
        'Goal-driven dating',
        Color(0xFF7A123A),
      ),
      const _ExploreCardData(
        'Long-term partner',
        'People seeking serious relationships',
        Color(0xFF92321E),
      ),
      const _ExploreCardData(
        'Study buddy',
        'Library and revision partner vibes',
        Color(0xFF2D3561),
      ),
      const _ExploreCardData(
        'Serious dater',
        'Intentional campus matches',
        Color(0xFF8A6B10),
      ),
    ];

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 4),
              const Text(
                'mubssure',
                style: TextStyle(
                  fontSize: 42,
                  fontWeight: FontWeight.w900,
                  color: MakerereMockData.brandPink,
                ),
              ),
              const SizedBox(height: 2),
              const Text(
                'Top picks around Makerere',
                style: TextStyle(
                  color: MakerereMockData.softText,
                  fontSize: 16,
                ),
              ),
              const SizedBox(height: 14),
              Expanded(
                child: GridView.builder(
                  itemCount: cards.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    childAspectRatio: 0.8,
                  ),
                  itemBuilder: (context, index) {
                    final item = cards[index];
                    return Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(18),
                        gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [item.color, const Color(0xFF0F1525)],
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            item.title,
                            style: const TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            item.subtitle,
                            style: const TextStyle(color: Colors.white70),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _ExploreCardData {
  final String title;
  final String subtitle;
  final Color color;

  const _ExploreCardData(this.title, this.subtitle, this.color);
}
