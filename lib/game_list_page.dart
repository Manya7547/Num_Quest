import 'package:flutter/material.dart';
import 'games/even_odd_sort.dart';
import 'games/choose_factors_game.dart';
import 'games/word_problem_game.dart';
import 'games/prime_number_game.dart';
import 'games/number_pattern_match_game.dart';
import 'games/Match_LCM.dart';
import 'games/Squares_Game.dart';

class GameListPage extends StatelessWidget {
  const GameListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("PLAY"),
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/background1.jpg'), // Ensure asset exists
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20.0), // Reduced padding to maximize space
          child: GridView.count(
            crossAxisCount: 2,       // Keeps two columns for better spacing
            crossAxisSpacing: 30.0,  // Increased spacing between buttons
            mainAxisSpacing: 30.0,   // Increased vertical spacing
            childAspectRatio: 1.1,   // Makes buttons taller for more text space
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
                title: 'Even-Odd Sort\nGame',
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
                title: 'Word Problem\nGame',
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => WordProblemsGame(),
                    ),
                  );
                },
              ),
              GameButton(
                title: 'Prime Number\nGame',
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => PrimeNumberGame(),
                    ),
                  );
                },
              ),
              GameButton(
                title: 'Choose Factors\nGame',
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ChooseFactorsGame(),
                    ),
                  );
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
  final VoidCallback? onPressed;

  const GameButton({
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
        backgroundColor: Colors.white70,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        // Increased button size
        minimumSize: const Size(200, 120),
        padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
        // Bigger text for better readability
        textStyle: const TextStyle(
          fontSize: 30, // Adjusted font size for visibility
          fontWeight: FontWeight.bold,
        ),
      ),
      child: Center(
        child: Text(
          title,
          textAlign: TextAlign.center,
          style: const TextStyle(
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}
