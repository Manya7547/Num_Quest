import 'package:flutter/material.dart';
import 'games/even_odd_sort.dart'; // Import the game widgets
import 'games/choose_factors_game.dart';
import 'games/word_problem_game.dart';
import 'games/prime_number_game.dart';
import 'games/number_pattern_match_game.dart';
import 'games/Match_LCM.dart';
import 'games/Squares_Game.dart';

class GameListPage extends StatelessWidget {
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
              GameButton(
                title: 'Perfect Square\nGame',
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SquareFinderGame(),
                    ),
                  );
                },
              ),
              GameButton(
                title: 'Number Pattern\nMatch',
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => NumberPatternMatchGame(),
                    ),
                  );
                },
              ),
              GameButton(
                title: 'Even-Odd Sort\nGame ',
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => EvenOddSortPage(),
                    ),
                  );
                },
              ),
              GameButton(
                title: 'Triangle Tower Builder',
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => WordProblemsGame()));
                },
              ),
              GameButton(
                title: 'Prime Explorer',
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ChooseFactorsGame()));
                },
              ),
              GameButton(
                title: 'LCM Match',
                onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => LCMGame()));
                },
              ),

            ],
          ),
        ),
      ),
    );
  }
}

class GameButton extends StatelessWidget {
  final String title;
  final Function()? onPressed;

  GameButton({required this.title, this.onPressed});

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
