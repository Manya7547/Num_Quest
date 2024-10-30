import 'package:flutter/material.dart';
import 'lessons/even_numbers/even_number_info_page.dart';
import 'lessons/odd_numbers/odd_number_info_page.dart';
import 'lessons/prime_numbers/prime_number_info_page.dart';
import 'lessons/composite_numbers/composite_number_info_page.dart';
import 'lessons/triangular_number_info_page.dart';
import 'lessons/perfect_number_info_page.dart';
import 'lessons/square_number_info_page.dart';
import 'lessons/fibonacci_number_info_page.dart';
import 'lessons/factors_info_page.dart';
import 'lessons/cube_number_info_page.dart';

class LessonsPage extends StatelessWidget {
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
        title: Text('LESSON PLAN'),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/lesson_page.jpeg'),
            fit: BoxFit.cover,
          ),
        ),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(100, 50, 100, 50),
            child: GridView.count(
              crossAxisCount: 4,
              crossAxisSpacing: 20.0,
              mainAxisSpacing: 20.0,
              shrinkWrap: true,
              physics:
                  NeverScrollableScrollPhysics(), // Disable GridView scroll
              children: lessons.map((lesson) {
                return LessonButton(
                  title: lesson['title'],
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => lesson['page']),
                    );
                  },
                );
              }).toList(),
            ),
          ),
        ),
      ),
    );
  }
}

class LessonButton extends StatelessWidget {
  final String title;
  final Function()? onPressed;

  LessonButton({required this.title, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.cyan.shade100,
        borderRadius: BorderRadius.circular(10),
      ),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          elevation: 0, // Remove button shadow
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        child: Center(
          child: Text(
            title,
            textAlign: TextAlign.center, // Align text in the center
            style: TextStyle(
              fontSize: 30, // Change font size
              fontWeight: FontWeight.bold, // Make text bold
              fontFamily: 'Arial', // Change font family if needed
            ),
          ),
        ),
      ),
    );
  }
}
