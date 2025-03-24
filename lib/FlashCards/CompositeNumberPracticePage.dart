import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CompositeNumberPracticePage extends StatefulWidget {
  @override
  _CompositeNumberPracticePageState createState() =>
      _CompositeNumberPracticePageState();
}

class _CompositeNumberPracticePageState
    extends State<CompositeNumberPracticePage> {
  bool _isEnglish = true; // State to track language toggle
  List<Map<String, dynamic>> _examples = [];

  final List<Map<String, dynamic>> _allExamples = [
    {
      'question_en': 'Which of the following is a composite number?',
      'question_es': '¿Cuál de los siguientes es un número compuesto?',
      'options': ['7', '11', '15'],
      'answer': '15',
    },
    {
      'question_en': 'Which number is not a composite number?',
      'question_es': '¿Qué número no es un número compuesto?',
      'options': ['4', '13', '12'],
      'answer': '13',
    },
    {
      'question_en': 'What are the factors of the composite number 18?',
      'question_es': '¿Cuáles son los factores del número compuesto 18?',
      'options': ['1,18', '2,3,6,9', '1,2,3,6,9,18'],
      'answer': '1,2,3,6,9,18',
    },
    {
      'question_en': 'Which number has more than two factors?',
      'question_es': '¿Qué número tiene más de dos factores?',
      'options': ['24', '19', '13'],
      'answer': '24',
    },
    {
      'question_en': 'Identify the composite number (product of 2 and 5):',
      'question_es': 'Identifica el número compuesto (producto de 2 y 5):',
      'options': ['15', '10', '25'],
      'answer': '10',
    },
    {
      'question_en': 'Which of the following is the smallest composite number?',
      'question_es': '¿Cuál de los siguientes es el número compuesto más pequeño?',
      'options': ['2', '1', '4'],
      'answer': '4',
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
        content: Text(
          isCorrect
              ? 'Great job! You selected the correct composite number.'
              : 'Oops! That’s not correct. Try again!',
          style: TextStyle(fontSize: 18),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('OK', style: TextStyle(fontSize: 18)),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;
    final bool isTablet = screenWidth > 600; // Adjust UI for tablets

    return Scaffold(
      appBar: AppBar(
        title: Text(
          _isEnglish ? 'Composite Number Practice' : 'Práctica de Números Compuestos',
        ),
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
            padding: EdgeInsets.symmetric(
              horizontal: screenWidth * 0.05, // Scalable padding
              vertical: screenHeight * 0.02,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  _isEnglish
                      ? 'Select the correct answer'
                      : 'Selecciona la respuesta correcta',
                  style: GoogleFonts.lato(
                    textStyle: TextStyle(
                      fontSize: isTablet ? 32 : 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: screenHeight * 0.02),

                Expanded(
                  child: ListView.builder(
                    itemCount: _examples.length,
                    itemBuilder: (context, index) {
                      return _buildQuestionCard(
                        _isEnglish ? _examples[index]['question_en']! : _examples[index]['question_es']!,
                        _examples[index]['options'],
                        _examples[index]['answer']!,
                      );
                    },
                  ),
                ),

                SizedBox(height: screenHeight * 0.02),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _buildButton(
                      _isEnglish ? 'More Examples' : 'Más ejemplos',
                      Colors.blueAccent,
                      _refreshExamples,
                    ),
                    _buildButton(
                      _isEnglish ? 'Tap to Translate' : 'Toca para Traducir',
                      Colors.orange,
                      () {
                        setState(() {
                          _isEnglish = !_isEnglish;
                        });
                      },
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

  Widget _buildQuestionCard(String question, List<String> options, String answer) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Container(
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: Colors.white70,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [BoxShadow(color: Colors.grey.withOpacity(0.3), blurRadius: 5)],
        ),
        child: Column(
          children: [
            Text(
              question,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 15),
            Wrap(
              spacing: 10,
              runSpacing: 10,
              alignment: WrapAlignment.center,
              children: options.map((option) {
                return ElevatedButton(
                  onPressed: () {
                    _checkAnswer(option, answer);
                  },
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    backgroundColor: Colors.green.shade500,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: Text(
                    option,
                    style: const TextStyle(fontSize: 18, color: Colors.white),
                  ),
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildButton(String text, Color color, VoidCallback onPressed) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
        backgroundColor: color,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
      child: Text(
        text,
        style: const TextStyle(fontSize: 18, color: Colors.white),
      ),
    );
  }
}
