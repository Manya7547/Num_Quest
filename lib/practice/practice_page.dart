import 'package:flutter/material.dart';
import '../practice/EvenNumberExamplesPage.dart';
import '../practice/OddNumberExamplesPage.dart';
import '../lessons/even_numbers/even_number_info_page.dart';
import '../lessons/odd_numbers/odd_number_info_page.dart';
import '../lessons/prime_number_info_page.dart';
import '../lessons/composite_number_info_page.dart';
import '../lessons/triangular_number_info_page.dart';
import '../lessons/perfect_number_info_page.dart';
import '../lessons/square_number_info_page.dart';
import '../lessons/fibonacci_number_info_page.dart';
import '../lessons/factors_info_page.dart';
import '../lessons/cube_number_info_page.dart';
import '../lessons/modulo_number_info_page.dart';

class PracticePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("PRACTICE"),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
                'assets/Bigschooldesk_generated.jpg'),
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
              children: [
                LessonButton(
                  title: 'Even Numbers',
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => EvenNumberExamplesPage()));
                  },
                ),
                LessonButton(
                  title: 'Odd Numbers',
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => OddNumberExamplesPage()));
                  },
                ),
                LessonButton(
                  title: 'Prime Numbers',
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => PrimeNumberInfoPage()));
                  },
                ),
                LessonButton(
                  title: 'Composite Numbers',
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => CompositeNumberInfoPage()));
                  },
                ),
                LessonButton(
                  title: 'Triangular Numbers',
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => TriangularNumberInfoPage()));
                  },
                ),
                LessonButton(
                  title: 'Perfect Numbers',
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => PerfectNumberInfoPage()));
                  },
                ),
                LessonButton(
                  title: 'Square Numbers',
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => SquareNumberInfoPage()));
                  },
                ),
                LessonButton(
                  title: 'Fibonacci Numbers',
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => FibonacciNumberInfoPage()));
                  },
                ),
                LessonButton(
                  title: 'Factors',
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => FactorsInfoPage()));
                  },
                ),
                LessonButton(
                  title: 'Cube Numbers',
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => CubeNumberInfoPage()));
                  },
                ),
                LessonButton(
                  title: 'Modulo Numbers',
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ModuloNumberInfoPage()));
                  },
                ),
                // Add more LessonButton widgets for each lesson
              ],
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
