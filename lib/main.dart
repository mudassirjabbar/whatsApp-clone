import 'package:flutter/material.dart';
import 'package:whats_app/features/welcome/pages/welcome_page.dart';

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
      theme: ThemeData.dark(),
      home: const WelcomePage(),
    );
  }
}
