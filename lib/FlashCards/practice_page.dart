import 'package:flutter/material.dart';
import 'PrimeNumberExamplesPage.dart';
import 'EvenNumberExamplesPage.dart';
import 'SquaresPracticePage.dart';
import 'CompositeNumberPracticePage.dart';
import 'PerfectNumbersPracticePage.dart';

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
        child: Padding(
          padding: const EdgeInsets.all(100.0), // Adjust padding as needed
          child: GridView.count(
            crossAxisCount: 4, // Number of columns
            crossAxisSpacing: 10.0, // Space between columns
            mainAxisSpacing: 10.0, // Space between rows
            childAspectRatio: 1.2, // Aspect ratio for smaller buttons
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
                          builder: (context) => PerfectNumberPracticePage()));
                },
              ),
              LessonButton(
                title: 'SQUARE\nNUMBERS',
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => SquaresExamplePage()));
                },
              ),
              LessonButton(
                title: 'FACTORS',
                onPressed: () {
                  // Navigator.push(
                  //     context,
                  //     MaterialPageRoute(
                  //         builder: (context) => FactorsInfoPage()));
                },
              ),
              LessonButton(
                title: 'CUBE\nNUMBERS',
                onPressed: () {
                  // Navigator.push(
                  //     context,
                  //     MaterialPageRoute(
                  //         builder: (context) => CubeNumberInfoPage()));
                },
              ),
              LessonButton(
                title: 'MODULO\nNUMBERS',
                onPressed: () {
                  // Navigator.push(
                  //     context,
                  //     MaterialPageRoute(
                  //         builder: (context) => ModuloNumberInfoPage()));
                },
              ),
            ],
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
      padding: EdgeInsets.all(20), // Ensure minimal padding
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          elevation: 3, // Remove button shadow
          backgroundColor: Colors.white70,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        child: Center(
          child: Text(
            title,
            textAlign: TextAlign.center, // Align text in the center
            style: TextStyle(
              fontSize: 30, // Reduce font size for smaller buttons
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
