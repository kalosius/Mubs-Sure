import 'package:flutter/material.dart';
import '../data/mock_data.dart';

class MessagesScreen extends StatelessWidget {
  const MessagesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 10),
              Row(
                children: [
                  Image.asset(
                    'assets/images/logo.png',
                    width: 30,
                    height: 30,
                    fit: BoxFit.contain,
                  ),
                  const SizedBox(width: 8),
                  const Text(
                    'mubssure',
                    style: TextStyle(
                      fontSize: 38,
                      fontWeight: FontWeight.w900,
                      color: MakerereMockData.brandPink,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 2),
              const Text(
                'Search your campus matches',
                style: TextStyle(
                  color: MakerereMockData.softText,
                  fontSize: 15,
                ),
              ),
              const SizedBox(height: 10),
              Container(
                decoration: BoxDecoration(
                  color: const Color(0xFF111827),
                  borderRadius: BorderRadius.circular(24),
                  border: Border.all(color: const Color(0xFF1F2937)),
                ),
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: const TextField(
                  decoration: InputDecoration(
                    icon: Icon(Icons.search, color: MakerereMockData.softText),
                    hintText: 'Search matches',
                    border: InputBorder.none,
                  ),
                ),
              ),
              const SizedBox(height: 12),
              Expanded(
                child: ListView.separated(
                  itemCount: MakerereMockData.chats.length,
                  separatorBuilder: (_, __) =>
                      const Divider(color: Color(0xFF1F2937), height: 1),
                  itemBuilder: (context, i) {
                    final chat = MakerereMockData.chats[i];
                    return ListTile(
                      contentPadding: const EdgeInsets.symmetric(vertical: 10),
                      onTap: () => Navigator.pushNamed(context, '/chat'),
                      leading: Stack(
                        children: [
                          CircleAvatar(
                            radius: 28,
                            backgroundImage: NetworkImage(chat.avatarUrl),
                          ),
                          if (chat.online)
                            Positioned(
                              right: 0,
                              bottom: 0,
                              child: Container(
                                width: 12,
                                height: 12,
                                decoration: BoxDecoration(
                                  color: const Color(0xFF22C55E),
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                    color: const Color(0xFF0B1020),
                                    width: 2,
                                  ),
                                ),
                              ),
                            ),
                        ],
                      ),
                      title: Text(
                        chat.name,
                        style: const TextStyle(
                          fontSize: 19,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      subtitle: Text(
                        chat.lastMessage,
                        style: const TextStyle(
                          color: MakerereMockData.softText,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      trailing: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            chat.time,
                            style: const TextStyle(
                              color: MakerereMockData.softText,
                              fontSize: 12,
                            ),
                          ),
                          const SizedBox(height: 6),
                          if (chat.unread > 0)
                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 8,
                                vertical: 3,
                              ),
                              decoration: BoxDecoration(
                                color: MakerereMockData.brandPink,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Text(
                                '${chat.unread}',
                                style: const TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
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
