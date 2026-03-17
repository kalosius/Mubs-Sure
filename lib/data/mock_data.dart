import 'package:flutter/material.dart';

class StudentProfile {
  final String name;
  final int age;
  final String program;
  final String hall;
  final String about;
  final int distanceKm;
  final String imageUrl;
  final List<String> interests;

  const StudentProfile({
    required this.name,
    required this.age,
    required this.program,
    required this.hall,
    required this.about,
    required this.distanceKm,
    required this.imageUrl,
    required this.interests,
  });
}

class ChatPreview {
  final String name;
  final String avatarUrl;
  final String lastMessage;
  final String time;
  final bool online;
  final int unread;

  const ChatPreview({
    required this.name,
    required this.avatarUrl,
    required this.lastMessage,
    required this.time,
    required this.online,
    required this.unread,
  });
}

class MakerereMockData {
  static const brandPink = Color(0xFFFF2F6D);
  static const brandOrange = Color(0xFFFF5E3A);
  static const appBackground = Color(0xFF080C17);
  static const cardBackground = Color(0xFF111827);
  static const softText = Color(0xFF9CA3AF);

  static const onboardingInterests = <String>[
    'Freelancing',
    'Business Pitching',
    'Hackathons',
    'Debate',
    'Poetry',
    'Basketball',
    'Netball',
    'Photography',
    'Campus Ministry',
    'Ugandan Food',
    'Road Trips',
    'Gym',
  ];

  static const communicationStyles = <String>[
    'Big time texter',
    'Phone caller',
    'Video chatter',
    'Better in person',
  ];

  static const lookingFor = <String>[
    'Long-term partner',
    'Long-term, short-term OK',
    'Short-term, long-term OK',
    'New friends',
    'Still figuring it out',
  ];

  static const profiles = <StudentProfile>[
    StudentProfile(
      name: 'Brendah',
      age: 22,
      program: 'BSc Computer Science',
      hall: 'Africa Hall',
      about: 'Gym after classes, code at night, coffee before everything.',
      distanceKm: 2,
      imageUrl:
          'https://images.unsplash.com/photo-1544005313-94ddf0286df2?w=1200',
      interests: ['Gym', 'Hackathons', 'Road Trips'],
    ),
    StudentProfile(
      name: 'Sharon',
      age: 23,
      program: 'Bachelor of Commerce',
      hall: 'Mitchell Hall',
      about: 'Into startups, spoken word and Sunday brunch at Wandegeya.',
      distanceKm: 4,
      imageUrl:
          'https://images.unsplash.com/photo-1488426862026-3ee34a7d66df?w=1200',
      interests: ['Business Pitching', 'Poetry', 'Photography'],
    ),
    StudentProfile(
      name: 'Ian',
      age: 24,
      program: 'BBA',
      hall: 'Living out - Kikoni',
      about: 'MUBS by day, football by evening, chilled conversations always.',
      distanceKm: 3,
      imageUrl:
          'https://images.unsplash.com/photo-1506794778202-cad84cf45f1d?w=1200',
      interests: ['Basketball', 'Road Trips', 'Freelancing'],
    ),
    StudentProfile(
      name: 'Mercy',
      age: 21,
      program: 'BA Social Sciences',
      hall: 'Mary Stuart Hall',
      about: 'Bookshops, deep talks, and random city walks around Kampala.',
      distanceKm: 5,
      imageUrl:
          'https://images.unsplash.com/photo-1524504388940-b1c1722653e1?w=1200',
      interests: ['Debate', 'Poetry', 'Ugandan Food'],
    ),
  ];

  static const chats = <ChatPreview>[
    ChatPreview(
      name: 'Rita',
      avatarUrl: 'https://i.pravatar.cc/150?img=32',
      lastMessage: 'You heading for the guild social tonight?',
      time: '10:42 AM',
      online: true,
      unread: 2,
    ),
    ChatPreview(
      name: 'Kato',
      avatarUrl: 'https://i.pravatar.cc/150?img=12',
      lastMessage: 'Library at 7? I saved you a seat.',
      time: 'Yesterday',
      online: false,
      unread: 0,
    ),
    ChatPreview(
      name: 'Amina',
      avatarUrl: 'https://i.pravatar.cc/150?img=24',
      lastMessage: 'That entrepreneurship idea is actually fire.',
      time: 'Yesterday',
      online: true,
      unread: 1,
    ),
  ];
}
