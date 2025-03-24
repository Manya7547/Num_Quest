import 'dart:math';
import 'package:flutter/material.dart';

void main() {
  runApp(EvenOddSortApp());
}

class EvenOddSortApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Even Odd Sort',
      home: EvenOddSortPage(),
    );
  }
}

class EvenOddSortPage extends StatefulWidget {
  @override
  _EvenOddSortPageState createState() => _EvenOddSortPageState();
}

class _EvenOddSortPageState extends State<EvenOddSortPage> {
  List<int> evenNumbers = [];
  List<int> oddNumbers = [];
  List<int> bottomNumbers = List.generate(6, (index) => Random().nextInt(99) + 1);
  bool? isCorrect;
  int score = 0;
  bool _isEnglish = true;

  // Convert numbers to words
  String numberToText(int number) {
    const List<String> units = [
      'zero', 'one', 'two', 'three', 'four', 'five', 'six', 'seven', 'eight', 'nine', 'ten',
      'eleven', 'twelve', 'thirteen', 'fourteen', 'fifteen', 'sixteen', 'seventeen', 'eighteen', 'nineteen'
    ];
    const List<String> tens = [
      '', '', 'twenty', 'thirty', 'forty', 'fifty', 'sixty', 'seventy', 'eighty', 'ninety'
    ];
    if (number < 20) return units[number];
    if (number < 100) {
      return tens[number ~/ 10] + (number % 10 != 0 ? ' ${units[number % 10]}' : '');
    }
    return number.toString();
  }

  // Translation helper
  String _translateText(String text) {
    Map<String, String> translations = {
      'Even Odd Sort': 'Ordenar Par-Impar',
      'Drag and drop each number to its correct group.': 'Arrastra y suelta cada número en su grupo correcto.',
      'Score:': 'Puntuación:',
      'EVEN': 'PAR',
      'ODD': 'IMPAR',
      'Check': 'Verificar',
      'Correct!': '¡Correcto!',
      'Incorrect. Try again!': 'Incorrecto. ¡Inténtalo de nuevo!',
      'Next Game': 'Siguiente Juego',
      'Tap to Translate': 'Toca para Traducir',
    };
    return _isEnglish ? text : (translations[text] ?? text);
  }

  void checkNumbers() {
    bool allEvenSorted = evenNumbers.every((number) => number.isEven);
    bool allOddSorted = oddNumbers.every((number) => !number.isEven);
    isCorrect = bottomNumbers.every((number) => number.isEven)
        ? allEvenSorted && allOddSorted
        : !allEvenSorted && !allOddSorted;
    if (isCorrect == true) {
      score += 10;
    }
    setState(() {});
  }

  void newGame() {
    setState(() {
      evenNumbers.clear();
      oddNumbers.clear();
      bottomNumbers = List.generate(6, (index) => Random().nextInt(99) + 1);
      isCorrect = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    bool isTablet = screenWidth > 600;

    return Scaffold(
      appBar: AppBar(
        title: Text(_translateText('Even Odd Sort')),
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
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05, vertical: screenHeight * 0.02),
        child: Column(
          children: [
            Text(
              _translateText('Drag and drop each number to its correct group.'),
              style: TextStyle(fontSize: isTablet ? 28 : 22, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: screenHeight * 0.02),
            Text(
              '${_translateText("Score:")} $score',
              style: TextStyle(fontSize: isTablet ? 26 : 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: screenHeight * 0.02),

            // Even & Odd Drop Zones
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: _buildDropZone(
                      label: _translateText("EVEN"),
                      numbers: evenNumbers,
                      color: Colors.green,
                      isEven: true,
                    ),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: _buildDropZone(
                      label: _translateText("ODD"),
                      numbers: oddNumbers,
                      color: Colors.blue,
                      isEven: false,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: screenHeight * 0.02),

            // Numbers to Drag
            Wrap(
              spacing: 15,
              runSpacing: 15,
              alignment: WrapAlignment.center,
              children: bottomNumbers.map((number) => _buildDraggableNumber(number)).toList(),
            ),
            SizedBox(height: screenHeight * 0.02),

            // Buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildButton(_translateText('Check'), checkNumbers, Colors.orange),
                _buildButton(_translateText('Next Game'), newGame, Colors.red),
              ],
            ),
            SizedBox(height: screenHeight * 0.02),
          ],
        ),
      ),
    );
  }

  // Build Drop Zone
  Widget _buildDropZone({required String label, required List<int> numbers, required Color color, required bool isEven}) {
    return DragTarget<int>(
      builder: (context, candidateData, rejectedData) {
        return Container(
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(color: color, borderRadius: BorderRadius.circular(15)),
          child: Center(
            child: Text(
              '$label\n${numbers.map((number) => '$number (${numberToText(number)})').join(", ")}',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
              textAlign: TextAlign.center,
            ),
          ),
        );
      },
      onAccept: (number) {
        setState(() {
          if (isEven && number.isEven) evenNumbers.add(number);
          if (!isEven && !number.isEven) oddNumbers.add(number);
          bottomNumbers.remove(number);
        });
      },
    );
  }

  // Build Draggable Number
  Widget _buildDraggableNumber(int number) {
    return Draggable<int>(
      data: number,
      child: _buildNumberBox(number, Colors.pink),
      feedback: Material(child: _buildNumberBox(number, Colors.pink.withOpacity(0.5))),
      childWhenDragging: Container(),
    );
  }

  // Build Number Box
  Widget _buildNumberBox(int number, Color color) {
    return Container(
      width: 60,
      height: 60,
      decoration: BoxDecoration(color: color, borderRadius: BorderRadius.circular(10)),
      alignment: Alignment.center,
      child: Text('$number\n(${numberToText(number)})', style: TextStyle(fontSize: 14, color: Colors.white), textAlign: TextAlign.center),
    );
  }

  // Build Button
  Widget _buildButton(String text, VoidCallback onPressed, Color color) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(backgroundColor: color, padding: EdgeInsets.symmetric(vertical: 15, horizontal: 30)),
      child: Text(text, style: TextStyle(fontSize: 18, color: Colors.white)),
    );
  }
}
