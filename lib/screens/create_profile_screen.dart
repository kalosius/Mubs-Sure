import 'package:flutter/material.dart';

class CreateProfileScreen extends StatelessWidget {
  const CreateProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    const pageBg = Color(0xFFFBF5F8);
    const primaryPink = Color(0xFFF63D8E);
    const placeholderPink = Color(0xFFF7D6E6);

    return Scaffold(
      backgroundColor: pageBg,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: Colors.black,
        title: const Text(
          'Create Profile',
          style: TextStyle(fontWeight: FontWeight.w600),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.maybePop(context),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 8),

            // progress dots
            Center(
              child: Padding(
                padding: const EdgeInsets.only(bottom: 12.0),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    _progressDot(active: true, color: primaryPink),
                    const SizedBox(width: 8),
                    _progressDot(active: false),
                    const SizedBox(width: 8),
                    _progressDot(active: false),
                    const SizedBox(width: 8),
                    _progressDot(active: false),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 4),
            const Text(
              'Add Photos',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const Text(
              'Showcase your best self with at least 2 photos.\nMore photos increase your chances of finding a match.',
              style: TextStyle(color: Colors.black54),
            ),
            const SizedBox(height: 16),

            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                childAspectRatio: 1,
                physics: const BouncingScrollPhysics(),
                children: [
                  // Two sample image cards (rounded with soft shadow)
                  _imageCard(
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black12,
                            blurRadius: 12,
                            offset: Offset(0, 6),
                          ),
                        ],
                      ),
                      child: const Center(
                        child: Text(
                          'Image 1',
                          style: TextStyle(color: Colors.black26),
                        ),
                      ),
                    ),
                  ),
                  _imageCard(
                    child: Container(
                      decoration: BoxDecoration(
                        color: Color(0xFFF1E9E2),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: const Center(
                        child: Text(
                          'Image 2',
                          style: TextStyle(color: Colors.black26),
                        ),
                      ),
                    ),
                  ),

                  // four pink placeholders with plus icons
                  for (int i = 0; i < 4; i++)
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                        decoration: BoxDecoration(
                          color: placeholderPink,
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: const Center(
                          child: Icon(
                            Icons.add_circle,
                            color: Color(0xFFF63D8E),
                            size: 36,
                          ),
                        ),
                      ),
                    ),
                ],
              ),
            ),

            // Next button
            SizedBox(
              width: double.infinity,
              height: 48,
              child: ElevatedButton(
                onPressed: () => Navigator.pushNamed(context, '/home'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: primaryPink,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(24),
                  ),
                ),
                child: const Text(
                  'Next',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 12),
          ],
        ),
      ),
    );
  }
}

Widget _progressDot({bool active = false, Color color = Colors.grey}) {
  return Container(
    width: active ? 34 : 22,
    height: 8,
    decoration: BoxDecoration(
      color: active ? color : Colors.grey.shade300,
      borderRadius: BorderRadius.circular(8),
    ),
  );
}

Widget _imageCard({required Widget child}) {
  return Container(
    decoration: BoxDecoration(borderRadius: BorderRadius.circular(16)),
    child: child,
  );
}
