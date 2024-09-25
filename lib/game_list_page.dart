import 'package:flutter/material.dart';
import 'games/even_odd_sort.dart';
import 'games/choose_factors_game.dart';
import 'games/word_problem_game.dart';
import 'games/prime_number_game.dart';
import 'games/number_pattern_match_game.dart';
import 'games/Match_LCM.dart';

class GameListPage extends StatelessWidget {
  final List<Map<String, dynamic>> games = [
    {'title': 'Number Placement Game', 'page': null}, // Add your page here
    {'title': 'Number Pattern Match', 'page': NumberPatternMatchGame()},
    {'title': 'Even and Odd Sort', 'page': EvenOddSortPage()},
    {'title': 'Triangle Tower Builder', 'page': null}, // Add your page here
    {'title': 'Solve Some Fun Word Problems', 'page': WordProblemsGame()},
    {'title': 'Perfect Number Challenge', 'page': null}, // Add your page here
    {'title': 'Prime Explorer', 'page': PrimeNumberGame()},
    {'title': 'Choose Factors', 'page': ChooseFactorsGame()},
    {'title': 'LCM Match', 'page': LCMGame()},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ARCADE'),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/Bigschooldesk_generated.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(100, 50, 100, 50),
          child: GridView.count(
            crossAxisCount: 3,
            crossAxisSpacing: 40.0,
            mainAxisSpacing: 40.0,
            children: games.map((game) {
              return GameButton(
                title: game['title'],
                onPressed: game['page'] != null
                    ? () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => game['page']),
                        );
                      }
                    : null, // No action for games without pages
              );
            }).toList(),
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
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
            fontFamily: 'Arial',
          ),
        ),
      ),
    );
  }
}
