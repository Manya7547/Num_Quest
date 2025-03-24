import 'package:flutter/material.dart';
import 'PrimeNumberExamplesPage.dart';
import 'EvenNumberExamplesPage.dart';
import 'SquaresPracticePage.dart';
import 'CompositeNumberPracticePage.dart';
import 'PerfectNumbersPracticePage.dart';

class PracticePage extends StatelessWidget {
  /// Only the Practice page uses global scoring
  final int score;
  final VoidCallback incrementScore;
  final VoidCallback resetScore;

  const PracticePage({
    Key? key,
    required this.score,
    required this.incrementScore,
    required this.resetScore,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    bool isTablet = screenWidth > 600;

    return Scaffold(
      appBar: AppBar(
        title: Text("PRACTICE - Score: $score"),
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/background1.jpg'), // Ensure this asset exists
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: EdgeInsets.all(screenWidth * 0.05), // Scales with screen size
          child: GridView.count(
            crossAxisCount: isTablet ? 3 : 2,  // Adapts for tablets
            crossAxisSpacing: screenWidth * 0.05,  
            mainAxisSpacing: screenWidth * 0.05,   
            childAspectRatio: 1.2,  // Adjusted for better button size
            children: [
              PracticeButton(
                title: 'ODD & EVEN\nNUMBERS',
                onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => EvenNumberExamplesPage(),
                  ),
                ),
              ),
              PracticeButton(
                title: 'PRIME\nNUMBERS',
                onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PrimeNumberPracticePage(),
                  ),
                ),
              ),
              PracticeButton(
                title: 'COMPOSITE\nNUMBERS',
                onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CompositeNumberPracticePage(),
                  ),
                ),
              ),
              PracticeButton(
                title: 'PERFECT\nNUMBERS',
                onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PerfectNumberPracticePage(),
                  ),
                ),
              ),
              PracticeButton(
                title: 'SQUARE\nNUMBERS',
                onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SquaresExamplePage(),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class PracticeButton extends StatelessWidget {
  final String title;
  final VoidCallback? onPressed;

  const PracticeButton({
    Key? key,
    required this.title,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    bool isTablet = screenWidth > 600;

    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        elevation: 5,
        backgroundColor: Colors.white70,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        minimumSize: Size(screenWidth * 0.4, isTablet ? 140 : 120), // Adapts button size
        padding: EdgeInsets.symmetric(vertical: 30, horizontal: 20),
      ),
      child: Center(
        child: Text(
          title,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: isTablet ? 32 : 26, // Adjusts font size based on screen
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
