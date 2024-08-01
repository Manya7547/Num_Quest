import 'package:flutter/material.dart';
import 'PrimeNumberExamplesPage.dart';
import 'EvenNumberExamplesPage.dart';
import 'OddNumberExamplesPage.dart';

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
            image: AssetImage('background1.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(100, 100, 100, 100),
            child: GridView.count(
              crossAxisCount: 4,
              crossAxisSpacing: 20.0,
              mainAxisSpacing: 20.0,
              shrinkWrap: true,
              children: [
                LessonButton(
                  title: 'ODD & Even Numbers',
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => EvenNumberExamplesPage()));
                  },
                ),
                LessonButton(
                  title: 'Prime Numbers',
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => PrimeNumberPracticePage()));
                  },
                ),
                LessonButton(
                  title: 'Composite Numbers',
                  onPressed: () {
                    // Navigator.push(
                    //     context,
                    //     MaterialPageRoute(
                    //         builder: (context) => CompositeNumberInfoPage()));
                  },
                ),
                LessonButton(
                  title: 'Perfect Numbers',
                  onPressed: () {
                    // Navigator.push(
                    //     context,
                    //     MaterialPageRoute(
                    //         builder: (context) => PerfectNumberInfoPage()));
                  },
                ),
                LessonButton(
                  title: 'Square Numbers',
                  onPressed: () {
                    // Navigator.push(
                    //     context,
                    //     MaterialPageRoute(
                    //         builder: (context) => SquareNumberInfoPage()));
                  },
                ),
                LessonButton(
                  title: 'Factors',
                  onPressed: () {
                    // Navigator.push(
                    //     context,
                    //     MaterialPageRoute(
                    //         builder: (context) => FactorsInfoPage()));
                  },
                ),
                LessonButton(
                  title: 'Cube Numbers',
                  onPressed: () {
                    // Navigator.push(
                    //     context,
                    //     MaterialPageRoute(
                    //         builder: (context) => CubeNumberInfoPage()));
                  },
                ),
                LessonButton(
                  title: 'Modulo Numbers',
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
      padding: EdgeInsets.all(0),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          elevation: 3, // Remove button shadow
          backgroundColor: Colors.white30,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        child: Center(
          child: Text(
            title,
            textAlign: TextAlign.center, // Align text in the center
            style: TextStyle(
              fontSize: 20, // Change font size
              fontWeight: FontWeight.bold, // Make text bold
              fontFamily: 'Arial', // Change font family if needed
            ),
          ),
        ),
      ),
    );
  }
}
