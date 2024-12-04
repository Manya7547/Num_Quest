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
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'Which of the following is NOT an odd number?\n'
                      '225\n'
                      '233\n'
                      '370\n'
                      '391',
                      style: TextStyle(fontSize: 18),
                      textAlign: TextAlign.left,
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
                        _checkAnswer(_controller1.text, '370');
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
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'Which number is an even number?\n'
                      '23\n'
                      '19\n'
                      '24\n'
                      '31',
                      style: TextStyle(fontSize: 18),
                      textAlign: TextAlign.left,
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
                        _checkAnswer(_controller2.text, '24');
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
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'Which is a set of EVEN numbers?\n'
                      '96, 107, 128, 139\n'
                      '85, 97, 119, 211\n'
                      '106, 148, 190, 202\n'
                      '112, 153, 188, 216',
                      style: TextStyle(fontSize: 18),
                      textAlign: TextAlign.left,
                    ),
                    TextField(
                      controller: _controller3,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        labelText: 'Enter your answer',
                        border: OutlineInputBorder(),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        _checkAnswer(_controller3.text, '106, 148, 190, 202');
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
