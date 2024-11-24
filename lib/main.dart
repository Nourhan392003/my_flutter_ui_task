import 'package:flutter/material.dart';
import 'package:testing_project/screens/splach_screen.dart';

void main() {
  runApp(const RootApp());
}

@override
class RootApp extends StatelessWidget {
  const RootApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}
