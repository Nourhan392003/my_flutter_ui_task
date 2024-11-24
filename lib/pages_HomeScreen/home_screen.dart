import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // العودة إلى الصفحة الرئيسية
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const HomeScreen()),
            // إزالة جميع الصفحات السابقة من المكدس
          );
        },
        child: const Icon(Icons.home), // أيقونة الزر
      ),
      body: const Center(
        child: Text(
          'Home Page',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
