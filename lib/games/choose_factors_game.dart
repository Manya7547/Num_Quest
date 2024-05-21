import 'dart:math';
import 'package:flutter/material.dart';

void main() {
  runApp(ChooseFactorsGame());
}

class ChooseFactorsGame extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Select the factors of the given number',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
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
  String feedback = '';

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
      List<int> factors = _calculateFactors(generatedNumber);
      bool isCorrect = true;
      for (int factor in factors) {
        if (!selectedFactors.contains(factor)) {
          isCorrect = false;
          break;
        }
      }
      if (isCorrect && factors.length == selectedFactors.length) {
        feedback = 'Correct!';
      } else {
        feedback = 'Incorrect!';
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
              title: Text('Game Over'),
              content: Text('Thanks for playing!'),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                    resetGame();
                  },
                  child: Text('Play Again'),
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
      generateRound();
    });
  }

  @override
  void initState() {
    super.initState();
    generateRound();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Choose factors of the given number',
          style: TextStyle(fontSize: 20), // Increased font size
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image:
                AssetImage('/Users/manyasohal/num_quest/assets/classboard.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Round $roundNumber',
                style: TextStyle(fontSize: 24), // Increased font size
              ),
              SizedBox(height: 30),
              Text(
                'Select the Factors of $generatedNumber',
                style: TextStyle(fontSize: 20), // Increased font size
              ),
              SizedBox(height: 30),
              Padding(
                padding: const EdgeInsets.fromLTRB(100, 20, 100, 0),
                child: GridView.count(
                  crossAxisCount: 10,
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
                        style: TextStyle(fontSize: 16), // Increased font size
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: selectedFactors.contains(index + 1)
                            ? Colors.green
                            : null,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: checkAnswer,
                child: Text(
                  'Check',
                  style: TextStyle(fontSize: 18), // Increased font size
                ),
              ),
              SizedBox(height: 10),
              ElevatedButton(
                onPressed: nextRound,
                child: Text(
                  'Next Round',
                  style: TextStyle(fontSize: 18), // Increased font size
                ),
              ),
              SizedBox(height: 10),
              ElevatedButton(
                onPressed: resetGame,
                child: Text(
                  'Reset Game',
                  style: TextStyle(fontSize: 18), // Increased font size
                ),
              ),
              SizedBox(height: 20),
              Text(
                feedback,
                style: TextStyle(fontSize: 20), // Increased font size
              ),
            ],
          ),
        ),
      ),
    );
  }
}
