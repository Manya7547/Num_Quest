import 'dart:math';
import 'package:flutter/material.dart';

void main() => runApp(PerfectSquareFinder());

class PerfectSquareFinder extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SquareFinderGame(),
    );
  }
}

class SquareFinderGame extends StatefulWidget {
  @override
  _SquareFinderGameState createState() => _SquareFinderGameState();
}

class _SquareFinderGameState extends State<SquareFinderGame> {
  List<int> numbers = [];
  List<int> draggedNumbers = [];
  int score = 0;
  bool _isEnglish = true; // Language toggle state

  @override
  void initState() {
    super.initState();
    List<int> perfectSquares = [1, 4, 9, 16, 25, 36, 49];
    numbers.addAll(perfectSquares);

    while (numbers.length < 12) {
      int randomNum = Random().nextInt(50) + 1;
      if (!numbers.contains(randomNum)) {
        numbers.add(randomNum);
      }
    }
    numbers.shuffle();
  }

  bool isPerfectSquare(int number) {
    int sqrtValue = sqrt(number).toInt();
    return sqrtValue * sqrtValue == number;
  }

  String _translateText(String text) {
    Map<String, String> translations = {
      'Perfect Square Finder': 'Buscador de Cuadrados Perfectos',
      'Find and drop the perfect squares!': '¡Encuentra y suelta los cuadrados perfectos!',
      'Score:': 'Puntuación:',
      'Drop perfect squares here': 'Suelta los cuadrados perfectos aquí',
      'Tap to Translate': 'Toca para Traducir',
    };
    return _isEnglish ? text : (translations[text] ?? text);
  }

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;
    final bool isTablet = screenWidth > 600;

    return Scaffold(
      appBar: AppBar(
        title: Text(_translateText('Perfect Square Finder')),
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
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              'assets/background1.jpg',
              fit: BoxFit.cover,
            ),
          ),
          Center(
            child: Padding(
              padding: EdgeInsets.all(screenWidth * 0.05),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    _translateText('Find and drop the perfect squares!'),
                    style: TextStyle(fontSize: isTablet ? 36 : 24, fontWeight: FontWeight.bold, color: Colors.black54),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: screenHeight * 0.02),
                  Text(
                    '${_translateText("Score:")} $score',
                    style: TextStyle(fontSize: isTablet ? 30 : 20, color: Colors.black54),
                  ),
                  SizedBox(height: screenHeight * 0.02),

                  // 🔹 Grid of numbers (fits perfectly)
                  Wrap(
                    spacing: screenWidth * 0.02,
                    runSpacing: screenHeight * 0.02,
                    children: numbers.map((number) {
                      return Draggable<int>(
                        data: number,
                        feedback: Material(
                          color: Colors.transparent,
                          child: Container(
                            width: isTablet ? 80 : 60,
                            height: isTablet ? 80 : 60,
                            decoration: BoxDecoration(
                              color: Colors.blueAccent,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Center(
                              child: Text(
                                '$number',
                                style: TextStyle(fontSize: isTablet ? 26 : 18, color: Colors.white),
                              ),
                            ),
                          ),
                        ),
                        childWhenDragging: Container(
                          width: isTablet ? 80 : 60,
                          height: isTablet ? 80 : 60,
                          color: Colors.grey.shade300,
                          child: Center(
                            child: Text(
                              '$number',
                              style: TextStyle(fontSize: isTablet ? 26 : 18, color: Colors.black54),
                            ),
                          ),
                        ),
                        child: Container(
                          width: isTablet ? 80 : 60,
                          height: isTablet ? 80 : 60,
                          decoration: BoxDecoration(
                            color: Colors.white70,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Center(
                            child: Text(
                              '$number',
                              style: TextStyle(fontSize: isTablet ? 26 : 18, color: Colors.black),
                            ),
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                  SizedBox(height: screenHeight * 0.04),

                  // 🔹 Drop area (Fully responsive)
                  DragTarget<int>(
                    onAccept: (int number) {
                      if (isPerfectSquare(number)) {
                        setState(() {
                          draggedNumbers.add(number);
                          numbers.remove(number);
                          score++;
                        });
                      }
                    },
                    builder: (context, accepted, rejected) {
                      return Container(
                        height: screenHeight * 0.15,
                        width: screenWidth * 0.8,
                        decoration: BoxDecoration(
                          color: Colors.greenAccent.withOpacity(0.8),
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(color: Colors.white, width: 2),
                          boxShadow: [BoxShadow(color: Colors.black45, blurRadius: 8)],
                        ),
                        child: Center(
                          child: Text(
                            _translateText('Drop perfect squares here'),
                            style: TextStyle(fontSize: isTablet ? 30 : 22, color: Colors.white),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
