import 'package:flutter/material.dart';
import 'games/even_odd_sort.dart'; // Import the game widgets
import 'games/choose_factors_game.dart';
import 'games/word_problem_game.dart';
import 'games/prime_number_game.dart';
import 'games/number_pattern_match_game.dart';
import 'games/Match_LCM.dart';

class GameListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ARCADE'),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
                'assets/Bigschooldesk_generated.jpg'), // Set the background image
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(100, 50, 100, 50),
          child: GridView.count(
            crossAxisCount: 3, // Number of columns in the grid
            crossAxisSpacing: 40.0,
            mainAxisSpacing: 40.0,
            children: <Widget>[
              GameButton(
                title: 'Number Placement Game',
                onPressed: () {
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(
                  //       builder: (context) => NumberGuessingGame()),
                  // );
                  // // Add navigation logic for Number Placement Game
                },
              ),
              GameButton(
                title: 'Number Pattern Match',
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => NumberPatternMatchGame()),
                  );
                },
              ),
              GameButton(
                title: 'Even and Odd Sort',
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => EvenOddSortPage()),
                  );
                },
              ),
              GameButton(
                title: 'Triangle Tower Builder',
                onPressed: () {
                  // Add navigation logic for Triangle Tower Builder Game
                },
              ),
              GameButton(
                title: 'Solve Some Fun Word Problems',
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => WordProblemsGame()),
                  );
                  // Add navigation logic for Solve Some Fun Word Problems Game
                },
              ),
              GameButton(
                title: 'Perfect Number Challenge',
                onPressed: () {
                  // Add navigation logic for Perfect Number Challenge Game
                },
              ),
              GameButton(
                title: 'Prime Explorer',
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => PrimeNumberGame()),
                  );
                  // Add navigation logic for Prime Explorer Game
                },
              ),
              GameButton(
                title: 'Choose Factors',
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ChooseFactorsGame()),
                  );
                  // Add navigation logic for Factor Trees Game
                  // Add navigation logic for Factor Trees Game
                },
              ),
              GameButton(
                title: 'LCM Match',
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => LCMGame()),
                  );
                  // Add navigation logic for Fibonacci Sequence Puzzle Game
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
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
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
    );
  }
}
