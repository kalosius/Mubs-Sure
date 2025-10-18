import 'package:flutter/material.dart';

class MessagesScreen extends StatelessWidget {
  const MessagesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final conversations = [
      {
        'name': 'Sophia',
        'text': 'Hey! How\'s your day going?',
        'time': '10:42 AM',
      },
      {
        'name': 'Ethan',
        'text': 'I\'m free tonight, wanna grab a drink?',
        'time': 'Yesterday',
      },
      {
        'name': 'Olivia',
        'text': 'Just got back from my trip, let\'s catch up!',
        'time': '2d ago',
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Messages'),
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: Colors.black,
      ),
      body: ListView.separated(
        itemCount: conversations.length,
        separatorBuilder: (_, __) => const Divider(height: 1),
        itemBuilder: (context, i) {
          final c = conversations[i];
          return ListTile(
            leading: CircleAvatar(child: Text(c['name']![0])),
            title: Text(c['name']!),
            subtitle: Text(c['text']!),
            trailing: Text(c['time']!),
            onTap: () => Navigator.pushNamed(context, '/chat'),
          );
        },
      ),
    );
  }
}
