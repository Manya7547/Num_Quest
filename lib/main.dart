import 'package:flutter/material.dart';
import 'splash_screen.dart';
import 'lessons_page.dart';
import 'FlashCards/practice_page.dart';
import 'game_list_page.dart';

void main() {
  runApp(const MathLearningApp());
}

class MathLearningApp extends StatefulWidget {
  const MathLearningApp({Key? key}) : super(key: key);

  @override
  State<MathLearningApp> createState() => _MathLearningAppState();
}

class _MathLearningAppState extends State<MathLearningApp> {
  int _score = 0;

  void _incrementScore() {
    setState(() {
      _score++;
    });
  }

  void _resetScore() {
    setState(() {
      _score = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Builder(
        builder: (context) => SplashScreen(
          onFinish: () {
            Future.delayed(Duration.zero, () {
              if (mounted) {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MainMenu(
                      score: _score,
                      incrementScore: _incrementScore,
                      resetScore: _resetScore,
                    ),
                  ),
                );
              }
            });
          },
        ),
      ),
    );
  }
}

/// Main Menu Page
class MainMenu extends StatelessWidget {
  final int score;
  final VoidCallback incrementScore;
  final VoidCallback resetScore;

  const MainMenu({
    Key? key,
    required this.score,
    required this.incrementScore,
    required this.resetScore,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          // Background image
          Positioned.fill(
            child: Image.asset(
              'assets/start_page.jpg',
              fit: BoxFit.cover,
            ),
          ),
          // Center content
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                // Game title
                Text(
                  'NUMQUEST',
                  style: TextStyle(
                    fontSize: 70,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'RaleWay',
                    color: Colors.orange,
                  ),
                ),
                const SizedBox(height: 20),
                // Score Display
                Text(
                  'Score: $score',
                  style: const TextStyle(fontSize: 24, color: Colors.white),
                ),
                const SizedBox(height: 20),
                // Buttons
                Wrap(
                  spacing: 40,
                  runSpacing: 20,
                  alignment: WrapAlignment.center,
                  children: <Widget>[
                    RoundedButton(
                      text: 'LESSONS',
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => LessonsPage(),
                          ),
                        );
                      },
                    ),
                    RoundedButton(
                      text: 'PRACTICE',
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => PracticePage(
                              score: score,
                              incrementScore: incrementScore,
                              resetScore: resetScore,
                            ),
                          ),
                        );
                      },
                    ),
                    RoundedButton(
                      text: 'PLAY',
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const GameListPage(),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

/// Custom button widget
class RoundedButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const RoundedButton({
    Key? key,
    required this.text,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
          side: const BorderSide(color: Colors.white),
        ),
        padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 30.0),
      ),
      child: Text(
        text,
        style: const TextStyle(fontSize: 24),
      ),
    );
  }
}
