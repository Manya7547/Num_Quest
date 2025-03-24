import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PrimeNumberPracticePage extends StatefulWidget {
  @override
  _PrimeNumberPracticePageState createState() =>
      _PrimeNumberPracticePageState();
}

class _PrimeNumberPracticePageState extends State<PrimeNumberPracticePage> {
  bool _isEnglish = true; // Language state
  List<Map<String, dynamic>> _examples = [];
  final List<Map<String, dynamic>> _allExamples = [
    {
      'question_en': 'Which of the following is a prime number?',
      'question_es': '¿Cuál de los siguientes es un número primo?',
      'options': ['4 (four)', '6 (six)', '2 (two)'],
      'answer': '2 (two)',
    },
    {
      'question_en': 'Which of the following is not a prime number?',
      'question_es': '¿Cuál de los siguientes no es un número primo?',
      'options': ['2 (two)', '3 (three)', '9 (nine)'],
      'answer': '9 (nine)',
    },
    {
      'question_en': 'How many prime numbers are there between 10 and 25?',
      'question_es': '¿Cuántos números primos hay entre 10 y 25?',
      'options': ['5 (five)', '4 (four)', '3 (three)'],
      'answer': '5 (five)',
    },
  ];

  @override
  void initState() {
    super.initState();
    _refreshExamples();
  }

  void _refreshExamples() {
    setState(() {
      _examples = (_allExamples.toList()..shuffle()).take(3).toList();
    });
  }

  void _checkAnswer(String selectedOption, String correctAnswer) {
    final bool isCorrect = selectedOption == correctAnswer;
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: Text(isCorrect ? '✅ Correct!' : '❌ Try Again!'),
        content: Text(isCorrect
            ? 'Good job! You selected the correct answer.'
            : 'Oops! That is incorrect. Try again!'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: Text('OK'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    bool isTablet = screenWidth > 600;

    return Scaffold(
      appBar: AppBar(
        title: Text(_isEnglish
            ? 'Prime Number Practice'
            : 'Práctica de Números Primos'),
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
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/background1.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: EdgeInsets.all(screenWidth * 0.05),
          child: Column(
            children: <Widget>[
              Text(
                _isEnglish
                    ? 'Select the correct answer'
                    : 'Selecciona la respuesta correcta',
                style: GoogleFonts.lato(
                  textStyle: TextStyle(
                    fontSize: isTablet ? 32 : 24,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    shadows: [
                      Shadow(
                        offset: const Offset(5.0, 5.0),
                        blurRadius: 3.0,
                        color: Colors.grey.withOpacity(0.5),
                      ),
                    ],
                  ),
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 20),
              Expanded(
                child: ListView.builder(
                  itemCount: _examples.length,
                  itemBuilder: (context, index) {
                    return _buildQuestionCard(
                      question: _isEnglish
                          ? _examples[index]['question_en']
                          : _examples[index]['question_es'],
                      options: _examples[index]['options'],
                      answer: _examples[index]['answer'],
                    );
                  },
                ),
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: _refreshExamples,
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.symmetric(
                          horizontal: 20, vertical: 15),
                      backgroundColor: Colors.lightBlueAccent.shade200,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    child: Text(
                      _isEnglish ? 'More Examples' : 'Más ejemplos',
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        _isEnglish = !_isEnglish;
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.symmetric(
                          horizontal: 20, vertical: 15),
                      backgroundColor: Colors.amber.shade700,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    child: Text(
                      _isEnglish ? 'Tap to Translate' : 'Toca para Traducir',
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildQuestionCard({
    required String question,
    required List<String> options,
    required String answer,
  }) {
    double screenWidth = MediaQuery.of(context).size.width;
    bool isTablet = screenWidth > 600;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Center(
        child: Container(
          width: screenWidth * 0.85,
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.9),
            borderRadius: BorderRadius.circular(15.0),
            boxShadow: [BoxShadow(color: Colors.grey, blurRadius: 4)],
          ),
          padding: EdgeInsets.all(20),
          child: Column(
            children: [
              Text(
                question,
                style: TextStyle(
                  fontSize: isTablet ? 26 : 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.black54,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 15),
              Column(
                children: options.map((option) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5.0),
                    child: ElevatedButton(
                      onPressed: () {
                        _checkAnswer(option, answer);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.teal,
                        padding: EdgeInsets.symmetric(
                            horizontal: 20, vertical: 15),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: Text(
                        option,
                        style: TextStyle(fontSize: 20, color: Colors.white),
                      ),
                    ),
                  );
                }).toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
