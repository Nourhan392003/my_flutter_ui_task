import 'package:flutter/material.dart';
import 'package:testing_project/screens/onboarding_page.dart'; // تأكد من استيراد صفحة Homepage

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // العودة إلى الصفحة الرئيسية مع إزالة جميع الصفحات السابقة من المكدس
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
          'Notifications',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
