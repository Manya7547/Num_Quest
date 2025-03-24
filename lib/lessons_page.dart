import 'package:flutter/material.dart';
import 'lessons/even_number_info_page.dart';
import 'lessons/odd_number_info_page.dart';
import 'lessons/prime_number_info_page.dart';
import 'lessons/composite_number_info_page.dart';
import 'lessons/triangular_number_info_page.dart';
import 'lessons/perfect_number_info_page.dart';
import 'lessons/square_number_info_page.dart';
import 'lessons/fibonacci_number_info_page.dart';
import 'lessons/factors_info_page.dart';
import 'lessons/cube_number_info_page.dart';

class LessonsPage extends StatelessWidget {
  LessonsPage({Key? key}) : super(key: key);

  final List<Map<String, dynamic>> lessons = [
    {'title': 'Even Numbers', 'page': EvenNumberInfoPage()},
    {'title': 'Odd Numbers', 'page': OddNumberInfoPage()},
    {'title': 'Prime Numbers', 'page': PrimeNumberInfoPage()},
    {'title': 'Composite Numbers', 'page': CompositeNumberInfoPage()},
    {'title': 'Triangular Numbers', 'page': TriangularNumberInfoPage()},
    {'title': 'Perfect Numbers', 'page': PerfectNumberInfoPage()},
    {'title': 'Square Numbers', 'page': SquareNumberInfoPage()},
    {'title': 'Fibonacci Numbers', 'page': FibonacciNumberInfoPage()},
    {'title': 'Factors', 'page': FactorsInfoPage()},
    {'title': 'Cube Numbers', 'page': CubeNumberInfoPage()},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('LESSON PLAN'), // No score needed
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/lesson_page.jpeg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(30.0), // Reduced padding for better fit
          child: GridView.count(
            crossAxisCount: 2,       // Reduced to 2 columns for bigger buttons
            crossAxisSpacing: 40.0,  // More spacing between buttons
            mainAxisSpacing: 40.0,   // Increased vertical spacing
            childAspectRatio: 1.3,   // Taller buttons for text visibility
            children: lessons.map((lesson) {
              return LessonButton(
                title: lesson['title'],
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => lesson['page'],
                    ),
                  );
                },
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}

class LessonButton extends StatelessWidget {
  final String title;
  final VoidCallback? onPressed;

  const LessonButton({
    Key? key,
    required this.title,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        elevation: 5,
        backgroundColor: Colors.cyan.shade100,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        // Bigger button size for better text fitting
        minimumSize: const Size(280, 130), 
        padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 10),
        textStyle: const TextStyle(
          fontSize: 24, // Reduced size to fit all text
          fontWeight: FontWeight.bold,
        ),
      ),
      child: Center(
        child: FittedBox(
          fit: BoxFit.scaleDown, // Ensures text shrinks to fit the button
          child: Text(
            title,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Colors.black,
            ),
          ),
        ),
      ),
    );
  }
}

