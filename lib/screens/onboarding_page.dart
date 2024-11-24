import 'package:flutter/material.dart';
import 'package:testing_project/componant/contantClass.dart';
import 'package:testing_project/models/class_parameter.dart';
import 'package:testing_project/screens/login_page.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  late PageController _pageController;
  int indexPage = 0;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  void initState() {
    _pageController = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  final List<OnboardingScreen> dataOfPage = [
    OnboardingScreen(
      title: 'JALANJALAN',
      image: 'assets/image.png',
      text1: 'Connect with Nature',
      description: 'Explore nature like you have never seen before\n'
          'From rainforests to coral reefs, the world awaits to be explored',
    ),
    OnboardingScreen(
      title: 'JALANJALAN',
      image: 'assets/image copy 2.png',
      text1: 'City Chronicles',
      description: 'Every street holds a unique story \n'
          'Lets dive into the history and life in every corner of the city.',
    ),
    OnboardingScreen(
      title: 'JALANJALAN',
      image: 'assets/image copy.png',
      text1: 'Ready to Make Footprints?',
      description: 'Get ready to enter the boundless world of JalanJalanIDc \n'
          'New adventures start with every step you take.',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [
          GestureDetector(
            onTap: () {
              // Implement skip functionality here
              print('Skip tapped');
            },
            child: const Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                'skip',
                style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
              itemCount: dataOfPage.length,
              controller: _pageController,
              onPageChanged: (index) {
                setState(() {
                  indexPage = index;
                });
              },
              itemBuilder: (context, index) {
                return HomePageContent(
                  indexPage: index,
                  dataOfPage: dataOfPage,
                );
              },
            ),
          ),
          Row(
            mainAxisAlignment:
                MainAxisAlignment.spaceBetween, // Space between buttons
            children: [
              // Back button
              TextButton(
                onPressed: () {
                  if (indexPage > 0) {
                    // Ensure you don't go below the first page
                    _pageController.previousPage(
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeInOut,
                    );
                  }
                },
                child: indexPage > 0 // Hide "Back" button on first page
                    ? const Text(
                        'Back',
                        style: TextStyle(fontSize: 10, color: Colors.black),
                      )
                    : const SizedBox.shrink(),
              ),

              // Next or Get Started button
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF2196F3),
                  fixedSize: const Size(80, 35),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
                onPressed: () {
                  if (indexPage == 2) {
                    // If it's the last page, navigate to login
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => LoginPage(
                          formKey: _formKey,
                        ),
                      ),
                    );
                  } else {
                    _pageController.nextPage(
                      duration: const Duration(seconds: 1),
                      curve: Curves.easeInOut,
                    );
                  }
                },
                child: indexPage == 2
                    ? const Text(
                        'GetStarted',
                        style: TextStyle(fontSize: 10, color: Colors.white),
                      )
                    : const Text(
                        'Next',
                        style: TextStyle(fontSize: 10, color: Colors.white),
                      ),
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          )
        ],
      ),
    );
  }
}
