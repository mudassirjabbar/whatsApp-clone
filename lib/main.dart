import 'package:flutter/material.dart';
import 'package:whats_app/common/theme/dark_theme.dart';
import 'package:whats_app/common/theme/light_theme.dart';
import 'package:whats_app/features/welcome/pages/welcome_page.dart';

import 'features/auth/pages/login_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Whats app',
      theme: lightTheme(),
      darkTheme: darkTheme(),
      themeMode: ThemeMode.system,
      home: const LoginPage(),
    );
  }
}
