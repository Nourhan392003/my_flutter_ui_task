import 'package:flutter/material.dart';
import 'package:testing_project/componant/custom_bottom_nav_bar.dart';
import 'package:testing_project/models/newFun.dart';
import 'package:testing_project/pages_HomeScreen/add_screen.dart';
import 'package:testing_project/pages_HomeScreen/chat_screen.dart';
import 'package:testing_project/pages_HomeScreen/home_screen.dart';
import 'package:testing_project/pages_HomeScreen/notifications_screen.dart';
import 'package:testing_project/pages_HomeScreen/profile_screen.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int index = 0;

  // List of pages
  final List<Widget> _pages = [
    const HomeScreen(),
    const ChatScreen(),
    const AddScreen(),
    const NotificationsScreen(),
    const ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: const Color.fromARGB(255, 193, 193, 193),
        title: const Text(
          'Home Page',
          style: TextStyle(fontSize: 24),
        ),
      ),
      body: Column(
        children: [
          // Top Section: Horizontal Scrollable Row
          SizedBox(
            height: 100,
            width: double.infinity, // Height for the horizontal scroll area
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: List.generate(
                  20,
                  (index) => Container(
                    margin: const EdgeInsets.symmetric(horizontal: 8.0),
                    width: 80, // عرض العنصر
                    height: 80, // ارتفاع العنصر
                    color: Colors.blue[(index % 9 + 1) * 100],
                    child: Center(
                      child: Text(
                        'Item $index',
                        textAlign: TextAlign.center,
                        style: const TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),

          // Divider between sections
          const Divider(height: 1, color: Colors.grey),

          // Bottom Section: Horizontally Scrollable Column
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: List.generate(
                  10,
                  (index) => Container(
                    margin: const EdgeInsets.all(8.0),
                    width: 100,
                    height: 80,
                    color: Colors.green[(index % 9 + 1) * 100],
                    child: Center(
                      child: Text(
                        'Column Item $index',
                        style: const TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),

          // Dynamic Section (Expanded with Navigation)
          // Expanded(
          //   child: _pages[index], // Display selected page based on index
          // ),
        ],
      ),

      // Bottom Navigation Bar
      bottomNavigationBar: CustomBottomNavBar(
        currentIndex: index,
        onTap: (indexValue) {
          navigate(context: context, widget: _pages[indexValue]);
          setState(() {
            index = indexValue;
          });
        },
      ),
    );
  }
}
