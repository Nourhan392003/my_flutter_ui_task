import 'package:flutter/material.dart';

import 'package:testing_project/componant/indicato_class.dart';
import 'package:testing_project/models/class_parameter.dart'; // Assuming your model class is correct

class HomePageContent extends StatelessWidget {
  const HomePageContent({
    super.key,
    required this.indexPage,
    required this.dataOfPage,
  });

  final int indexPage;
  final List<OnboardingScreen> dataOfPage;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 13),
        Text(
          dataOfPage[indexPage].title,
          textAlign: TextAlign.center,
          style: const TextStyle(fontSize: 16),
        ),
        const SizedBox(height: 35),
        SizedBox(
          height: 250,
          width: double.infinity,
          child: Image.asset(dataOfPage[indexPage].image),
        ),
        const SizedBox(height: 10),
        Text(
          dataOfPage[indexPage].text1,
          textAlign: TextAlign.center,
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
        ),
        const SizedBox(height: 10),
        Text(
          dataOfPage[indexPage].description,
          textAlign: TextAlign.center,
          style: const TextStyle(fontSize: 12),
        ),
        const SizedBox(height: 30),

        // RectangleIndicator widget with the current indexPage passed correctly
        RectangleIndicator(yourActiveIndex: indexPage), // Pass the active index

        const SizedBox(height: 20),
      ],
    );
  }
}
