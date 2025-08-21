import 'package:flutter/material.dart';
import 'PrimeNumberExamplesPage.dart';
import 'EvenNumberExamplesPage.dart';
import 'SquaresPracticePage.dart';
import 'CompositeNumberPracticePage.dart';
import 'PerfectNumbersPracticePage.dart';
import 'CubeNumberInfoPage.dart';
import 'FactorsNumberInfoPage.dart';

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
            image: AssetImage('assets/background1.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: LayoutBuilder(
          builder: (context, constraints) {
            double screenWidth = constraints.maxWidth;
            int crossAxisCount;

            if (screenWidth >= 1200) {
              crossAxisCount = 4;
            } else if (screenWidth >= 900) {
              crossAxisCount = 3;
            } else if (screenWidth >= 600) {
              crossAxisCount = 2;
            } else {
              crossAxisCount = 1;
            }

            return Padding(
              padding: const EdgeInsets.all(20.0),
              child: GridView.count(
                crossAxisCount: crossAxisCount,
                crossAxisSpacing: 20.0,
                mainAxisSpacing: 20.0,
                childAspectRatio: 1.2,
                children: [
                  LessonButton(
                    title: 'ODD & EVEN\nNUMBERS',
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => EvenNumberExamplesPage(),
                        ),
                      );
                    },
                  ),
                  LessonButton(
                    title: 'PRIME\nNUMBERS',
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => PrimeNumberPracticePage(),
                        ),
                      );
                    },
                  ),
                  LessonButton(
                    title: 'COMPOSITE\nNUMBERS',
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => CompositeNumberPracticePage(),
                        ),
                      );
                    },
                  ),
                  LessonButton(
                    title: 'PERFECT\nNUMBERS',
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              PerfectNumberPracticePage(),
                        ),
                      );
                    },
                  ),
                  LessonButton(
                    title: 'SQUARE\nNUMBERS',
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SquaresExamplePage(),
                        ),
                      );
                    },
                  ),
                  LessonButton(
                    title: 'FACTORS',
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => FactorsPracticePage(),
                        ),
                      );
                    },
                  ),
                  LessonButton(
                    title: 'CUBE\nNUMBERS',
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => CubesExamplePage(),
                        ),
                      );
                    },
                  ),
                  LessonButton(
                    title: 'MODULO\nNUMBERS',
                    onPressed: () {
                      // Future Implementation
                    },
                  ),
                ],
              ),
            );
          },
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
    double screenWidth = MediaQuery.of(context).size.width;
    double fontSize;

    if (screenWidth >= 1200) {
      fontSize = 26;
    } else if (screenWidth >= 800) {
      fontSize = 22;
    } else {
      fontSize = 18;
    }

    return Container(
      padding: EdgeInsets.all(16),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          elevation: 3,
          backgroundColor: Colors.white70,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        child: Center(
          child: Text(
            title,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
              fontFamily: 'Poppins',
              color: Colors.black,
            ),
          ),
        ),
      ),
    );
  }
}
