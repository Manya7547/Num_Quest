import 'dart:math';
import 'package:flutter/material.dart';

void main() {
  runApp(ChooseFactorsGame());
}

class ChooseFactorsGame extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Choose Factors Game',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: DartGamePage(),
    );
  }
}

class DartGamePage extends StatefulWidget {
  @override
  _DartGamePageState createState() => _DartGamePageState();
}

class _DartGamePageState extends State<DartGamePage> {
  int roundNumber = 1;
  int generatedNumber = 0;
  List<int> selectedFactors = [];
  int score = 0; // Added scoring system
  String feedback = '';
  bool _isEnglish = true; // Toggle for translation

  @override
  void initState() {
    super.initState();
    generateRound();
  }

  void generateRound() {
    setState(() {
      generatedNumber = Random().nextInt(20) + 1;
      selectedFactors.clear();
      feedback = '';
    });
  }

  List<int> _calculateFactors(int number) {
    List<int> factors = [];
    for (int i = 1; i <= number; i++) {
      if (number % i == 0) {
        factors.add(i);
      }
    }
    return factors;
  }

  void checkAnswer() {
    setState(() {
      List<int> correctFactors = _calculateFactors(generatedNumber);
      bool isCorrect = selectedFactors.length == correctFactors.length &&
          selectedFactors.every((factor) => correctFactors.contains(factor));

      if (isCorrect) {
        feedback = _translateText('Correct!');
        score += 10; // Increase score for correct answer
      } else {
        feedback = _translateText('Incorrect!');
      }
    });
  }

  void nextRound() {
    setState(() {
      if (roundNumber < 5) {
        roundNumber++;
        generateRound();
      } else {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text(_translateText('Game Over')),
              content: Text(_translateText('Final Score: $score\nThanks for playing!')),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                    resetGame();
                  },
                  child: Text(_translateText('Play Again')),
                ),
              ],
            );
          },
        );
      }
    });
  }

  void resetGame() {
    setState(() {
      roundNumber = 1;
      score = 0;
      generateRound();
    });
  }

  String _translateText(String text) {
    Map<String, String> translations = {
      'Choose factors of the given number': 'Elige los factores del número dado',
      'Round': 'Ronda',
      'Select the Factors of': 'Selecciona los factores de',
      'Correct!': '¡Correcto!',
      'Incorrect!': '¡Incorrecto!',
      'Game Over': 'Fin del Juego',
      'Final Score:': 'Puntuación Final:',
      'Thanks for playing!': '¡Gracias por jugar!',
      'Play Again': 'Jugar de nuevo',
      'Check': 'Verificar',
      'Next Round': 'Siguiente Ronda',
      'Reset Game': 'Reiniciar Juego',
      'Tap to Translate': 'Toca para Traducir',
    };
    return _isEnglish ? text : (translations[text] ?? text);
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double buttonSize = screenWidth / 7; // Dynamically scale button size

    return Scaffold(
      appBar: AppBar(
        title: Text(_translateText('Choose factors of the given number')),
        actions: [
          IconButton(
            icon: Icon(Icons.translate),
            onPressed: () {
              setState(() {
                _isEnglish = !_isEnglish;
              });
            },
          ),
        ],
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/Bigschooldesk_generated.jpg'), 
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '${_translateText("Round")} $roundNumber',
                style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Text(
                '${_translateText("Select the Factors of")} $generatedNumber',
                style: TextStyle(fontSize: 24),
              ),
              SizedBox(height: 20),
              Text(
                'Score: $score', // Display current score
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: GridView.count(
                  crossAxisCount: screenWidth < 600 ? 5 : 10, // Adjust grid for small & large screens
                  crossAxisSpacing: 8.0,
                  mainAxisSpacing: 8.0,
                  shrinkWrap: true,
                  children: List.generate(
                    20,
                    (index) => ElevatedButton(
                      onPressed: () {
                        setState(() {
                          if (selectedFactors.contains(index + 1)) {
                            selectedFactors.remove(index + 1);
                          } else {
                            selectedFactors.add(index + 1);
                          }
                        });
                      },
                      child: Text(
                        (index + 1).toString(),
                        style: TextStyle(fontSize: 18),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: selectedFactors.contains(index + 1)
                            ? Colors.green
                            : Colors.blue.shade400,
                        minimumSize: Size(buttonSize, buttonSize), // Dynamically adjust button size
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: checkAnswer,
                child: Text(
                  _translateText('Check'),
                  style: TextStyle(fontSize: 24),
                ),
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                ),
              ),
              SizedBox(height: 10),
              ElevatedButton(
                onPressed: nextRound,
                child: Text(
                  _translateText('Next Round'),
                  style: TextStyle(fontSize: 24),
                ),
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                ),
              ),
              SizedBox(height: 10),
              ElevatedButton(
                onPressed: resetGame,
                child: Text(
                  _translateText('Reset Game'),
                  style: TextStyle(fontSize: 24),
                ),
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                ),
              ),
              SizedBox(height: 20),
              Text(
                feedback,
                style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
