import 'package:flutter/material.dart';

import 'screens/login_screen.dart';
import 'screens/button_gallery_screen.dart';
import 'screens/profile_screen.dart';
import 'screens/details_screen.dart';
import 'screens/settings_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material Buttons & Navigation',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const LoginScreen(),
        '/buttons': (context) => const ButtonGalleryScreen(),
        '/profile': (context) => const ProfileScreen(),
        '/details': (context) => const DetailsScreen(),
        '/settings': (context) => const SettingsScreen(),
      },
    );
  }
}
