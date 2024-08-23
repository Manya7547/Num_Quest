import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CompositeNumberPracticePage extends StatefulWidget {
  @override
  _CompositeNumberPracticePageState createState() =>
      _CompositeNumberPracticePageState();
}

class _CompositeNumberPracticePageState extends State<CompositeNumberPracticePage> {
  bool _isEnglish = true; // State to keep track of language
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
      'question_es': ' ¿Qué número no es un número compuesto?',
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
      'question_en': 'Which of the following numbers has more than two factors?',
      'question_es': '¿Cuál de los siguientes números tiene más de dos factores?',
      'options': ['24', '19', '13'],
      'answer': '24',
    },
    {
      'question_en': 'Which of these numbers is a composite number because it has factors other than 1 and itself?',
      'question_es': '¿Cuál de estos números es un número compuesto porque tiene factores diferentes de 1 y de sí mismo?',
      'options': ['6', '7', '5'],
      'answer': '6',
    },
    {
      'question_en': 'Identify the composite number that is a product of 2 and 5:',
      'question_es': 'Identifica el número compuesto que es producto de 2 y 5:',
      'options': ['15', '10', '25'],
      'answer': '10',
    },
    {
      'question_en': ' Which of the following is the smallest composite number?',
      'question_es': '¿Cuál de los siguientes es el número compuesto más pequeño?',
      'options': ['2', '1', '4'],
      'answer': '4',
    },
    {
      'question_en': 'Which number is composite because it can be factored into smaller prime numbers??',
      'question_es': '¿Qué número es compuesto porque se puede factorizar en números primos más pequeños?',
      'options': ['57', '51', '49'],
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
            ? 'Composite Number Practice'
            : 'Práctica de Números compuesto'),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('background1.jpg'),
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
          width: MediaQuery.of(context).size.width * 0.8, // Adjust width to be smaller
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
                      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
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
