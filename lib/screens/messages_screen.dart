import 'package:flutter/material.dart';

class MessagesScreen extends StatelessWidget {
  const MessagesScreen({Key? key}) : super(key: key);

  // example avatar image links you can replace later
  static const exampleAvatars = [
    'https://i.pravatar.cc/150?img=47', // Sophia
    'https://i.pravatar.cc/150?img=12', // Ethan
    'https://i.pravatar.cc/150?img=5', // Olivia
    'https://i.pravatar.cc/150?img=3', // Noah
    'https://i.pravatar.cc/150?img=20', // Ava
  ];

  @override
  Widget build(BuildContext context) {
    final conversations = [
      {
        'name': 'Sophia',
        'text': 'Hey! How\'s your day going?',
        'time': '10:42 AM',
        'avatar': exampleAvatars[0],
        'online': true,
        'unread': 0,
      },
      {
        'name': 'Ethan',
        'text': 'I\'m free tonight, wanna grab a drink?',
        'time': 'Yesterday',
        'avatar': exampleAvatars[1],
        'online': false,
        'unread': 0,
      },
      {
        'name': 'Olivia',
        'text': 'Just got back from my trip, let\'s catch up!',
        'time': 'Yesterday',
        'avatar': exampleAvatars[2],
        'online': false,
        'unread': 2,
      },
      {
        'name': 'Noah',
        'text': 'How was the concert last night?',
        'time': '3d ago',
        'avatar': exampleAvatars[3],
        'online': false,
        'unread': 0,
      },
      {
        'name': 'Ava',
        'text': 'I\'m at the park, come join me!',
        'time': '5d ago',
        'avatar': exampleAvatars[4],
        'online': true,
        'unread': 0,
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Messages'),
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: Colors.black,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.maybePop(context),
        ),
      ),
      body: Column(
        children: [
          const SizedBox(height: 12),
          // search bar
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Container(
              height: 44,
              decoration: BoxDecoration(
                color: Color(0xFFF7D6E6),
                borderRadius: BorderRadius.circular(22),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Row(
                children: const [
                  Icon(Icons.search, color: Colors.pink),
                  SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      'Search Matches',
                      style: TextStyle(color: Colors.black54),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 12),
          Expanded(
            child: ListView.separated(
              itemCount: conversations.length,
              separatorBuilder: (_, __) => const Divider(height: 1),
              itemBuilder: (context, i) {
                final c = conversations[i];
                final unread = c['unread'] as int;
                final highlight = unread > 0;
                return Container(
                  color: highlight
                      ? const Color(0xFFFDEFF5)
                      : Colors.transparent,
                  child: ListTile(
                    leading: Stack(
                      children: [
                        CircleAvatar(
                          radius: 24,
                          backgroundImage: NetworkImage(c['avatar'] as String),
                        ),
                        if (c['online'] as bool)
                          Positioned(
                            bottom: 0,
                            right: 0,
                            child: Container(
                              width: 10,
                              height: 10,
                              decoration: BoxDecoration(
                                color: Colors.green,
                                shape: BoxShape.circle,
                                border: Border.all(
                                  color: Colors.white,
                                  width: 2,
                                ),
                              ),
                            ),
                          ),
                      ],
                    ),
                    title: Text(c['name'] as String),
                    subtitle: Text(
                      c['text'] as String,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    trailing: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          c['time'] as String,
                          style: const TextStyle(
                            color: Colors.black38,
                            fontSize: 12,
                          ),
                        ),
                        const SizedBox(height: 6),
                        if (unread > 0)
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 8,
                              vertical: 4,
                            ),
                            decoration: BoxDecoration(
                              color: const Color(0xFFF63D8E),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Text(
                              unread.toString(),
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                              ),
                            ),
                          ),
                      ],
                    ),
                    onTap: () => Navigator.pushNamed(context, '/chat'),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
