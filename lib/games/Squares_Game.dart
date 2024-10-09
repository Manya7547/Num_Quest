import 'package:flutter/material.dart';
import 'dart:math';

void main() => runApp(PerfectSquareFinder());

class PerfectSquareFinder extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Perfect Square Finder')),
        body: SquareFinderGame(),
      ),
    );
  }
}

class SquareFinderGame extends StatefulWidget {
  @override
  _SquareFinderGameState createState() => _SquareFinderGameState();
}

class _SquareFinderGameState extends State<SquareFinderGame> {
  List<int> numbers = []; // Initialize as an empty list
  List<int> draggedNumbers = [];
  int score = 0;

  @override
  void initState() {
    super.initState();

    // Add perfect squares to the list
    List<int> perfectSquares = [1, 4, 9, 16, 25];
    numbers.addAll(perfectSquares);

    // Generate random numbers until the total count is 20
    while (numbers.length < 20) {
      int randomNum = Random().nextInt(25) + 1; // Random numbers from 1 to 25
      if (!numbers.contains(randomNum)) {
        numbers.add(randomNum);
      }
    }
    numbers.shuffle(); // Shuffle the numbers for randomness
  }

  bool isPerfectSquare(int number) {
    int sqrtValue = sqrt(number).toInt();
    return sqrtValue * sqrtValue == number;
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Background image
        Positioned.fill(
          child: Image.asset(
            'assets/background1.jpg', // Add your background image here
            fit: BoxFit.cover,
          ),
        ),
        Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'Find and drop the perfect squares!',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.black54),
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Score: $score',
              style: TextStyle(fontSize: 20, color: Colors.black54),
            ),
            Expanded(
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 5, // More boxes in a row for smaller size
                  crossAxisSpacing: 8,
                  mainAxisSpacing: 8,
                ),
                itemCount: numbers.length,
                itemBuilder: (context, index) {
                  final number = numbers[index];
                  return Draggable<int>(
                    data: number,
                    feedback: Material(
                      child: Container(
                        padding: EdgeInsets.all(4), // Reduced padding for smaller size
                        constraints: BoxConstraints(
                          maxHeight: 40.0, // Smaller height for draggable feedback
                          maxWidth: 40.0,  // Smaller width
                        ),
                        decoration: BoxDecoration(
                          color: Colors.blueAccent,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Center(
                          child: Text(
                            '$number',
                            style: TextStyle(color: Colors.black54, fontSize: 18),
                          ),
                        ),
                      ),
                    ),
                    childWhenDragging: Container(
                      color: Colors.grey,
                      child: Center(
                        child: Text('$number', style: TextStyle(fontSize: 20)),
                      ),
                    ),
                    child: Container(
                      padding: EdgeInsets.all(4), // Reduced padding
                      constraints: BoxConstraints(
                        maxHeight: 40.0, // Reduced height
                        maxWidth: 40.0,  // Reduced width
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white70.withOpacity(0.8),
                        borderRadius: BorderRadius.circular(8), // Slightly reduced border radius
                        boxShadow: [BoxShadow(color: Colors.black38, blurRadius: 3)], // Softer shadow
                      ),
                      child: Center(
                        child: Text(
                          '$number',
                          style: TextStyle(fontSize: 18, color: Colors.black),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
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
                  height: 130, // Reduced height for drop box
                  width: double.infinity,
                  margin: EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.greenAccent.withOpacity(0.8),
                    borderRadius: BorderRadius.circular(20), // Rounded corners
                    border: Border.all(color: Colors.white, width: 2), // White border
                    boxShadow: [BoxShadow(color: Colors.black45, blurRadius: 8)], // Elevated shadow
                  ),
                  child: Center(
                    child: Text(
                      'Drop perfect squares here',
                      style: TextStyle(fontSize: 22, color: Colors.white),
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ],
    );
  }
}
