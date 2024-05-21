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

  void checkNumbers() {
    // Check if all bottom numbers are sorted correctly
    isCorrect = bottomNumbers.every((number) => number.isEven)
        ? evenNumbers.every((number) => number.isEven) &&
            oddNumbers.every((number) => !number.isEven)
        : evenNumbers.every((number) => !number.isEven) &&
            oddNumbers.every((number) => number.isEven);
    setState(() {});
  }

  void resetGame() {
    setState(() {
      evenNumbers.clear();
      oddNumbers.clear();
      bottomNumbers = List.generate(6, (index) => Random().nextInt(99) + 1);
      isCorrect = null;
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
            'Drag and drop each number to its correct group. ',
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
                        'EVEN\n${evenNumbers.join(", ")}',
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
                        'ODD\n${oddNumbers.join(", ")}',
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
                    width: 100,
                    height: 100,
                    color: Colors.pink,
                    alignment: Alignment.center,
                    child: Text(
                      number.toString(),
                      style: TextStyle(fontSize: 30, color: Colors.white),
                    ),
                  ),
                  feedback: Container(
                    width: 100,
                    height: 100,
                    color: Colors.pink.withOpacity(0.5),
                    alignment: Alignment.center,
                    child: Text(
                      number.toString(),
                      style: TextStyle(fontSize: 30, color: Colors.white),
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
        ],
      ),
    );
  }
}
