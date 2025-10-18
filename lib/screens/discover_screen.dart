import 'package:flutter/material.dart';
import '../widgets/profile_card.dart';

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
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: const [
            ProfileCard(name: 'Ethan', age: 28, job: 'Software Engineer'),
          ],
        ),
      ),
    );
  }
}
