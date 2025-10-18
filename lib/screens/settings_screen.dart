import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: Colors.black,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const Text('Account', style: TextStyle(fontWeight: FontWeight.bold)),
          ListTile(
            leading: const Icon(Icons.email),
            title: const Text('Email'),
            subtitle: const Text('jennifer.millar@email.com'),
          ),
          ListTile(
            leading: const Icon(Icons.lock),
            title: const Text('Password'),
          ),
          const SizedBox(height: 12),
          const Text('Privacy', style: TextStyle(fontWeight: FontWeight.bold)),
          SwitchListTile(
            value: true,
            onChanged: (_) {},
            title: const Text('Profile Visibility'),
          ),
          SwitchListTile(
            value: true,
            onChanged: (_) {},
            title: const Text('Messaging'),
          ),
          const SizedBox(height: 12),
          const Text(
            'Notifications',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          SwitchListTile(
            value: true,
            onChanged: (_) {},
            title: const Text('New Matches'),
          ),
          SwitchListTile(
            value: true,
            onChanged: (_) {},
            title: const Text('Messages'),
          ),
          const SizedBox(height: 12),
          const Text(
            'App Settings',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          ListTile(
            leading: const Icon(Icons.language),
            title: const Text('Language'),
            subtitle: const Text('English'),
          ),
          ListTile(
            leading: const Icon(Icons.brightness_6),
            title: const Text('Theme'),
            subtitle: const Text('Light Mode'),
          ),
        ],
      ),
    );
  }
}
