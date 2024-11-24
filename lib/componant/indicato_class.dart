// import 'package:flutter/material.dart';

// class RectangleIndicator extends StatelessWidget {
//   const RectangleIndicator({super.key, required this.isActive});

//   final bool isActive;

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: 30,
//       height: 5,
//       decoration: BoxDecoration(
//         color: isActive ? const Color(0xFF2196F3) : const Color(0xFF5C5C5C),
//         shape: BoxShape.rectangle,
//       ),
//     );
//   }
// }

//second way
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class RectangleIndicator extends StatelessWidget {
  final int yourActiveIndex;

  const RectangleIndicator({super.key, required this.yourActiveIndex});

  @override
  Widget build(BuildContext context) {
    return AnimatedSmoothIndicator(
      activeIndex: yourActiveIndex, // Correct type (int)
      count: 3, // Total number of pages
      effect: const WormEffect(), // You can customize the effect here
    );
  }
}
