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
  List<int> bottomNumbers =
      List.generate(6, (index) => Random().nextInt(99) + 1);
  bool? isCorrect;
  int score = 0; // Track the score

  // Method to convert numbers to their textual form
  String numberToText(int number) {
    const List<String> units = [
      'zero',
      'one',
      'two',
      'three',
      'four',
      'five',
      'six',
      'seven',
      'eight',
      'nine',
      'ten',
      'eleven',
      'twelve',
      'thirteen',
      'fourteen',
      'fifteen',
      'sixteen',
      'seventeen',
      'eighteen',
      'nineteen'
    ];
    const List<String> tens = [
      '',
      '',
      'twenty',
      'thirty',
      'forty',
      'fifty',
      'sixty',
      'seventy',
      'eighty',
      'ninety'
    ];

    if (number < 20) return units[number];
    if (number < 100) {
      return tens[number ~/ 10] +
          (number % 10 != 0 ? ' ${units[number % 10]}' : '');
    }
    return number.toString(); // Return number as string if 100 or more
  }

  void checkNumbers() {
    // Check if all bottom numbers are sorted correctly
    bool allEvenSorted = evenNumbers.every((number) => number.isEven);
    bool allOddSorted = oddNumbers.every((number) => !number.isEven);

    isCorrect = bottomNumbers.every((number) => number.isEven)
        ? allEvenSorted && allOddSorted
        : !allEvenSorted && !allOddSorted;

    if (isCorrect == true) {
      score += 10; // Increment score if the sorting is correct
    }

    setState(() {});
  }

  void newGame() {
    setState(() {
      evenNumbers.clear();
      oddNumbers.clear();
      bottomNumbers = List.generate(6, (index) => Random().nextInt(99) + 1);
      isCorrect = null; // Reset correctness status
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context); // Navigate back to the previous page
          },
        ),
        title: Text('Even Odd Sort'),
      ),
      body: Column(
        children: [
          SizedBox(height: 50),
          Text(
            'Drag and drop each number to its correct group.',
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
          ),
          Text(
            'Score: $score',
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 20),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                // EVEN grid
                DragTarget<int>(
                  builder: (context, candidateData, rejectedData) {
                    return Container(
                      width: 400,
                      height: 400,
                      color: Colors.green,
                      alignment: Alignment.center,
                      child: Text(
                        'EVEN\n${evenNumbers.map((number) => '${number} (${numberToText(number)})').join(", ")}',
                        style: TextStyle(
                            fontSize: 30, fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,
                      ),
                    );
                  },
                  onAccept: (number) {
                    setState(() {
                      evenNumbers.add(number);
                      bottomNumbers.remove(number);
                    });
                  },
                ),
                // ODD grid
                DragTarget<int>(
                  builder: (context, candidateData, rejectedData) {
                    return Container(
                      width: 400,
                      height: 400,
                      color: Colors.blue,
                      alignment: Alignment.center,
                      child: Text(
                        'ODD\n${oddNumbers.map((number) => '${number} (${numberToText(number)})').join(", ")}',
                        style: TextStyle(
                            fontSize: 30, fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,
                      ),
                    );
                  },
                  onAccept: (number) {
                    setState(() {
                      oddNumbers.add(number);
                      bottomNumbers.remove(number);
                    });
                  },
                ),
              ],
            ),
          ),
          SizedBox(height: 20),
          // Display the 6 random numbers at the bottom
          Padding(
            padding: const EdgeInsets.only(bottom: 50.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: bottomNumbers.map((number) {
                return Draggable<int>(
                  data: number,
                  child: Container(
                    width: 160,
                    height: 160,
                    color: Colors.pink,
                    alignment: Alignment.center,
                    child: Text(
                      '$number (${numberToText(number)})',
                      style: TextStyle(fontSize: 30, color: Colors.white),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  feedback: Container(
                    width: 100,
                    height: 100,
                    color: Colors.pink.withOpacity(0.5),
                    alignment: Alignment.center,
                    child: Text(
                      '$number (${numberToText(number)})',
                      style: TextStyle(fontSize: 30, color: Colors.white),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  childWhenDragging: Container(),
                );
              }).toList(),
            ),
          ),
          SizedBox(height: 10), // Add spacing between the boxes and the button
          // Check button
          ElevatedButton(
            onPressed: () {
              checkNumbers();
            },
            child: Text('Check', style: TextStyle(fontSize: 40)),
          ),
          // Display correctness status after checking numbers
          if (isCorrect != null)
            SizedBox(
              height: 100,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 40.0),
                child: Text(
                  isCorrect! ? 'Correct!' : 'Incorrect. Try again!',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 45,
                    fontWeight: FontWeight.bold,
                    color: isCorrect! ? Colors.green : Colors.red,
                  ),
                ),
              ),
            ),
          // New Game button
          SizedBox(height: 20), // Add spacing
          ElevatedButton(
            onPressed: () {
              newGame();
            },
            child: Text('Next Game', style: TextStyle(fontSize: 40)),
          ),
        ],
      ),
    );
  }
}
