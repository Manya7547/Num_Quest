import 'package:flutter/material.dart';

class WordProblemPractice extends StatefulWidget {
  @override
  _WordProblemPracticeState createState() => _WordProblemPracticeState();
}

class _WordProblemPracticeState extends State<WordProblemPractice> {
  final TextEditingController _controller1 = TextEditingController();
  final TextEditingController _controller2 = TextEditingController();
  final TextEditingController _controller3 = TextEditingController();
  final String _answer1 = '4';
  final String _answer2 = '5';
  final String _answer3 = 'No';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Word Problem Practice'),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
                'assets/word_problem.jpg'), // Path to your background image
            fit: BoxFit.cover,
          ),
        ),
        child: ListView(
          padding: const EdgeInsets.all(8.0),
          children: <Widget>[
            // Problem 1
            Card(
              elevation: 4.0,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: <Widget>[
                    Text(
                      'There are 8 children in a room. If we divide them into two teams, '
                      'one with even numbered children and the other with odd numbered children, '
                      'how many children will be in the even numbered team?',
                      style: TextStyle(fontSize: 18),
                    ),
                    TextField(
                      controller: _controller1,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        labelText: 'Enter your answer',
                        border: OutlineInputBorder(),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        _checkAnswer(_controller1.text, _answer1);
                      },
                      child: Text('Check Answer'),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 16), // Spacer
            // Problem 2
            Card(
              elevation: 4.0,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: <Widget>[
                    Text(
                      'There are 9 apples in a basket. If we divide them into two groups, '
                      'one with even numbered apples and the other with odd numbered apples, '
                      'how many apples will be in the odd numbered group?',
                      style: TextStyle(fontSize: 18),
                    ),
                    TextField(
                      controller: _controller2,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        labelText: 'Enter your answer',
                        border: OutlineInputBorder(),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        _checkAnswer(_controller2.text, _answer2);
                      },
                      child: Text('Check Answer'),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 16), // Spacer
            // Problem 3
            Card(
              elevation: 4.0,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: <Widget>[
                    Text(
                      'Sarah has 7 pens, and Jack has 6 pens. '
                      'Together, do they have an even or an odd number of pens?',
                      style: TextStyle(fontSize: 18),
                    ),
                    TextField(
                      controller: _controller3,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        labelText: 'Enter your answer (Even/Odd)',
                        border: OutlineInputBorder(),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        _checkAnswer(_controller3.text, _answer3);
                      },
                      child: Text('Check Answer'),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _checkAnswer(String userAnswer, String correctAnswer) {
    if (userAnswer.trim().toLowerCase() == correctAnswer.toLowerCase()) {
      _showSnackBar('Correct Answer!');
    } else {
      _showSnackBar('Incorrect Answer! Try again.');
    }
  }

  void _showSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        duration: Duration(seconds: 2),
      ),
    );
  }
}
