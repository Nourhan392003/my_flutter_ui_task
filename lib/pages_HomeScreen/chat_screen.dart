import 'package:flutter/material.dart';
import 'package:testing_project/pages_HomeScreen/home_screen.dart';
import 'package:testing_project/screens/home_page.dart';
import 'package:testing_project/screens/onboarding_page.dart'; // تأكد من استيراد صفحة HomeScreen

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // العودة إلى الصفحة الرئيسية
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => const Homepage()),
            (route) => false, // إزالة كل الصفحات من المكدس
          );
        },
        child: const Icon(Icons.home), // أيقونة الزر
      ),
      body: const Center(
        child: Text(
          'Chat',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}