import 'package:flutter/material.dart';

enum PlanType { basic, premium, vip }

class SubscriptionsScreen extends StatefulWidget {
  const SubscriptionsScreen({super.key});

  @override
  State<SubscriptionsScreen> createState() => _SubscriptionsScreenState();
}

class _SubscriptionsScreenState extends State<SubscriptionsScreen> {
  PlanType _selected = PlanType.basic;

  void _selectPlan(PlanType p) => setState(() => _selected = p);

  Widget _buildPlan({
    required PlanType type,
    required String title,
    required String price,
    required List<String> bullets,
    bool recommended = false,
  }) {
    final bool selected = _selected == type;
    final Color accent = selected ? const Color(0xFFF63D8E) : Colors.white;
    final Color border = selected
        ? const Color(0xFFF63D8E)
        : const Color(0xFFE9E6EA);

    return GestureDetector(
      onTap: () => _selectPlan(type),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        margin: const EdgeInsets.symmetric(vertical: 10),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: accent,
          borderRadius: BorderRadius.circular(14),
          border: Border.all(color: border, width: selected ? 2.2 : 1.0),
          boxShadow: [
            if (selected) BoxShadow(color: Colors.black12, blurRadius: 12),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            title,
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                              color: selected ? Colors.white : Colors.black87,
                            ),
                          ),
                          const SizedBox(width: 8),
                          if (recommended)
                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 10,
                                vertical: 4,
                              ),
                              decoration: BoxDecoration(
                                color: selected
                                    ? Colors.white.withOpacity(0.12)
                                    : const Color(0xFFFF6AA3),
                                borderRadius: BorderRadius.circular(16),
                              ),
                              child: Text(
                                'Recommended',
                                style: TextStyle(
                                  color: selected ? Colors.white : Colors.white,
                                  fontSize: 12,
                                ),
                              ),
                            ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            price,
                            style: TextStyle(
                              fontSize: 28,
                              fontWeight: FontWeight.bold,
                              color: selected ? Colors.white : Colors.black,
                            ),
                          ),
                          const SizedBox(width: 6),
                          Text(
                            '/month',
                            style: TextStyle(
                              color: selected ? Colors.white70 : Colors.black54,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Radio<PlanType>(
                  value: type,
                  groupValue: _selected,
                  activeColor: const Color(0xFFF63D8E),
                  onChanged: (v) => _selectPlan(v!),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Column(
              children: bullets
                  .map(
                    (b) => Padding(
                      padding: const EdgeInsets.symmetric(vertical: 4),
                      child: Row(
                        children: [
                          Icon(
                            Icons.check,
                            color: selected
                                ? Colors.white
                                : const Color(0xFFF63D8E),
                            size: 18,
                          ),
                          const SizedBox(width: 8),
                          Expanded(
                            child: Text(
                              b,
                              style: TextStyle(
                                color: selected ? Colors.white : Colors.black87,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                  .toList(),
            ),
          ],
        ),
      ),
    );
  }

  void _onContinue() {
    final String planName = _selected == PlanType.basic
        ? 'Basic (Free)'
        : _selected == PlanType.premium
        ? 'Premium (\$9.99/mo)'
        : 'VIP (\$19.99/mo)';

    showDialog<void>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Confirm plan'),
        content: Text('Proceed with $planName?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(ctx).pop(),
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFFF63D8E),
            ),
            onPressed: () {
              Navigator.of(ctx).pop();
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('Selected: $planName'),
                  backgroundColor: const Color(0xFFF63D8E),
                ),
              );
            },
            child: const Text('Confirm'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Get Premium'),
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: Colors.black,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 12),
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 520),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // Illustration / hero
                Container(
                  height: 160,
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [Color(0xFFFFEAF3), Color(0xFFFFE7F0)],
                    ),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Center(
                    child: Icon(
                      Icons.star_border,
                      size: 72,
                      color: Color(0xFFF63D8E),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                const Text(
                  'Unlock premium features',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.w800),
                ),
                const SizedBox(height: 8),
                const Text(
                  'Upgrade to Premium to get more matches, advanced filters, priority support, and exclusive perks.',
                  style: TextStyle(color: Colors.black54, fontSize: 14),
                ),
                const SizedBox(height: 18),

                // Plans
                _buildPlan(
                  type: PlanType.basic,
                  title: 'Basic',
                  price: 'Free',
                  bullets: [
                    'Basic features',
                    'Limited swipes',
                    'Standard profile',
                  ],
                ),

                _buildPlan(
                  type: PlanType.premium,
                  title: 'Premium',
                  price: '\$9.99',
                  recommended: true,
                  bullets: [
                    'All basic features',
                    'Unlimited swipes',
                    'Advanced filters',
                    'Priority support',
                  ],
                ),

                _buildPlan(
                  type: PlanType.vip,
                  title: 'VIP',
                  price: '\$19.99',
                  bullets: [
                    'All premium features',
                    'Exclusive events',
                    'Personalized matchmaking',
                  ],
                ),

                const SizedBox(height: 18),

                // Legal / small print
                const Text(
                  'Subscriptions auto-renew unless canceled. Prices shown in USD. Manage subscriptions in your account settings.',
                  style: TextStyle(color: Colors.black45, fontSize: 12),
                ),
                const SizedBox(height: 12),

                Row(
                  children: [
                    Expanded(
                      child: OutlinedButton(
                        onPressed: () => _selectPlan(PlanType.basic),
                        child: const Text('Restore'),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      flex: 2,
                      child: ElevatedButton(
                        onPressed: _onContinue,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFFF63D8E),
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        child: Text(
                          _selected == PlanType.basic
                              ? 'Continue'
                              : 'Continue - ${_selected == PlanType.premium ? '\$9.99/mo' : '\$19.99/mo'}',
                          style: const TextStyle(
                            fontSize: 16,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 30),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
