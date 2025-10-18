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
          _settingTile(
            icon: Icons.email,
            title: 'Email',
            subtitle: 'jennifer.millar@email.com',
            onTap: () {},
          ),
          _settingTile(
            icon: Icons.lock,
            title: 'Password',
            subtitle: '•••••••',
            onTap: () {},
          ),
          const SizedBox(height: 12),
          const Text('Privacy', style: TextStyle(fontWeight: FontWeight.bold)),
          SwitchListTile(
            value: true,
            onChanged: (_) {},
            title: const Text('Profile Visibility'),
            secondary: _smallIcon(Icon(Icons.visibility)),
          ),
          SwitchListTile(
            value: true,
            onChanged: (_) {},
            title: const Text('Messaging'),
            secondary: _smallIcon(Icon(Icons.message)),
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
            secondary: _smallIcon(Icon(Icons.notifications)),
          ),
          SwitchListTile(
            value: true,
            onChanged: (_) {},
            title: const Text('Messages'),
            secondary: _smallIcon(Icon(Icons.email)),
          ),
          const SizedBox(height: 12),
          const Text(
            'App Settings',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          _settingTile(
            icon: Icons.language,
            title: 'Language',
            subtitle: 'English',
            onTap: () {},
          ),
          _settingTile(
            icon: Icons.brightness_6,
            title: 'Theme',
            subtitle: 'Light Mode',
            onTap: () {},
          ),
        ],
      ),
    );
  }
}

Widget _smallIcon(Icon icon) {
  return Container(
    width: 44,
    height: 44,
    decoration: BoxDecoration(
      color: const Color(0xFFF7D6E6),
      shape: BoxShape.circle,
    ),
    child: Center(child: Icon(icon.icon, color: const Color(0xFFF63D8E))),
  );
}

Widget _settingTile({
  required IconData icon,
  required String title,
  String? subtitle,
  VoidCallback? onTap,
}) {
  return ListTile(
    leading: Container(
      width: 44,
      height: 44,
      decoration: BoxDecoration(
        color: const Color(0xFFF7D6E6),
        shape: BoxShape.circle,
      ),
      child: Center(child: Icon(icon, color: const Color(0xFFF63D8E))),
    ),
    title: Text(title),
    subtitle: subtitle != null ? Text(subtitle) : null,
    onTap: onTap,
  );
}
