import 'dart:math';
import 'package:flutter/material.dart';

void main() {
  runApp(PrimeNumberGame());
}

class PrimeNumberGame extends StatelessWidget {
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
        title: Text('Prime Explorer'),
      ),
      body: PrimeNumberGrid(), // Integrate PrimeNumberGrid widget here
    );
  }
}

class PrimeNumberGrid extends StatefulWidget {
  @override
  _PrimeNumberGridState createState() => _PrimeNumberGridState();
}

class _PrimeNumberGridState extends State<PrimeNumberGrid> {
  List<int> numbers = [];
  List<int> selectedIndices = []; // Store indices of selected numbers
  bool showResult = false;

  @override
  void initState() {
    super.initState();
    generateRandomNumbers();
  }

  void generateRandomNumbers() {
    final random = Random();
    numbers = List.generate(15, (_) => random.nextInt(100) + 1);
    selectedIndices
        .clear(); // Clear selected indices when generating new numbers
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
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Select all the prime numbers:',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        Expanded(
          child: Center(
            child: GridView.builder(
              shrinkWrap: true,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 5, // Adjust the number of columns here
                childAspectRatio: 1.2, // Adjust the aspect ratio
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
                    margin: EdgeInsets.all(5),
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: selectedIndices.contains(index)
                          ? Colors.yellow
                          : Colors.blue,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(
                      child: Text(
                        '${numbers[index]}',
                        style: TextStyle(
                          fontSize: 16, // Decreased font size
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
        ),
        ElevatedButton(
          onPressed: () {
            checkResult();
          },
          child: Text('Check'),
        ),
        SizedBox(height: 10),
        showResult
            ? Text(
                selectedIndices.every((index) => isPrime(numbers[index]))
                    ? 'Correct'
                    : 'Incorrect',
                style: TextStyle(fontSize: 30),
              )
            : SizedBox(),
      ],
    );
  }
}
