import 'package:flutter/material.dart';
import 'package:flip_card/flip_card.dart';

class PrimeNumberPracticePage extends StatefulWidget {
  @override
  _PrimeNumberPracticePageState createState() =>
      _PrimeNumberPracticePageState();
}

class _PrimeNumberPracticePageState extends State<PrimeNumberPracticePage> {
  bool _isEnglish = true; // State to keep track of language
  List<Map<String, String>> _examples = [];
  final List<Map<String, String>> _allExamples = [
    {
      'question_en': 'A prime number can be divided by...',
      'answer_en': '1 and itself only',
      'question_es': 'Un número primo puede ser dividido por...',
      'answer_es': '1 y sí mismo solamente',
    },
    {
      'question_en': 'Which of the following is a prime number?\n13\n15\n21',
      'answer_en': '13',
      'question_es': '¿Cuál de los siguientes es un número primo?\n13\n15\n21',
      'answer_es': '13',
    },
    {
      'question_en': 'Which of the following is a prime number?\n4\n6\n2',
      'answer_en': '2',
      'question_es': '¿Cuál de los siguientes es un número primo?\n4\n6\n2',
      'answer_es': '2',
    },
    {
      'question_en': 'Which of the following is not a prime number?\n2\n3\n9',
      'answer_en': '9',
      'question_es': '¿Cuál de los siguientes no es un número primo?\n2\n3\n9',
      'answer_es': '9',
    },
    {
      'question_en':
      'Which of the following is the lowest prime number?\n1\n2\n3',
      'answer_en': '2',
      'question_es':
      '¿Cuál de los siguientes es el número primo más bajo?\n1\n2\n3',
      'answer_es': '2',
    },
    {
      'question_en':
      'Which of these is the best definition of a prime number?\nA number that wouldn’t be in any times table\nA number that has only 2 factors: 1 and itself\nAn odd number that doesn’t appear in any other times tables',
      'answer_en': 'A number that has only 2 factors: 1 and itself',
      'question_es':
      '¿Cuál de estas es la mejor definición de un número primo?\nUn número que no estaría en ninguna tabla de multiplicar\nUn número que solo tiene 2 factores: 1 y sí mismo\nUn número impar que no aparece en ninguna otra tabla de multiplicar',
      'answer_es': 'Un número que solo tiene 2 factores: 1 y sí mismo',
    },
    {
      'question_en': 'Which of these is a prime number?\n0\n1\n2',
      'answer_en': '2',
      'question_es': '¿Cuál de estos es un número primo?\n0\n1\n2',
      'answer_es': '2',
    },
    {
      'question_en':
      'How many prime numbers are there between 10 and 25?\n5\n4\n11 and 17',
      'answer_en': '5',
      'question_es':
      '¿Cuántos números primos hay entre 10 y 25?\n5\n4\n11 y 17',
      'answer_es': '5',
    },
    {
      'question_en':
      'Which of these is a list of prime numbers between 61 and 75?\n67, 71, 73\n61, 67, 71, 73\n63, 67, 71',
      'answer_en': '67, 71, 73',
      'question_es':
      '¿Cuál de estas es una lista de números primos entre 61 y 75?\n67, 71, 73\n61, 67, 71, 73\n63, 67, 71',
      'answer_es': '67, 71, 73',
    },
    {
      'question_en':
      'How many prime numbers are there between 0 and 100?\n24\n25\n26',
      'answer_en': '25',
      'question_es': '¿Cuántos números primos hay entre 0 y 100?\n24\n25\n26',
      'answer_es': '25',
    },
  ];

  @override
  void initState() {
    super.initState();
    _refreshExamples();
  }

  void _refreshExamples() {
    _examples = (_allExamples.toList()..shuffle()).take(10).toList();
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
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
                'assets/classboard.jpg'), // Set your background image here
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: <Widget>[
                Text(
                  _isEnglish
                      ? 'Tap on these questions to reveal the answer'
                      : 'Pulsa estas preguntas para revelar la respuesta',
                  style: TextStyle(
                      fontSize: 28,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 20),
                Expanded(
                  child: ListView.builder(
                    itemCount: _examples.length,
                    itemBuilder: (context, index) {
                      return _buildExampleCard(
                        _examples[index]['question_en']!,
                        _examples[index]['answer_en']!,
                        _examples[index]['question_es']!,
                        _examples[index]['answer_es']!,
                      );
                    },
                  ),
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          _refreshExamples();
                        });
                      },
                      style: ElevatedButton.styleFrom(
                        padding:
                        EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                        backgroundColor: Colors.blue,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      child: Text(
                        _isEnglish ? 'More Examples' : 'Más ejemplos',
                        style: TextStyle(fontSize: 18, color: Colors.white),
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
                        EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                        backgroundColor: Colors.green,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      child: Text(
                        _isEnglish ? 'Tap to Translate' : 'Toca para Traducir',
                        style: TextStyle(fontSize: 18, color: Colors.white),
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

  Widget _buildExampleCard(
      String questionEn, String answerEn, String questionEs, String answerEs) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: FlipCard(
        direction: FlipDirection.HORIZONTAL,
        front: Container(
          height: 250,
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 161, 190, 242),
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Center(
            child: Text(
              _isEnglish ? questionEn : questionEs,
              style: const TextStyle(
                  fontSize: 30, color: Color.fromARGB(255, 16, 4, 4)),
              textAlign: TextAlign.center,
            ),
          ),
        ),
        back: Container(
          height: 250,
          decoration: BoxDecoration(
            color: Colors.orangeAccent,
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                _isEnglish ? answerEn : answerEs,
                style: const TextStyle(
                    fontSize: 30, color: Color.fromARGB(255, 14, 4, 4)),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
