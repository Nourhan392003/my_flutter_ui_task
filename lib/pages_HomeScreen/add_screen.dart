import 'package:flutter/material.dart';
import 'package:testing_project/screens/onboarding_page.dart';

class AddScreen extends StatelessWidget {
  const AddScreen({super.key});

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
          'Add',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}