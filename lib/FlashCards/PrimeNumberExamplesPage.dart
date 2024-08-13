import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PrimeNumberPracticePage extends StatefulWidget {
  @override
  _PrimeNumberPracticePageState createState() =>
      _PrimeNumberPracticePageState();
}

class _PrimeNumberPracticePageState extends State<PrimeNumberPracticePage> {
  bool _isEnglish = true; // State to keep track of language
  List<Map<String, dynamic>> _examples = [];
  final List<Map<String, dynamic>> _allExamples = [
    {
      'question_en': 'Which of the following is a prime number?',
      'question_es': '¿Cuál de los siguientes es un número primo?',
      'options': ['4', '6', '2'],
      'answer': '2',
    },
    {
      'question_en': 'Which of the following is not a prime number?',
      'question_es': '¿Cuál de los siguientes no es un número primo?',
      'options': ['2', '3', '9'],
      'answer': '9',
    },
    {
      'question_en': 'How many prime numbers are there between 10 and 25?',
      'question_es': '¿Cuántos números primos hay entre 10 y 25?',
      'options': ['5', '4', '3'],
      'answer': '5',
    },
    {
      'question_en':
          'Which of these is a list of prime numbers between 61 and 75?',
      'question_es':
          '¿Cuál de estas es una lista de números primos entre 61 y 75?',
      'options': ['61, 67, 71, 73', '67, 71, 73', '63, 67, 71'],
      'answer': '67, 71, 73',
    },
    {
      'question_en': 'How many prime numbers are there between 0 and 100?',
      'question_es': '¿Cuántos números primos hay entre 0 y 100?',
      'options': ['26', '24', '25'],
      'answer': '25',
    },
    {
      'question_en':
          'English: What is the smallest prime number greater than 20?',
      'question_es': '¿Cuál es el número primo más pequeño mayor que 20?',
      'options': ['23', '19', '21'],
      'answer': '23',
    },
    {
      'question_en': ' How many prime numbers are there between 50 and 60?',
      'question_es': '¿Cuántos números primos hay entre 50 y 60?',
      'options': ['2', '1', '3'],
      'answer': '1',
    },
    {
      'question_en': 'What is the sum of the first three prime numbers?',
      'question_es': '¿Cuál es la suma de los primeros tres números primos?',
      'options': ['10', '12', '17'],
      'answer': '17',
    },

    // Add more questions here
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
    final message = selectedOption == correctAnswer ? 'Correct!' : 'Try Again!';
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: Text(message),
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
    return Scaffold(
      appBar: AppBar(
        title: Text(_isEnglish
            ? 'Prime Number Practice'
            : 'Práctica de Números Primos'),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/background1.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  _isEnglish
                      ? 'Select the correct answer'
                      : 'Selecciona la respuesta correcta',
                  style: GoogleFonts.lato(
                    textStyle: TextStyle(
                      fontSize: 38,
                      color: Colors.black,
                      fontFamily: 'Poppins',
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
                SizedBox(height: 30),
                Expanded(
                  child: ListView.builder(
                    itemCount: _examples.length,
                    itemBuilder: (context, index) {
                      return _buildQuestionCard(
                        _examples[index]['question_en']!,
                        _examples[index]['options'],
                        _examples[index]['answer']!,
                        _examples[index]['question_es']!,
                        _examples[index]['options'],
                        _examples[index]['answer']!,
                      );
                    },
                  ),
                ),
                SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                      onPressed: _refreshExamples,
                      style: ElevatedButton.styleFrom(
                        padding:
                            EdgeInsets.symmetric(horizontal: 30, vertical: 15),
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
                        padding:
                            EdgeInsets.symmetric(horizontal: 30, vertical: 15),
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
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildQuestionCard(
    String questionEn,
    List<String> options,
    String answer,
    String questionEs,
    List<String> optionsEs,
    String answerEs,
  ) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Center(
        child: Container(
          height: 200,
          width: MediaQuery.of(context).size.width *
              0.8, // Adjust width to be smaller
          decoration: BoxDecoration(
            color: Colors.white70,
            borderRadius: BorderRadius.circular(15.0),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                _isEnglish ? questionEn : questionEs,
                style: const TextStyle(fontSize: 25, color: Colors.black54),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: options.map((option) {
                  return ElevatedButton(
                    onPressed: () {
                      _checkAnswer(option, answer);
                    },
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 10),
                      backgroundColor: Colors.yellow.shade500,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: Text(
                      option,
                      style: TextStyle(fontSize: 20, color: Colors.white),
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
