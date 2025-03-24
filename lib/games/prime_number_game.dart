import 'dart:math';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: PrimeNumberGame(),
  ));
}

class PrimeNumberGame extends StatefulWidget {
  @override
  _PrimeNumberGameState createState() => _PrimeNumberGameState();
}

class _PrimeNumberGameState extends State<PrimeNumberGame> {
  bool _isEnglish = true; // Track language state
  List<int> numbers = [];
  List<int> selectedIndices = [];
  bool showResult = false;
  int score = 0;

  @override
  void initState() {
    super.initState();
    generateRandomNumbers();
  }

  void generateRandomNumbers() {
    final random = Random();
    numbers = List.generate(15, (_) => random.nextInt(100) + 1);
    selectedIndices.clear();
    showResult = false;
  }

  bool isPrime(int n) {
    if (n <= 1) return false;
    if (n == 2) return true;
    if (n % 2 == 0) return false;
    for (int i = 3; i <= sqrt(n); i += 2) {
      if (n % i == 0) return false;
    }
    return true;
  }

  void checkResult() {
    setState(() {
      showResult = true;
      bool allCorrect = selectedIndices.every((index) => isPrime(numbers[index])) &&
          selectedIndices.length == numbers.where((num) => isPrime(num)).length;

      if (allCorrect) {
        score += 10;
      }
    });
  }

  // Toggle Language
  void toggleLanguage() {
    setState(() {
      _isEnglish = !_isEnglish;
    });
  }

  // **Updated Translation Function**
  String _translateText(String text) {
    Map<String, String> translations = {
      'Prime Explorer': 'Explorador de Primos',
      'Score:': 'Puntuación:',
      'Select all the prime numbers:': 'Selecciona todos los números primos:',
      'Check': 'Verificar',
      'Correct': '¡Correcto!',
      'Incorrect': '¡Incorrecto!',
      'Next Round': 'Siguiente Ronda',
      'Tap to Translate': 'Toca para Traducir',
    };
    return _isEnglish ? text : (translations[text] ?? text);
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    bool isTablet = screenWidth > 600;

    return Scaffold(
      appBar: AppBar(
        title: Text(_translateText('Prime Explorer')),
        actions: [
          IconButton(
            icon: Icon(Icons.translate),
            onPressed: toggleLanguage,
          ),
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: 20),
          Text(
            '${_translateText("Score:")} $score',
            style: TextStyle(fontSize: isTablet ? 28 : 22, fontWeight: FontWeight.bold, color: Colors.black87),
          ),
          SizedBox(height: 10),
          Text(
            _translateText('Select all the prime numbers:'),
            style: TextStyle(fontSize: isTablet ? 24 : 18, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10),

          Expanded(
            child: GridView.builder(
              padding: EdgeInsets.all(15),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: isTablet ? 6 : 4,
                childAspectRatio: 1.1,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
              ),
              itemCount: numbers.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    setState(() {
                      if (selectedIndices.contains(index)) {
                        selectedIndices.remove(index);
                      } else {
                        selectedIndices.add(index);
                      }
                    });
                  },
                  child: Container(
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: selectedIndices.contains(index) ? Colors.orange : Colors.blueAccent,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(
                      child: Text(
                        '${numbers[index]}',
                        style: TextStyle(
                          fontSize: isTablet ? 24 : 18,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),

          ElevatedButton(
            onPressed: checkResult,
            style: ElevatedButton.styleFrom(
              padding: EdgeInsets.symmetric(vertical: 12, horizontal: 30),
              backgroundColor: Colors.green,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            ),
            child: Text(_translateText('Check'), style: TextStyle(fontSize: isTablet ? 22 : 18, color: Colors.white)),
          ),

          SizedBox(height: 10),
          showResult
              ? Text(
                  selectedIndices.every((index) => isPrime(numbers[index])) &&
                          selectedIndices.length == numbers.where((num) => isPrime(num)).length
                      ? _translateText('Correct')
                      : _translateText('Incorrect'),
                  style: TextStyle(
                    fontSize: isTablet ? 26 : 22,
                    fontWeight: FontWeight.bold,
                    color: selectedIndices.every((index) => isPrime(numbers[index]))
                        ? Colors.green
                        : Colors.red,
                  ),
                )
              : SizedBox(),

          SizedBox(height: 15),
          ElevatedButton(
            onPressed: () {
              setState(() {
                generateRandomNumbers();
              });
            },
            style: ElevatedButton.styleFrom(
              padding: EdgeInsets.symmetric(vertical: 12, horizontal: 30),
              backgroundColor: Colors.blue,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            ),
            child: Text(_translateText('Next Round'), style: TextStyle(fontSize: isTablet ? 22 : 18, color: Colors.white)),
          ),

          SizedBox(height: 20),
        ],
      ),
    );
  }
}
