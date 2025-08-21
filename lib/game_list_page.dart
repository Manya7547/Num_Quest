import 'package:flutter/material.dart';
import 'games/even_odd_sort.dart';
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
        title: Text("GAMES"),
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
            double padding;

            if (screenWidth >= 1200) {
              crossAxisCount = 4;
              padding = 100.0;
            } else if (screenWidth >= 900) {
              crossAxisCount = 3;
              padding = 60.0;
            } else if (screenWidth >= 600) {
              crossAxisCount = 2;
              padding = 30.0;
            } else {
              crossAxisCount = 1;
              padding = 16.0;
            }

            return Padding(
              padding: EdgeInsets.all(padding),
              child: GridView.count(
                crossAxisCount: crossAxisCount,
                crossAxisSpacing: 16.0,
                mainAxisSpacing: 16.0,
                childAspectRatio: 1.2,
                children: [
                  GameButton(
                    title: 'Perfect Square\nGame',
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => SquareFinderGame()),
                      );
                    },
                  ),
                  GameButton(
                    title: 'Number Pattern\nMatch',
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => NumberPatternMatchGame()),
                      );
                    },
                  ),
                  GameButton(
                    title: 'Even-Odd Sort\nGame',
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => EvenOddSortPage()),
                      );
                    },
                  ),
                  GameButton(
                    title: 'Triangle Tower\nBuilder',
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => WordProblemsGame()),
                      );
                    },
                  ),
                  GameButton(
                    title: 'Prime Explorer',
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => ChooseFactorsGame()),
                      );
                    },
                  ),
                  GameButton(
                    title: 'LCM Match',
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => LCMGame()),
                      );
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

class GameButton extends StatelessWidget {
  final String title;
  final Function()? onPressed;

  GameButton({required this.title, this.onPressed});

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
      padding: EdgeInsets.all(12),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.white70,
          elevation: 3,
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
