import 'package:flutter/material.dart';
import 'package:flip_card/flip_card.dart';
import "package:google_fonts/google_fonts.dart";





class PerfectNumberPracticePage extends StatefulWidget {
  const PerfectNumberPracticePage({super.key});

  @override
  _PerfectNumberPracticePageState createState() {
    return _PerfectNumberPracticePageState();
  }
}

class _PerfectNumberPracticePageState extends State<PerfectNumberPracticePage> {
  bool _isEnglish = true; // State to keep track of language
  List<Map<String, String>> _examples = [];
  final List<Map<String, String>> _allExamples = [
    //
    {
      'Front_en': 'What is the smallest perfect number?',
      'Front_es': '¿Cuál es el número perfecto más pequeño?',
      'Back_en': ' The smallest perfect number is 6.\nA perfect number is a number that is equal to the sum of its proper divisors (excluding itself). For 6: 1 + 2 + 3 = 6.',
      'Back_es': 'El número perfecto más pequeño es 6.\nUn número perfecto es un número que es igual a la suma de sus divisores propios (excluyendo a sí mismo). Para 6: 1 + 2 + 3 = 6.',
    },
    {
      'Front_en': 'What is the second perfect number?',
      'Front_es': '¿Cuál es el segundo número perfecto?',
      'Back_en': 'The second perfect number is 28.\nFor 28: 1 + 2 + 4 + 7 + 14 = 28.',
      'Back_es': ' El segundo número perfecto es 28.\nPara 28: 1 + 2 + 4 + 7 + 14 = 28.',
    },
    {
      'Front_en': 'Is 496 a perfect number?',
      'Front_es': '¿Es 496 un número perfecto?',
      'Back_en': 'Yes, 496 is a perfect number.\nThe divisors of 496 (excluding itself) are 1, 2, 4, 8, 16, 31, 62, 124, and 248. Their sum is 496.',
      'Back_es': 'Sí, 496 es un número perfecto.\nLos divisores de 496 (excluyendo a sí mismo) son 1, 2, 4, 8, 16, 31, 62, 124, y 248. Su suma es 496.',
    },
    {
      'Front_en': 'What is the next perfect number after 28?',
      'Front_es': '¿Cuál es el siguiente número perfecto después de 28?',
      'Back_en': 'The next perfect number after 28 is 496.\nPerfect numbers increase rapidly; 496 is the third perfect number.',
      'Back_es': 'El siguiente número perfecto después de 28 es 496\nLos números perfectos aumentan rápidamente; 496 es el tercer número perfecto.',
    },
    {
      'Front_en': 'Is 8128 a perfect number?',
      'Front_es': '¿Es 8128 un número perfecto?',
      'Back_en': 'Yes, 8128 is a perfect number.\nThe divisors of 8128 (excluding itself) sum to 8128.',
      'Back_es': 'Sí, 8128 es un número perfecto.\nLos divisores de 8128 (excluyendo a sí mismo) suman 8128.',
    },
    {
      'Front_en': 'Is 28 the only perfect number less than 100?',
      'Front_es': '¿Es 28 el único número perfecto menor que 100?',
      'Back_en': 'Yes, 28 is the only perfect number less than 100.\nThe only perfect numbers less than 100 are 6 and 28.',
      'Back_es': 'Sí, 28 es el único número perfecto menor que 100.\nLos únicos números perfectos menores que 100 son 6 y 28.',
    },
    {
      'Front_en': 'What is the fourth perfect number?',
      'Front_es': '¿Cuál es el cuarto número perfecto?',
      'Back_en': 'The fourth perfect number is 8128.\nThe perfect numbers in order are 6, 28, 496, and 8128.',
      'Back_es': 'El cuarto número perfecto es 8128.\nLos números perfectos en orden son 6, 28, 496 y 8128.',
    },
    {
      'Front_en': 'Is there a perfect number larger than 8128?',
      'Front_es': '¿Hay un número perfecto mayor que 8128?',
      'Back_en': 'Yes, the next perfect number after 8128 is 33,550,336\nPerfect numbers grow rapidly; 33,550,336 is the fifth perfect number.',
      'Back_es': 'Sí, el siguiente número perfecto después de 8128 es 33,550,336.\nLos números perfectos crecen rápidamente; 33,550,336 es el quinto número perfecto.',
    },
    {
      'Front_en': 'What is the sum of the proper divisors of 28?',
      'Front_es': '¿Cuál es la suma de los divisores propios de 28?',
      'Back_en': 'The sum of the proper divisors of 28 is 28\nThe divisors of 28 are 1, 2, 4, 7, and 14. Their sum is 28.',
      'Back_es': ' La suma de los divisores propios de 28 es 28.\nLos divisores de 28 son 1, 2, 4, 7, y 14. Su suma es 28.',
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_isEnglish ? 'Perfect Number Practice' : 'Práctica de Números perfecto'),
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
        child: Center( // Wrap the entire content in a Center widget
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center, // Center the column vertically
              children: <Widget>[
                Text(
                  _isEnglish
                      ? 'Tap on the card to reveal the answer'
                      : 'Toca la tarjeta para revelar la respuesta',
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

                // Center the ListView.builder and reduce its width
                Center(
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width * 0.8, // Limit width of the ListView
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: _examples.length,
                      itemBuilder: (context, index) {
                        return _buildExampleCard(
                          _isEnglish ? _examples[index]['Front_en']! : _examples[index]['Front_es']!,
                          _isEnglish ? _examples[index]['Back_en']! : _examples[index]['Back_es']!,
                        );
                      },
                    ),
                  ),
                ),

                const SizedBox(height: 30),

                // Center the Row containing buttons
                Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton(
                        onPressed: _refreshExamples,
                        style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
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
                          padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
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
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }



  Widget _buildExampleCard(String number, String description) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: FlipCard(
        direction: FlipDirection.HORIZONTAL,
        front: Container(
          height: 150,
          width: MediaQuery.of(context).size.width * 0.8, // Adjust width
          decoration: BoxDecoration(
            color: Colors.white70,
            borderRadius: BorderRadius.circular(15.0),
          ),
          child: Center(
            child: Text(
              number,
              style: const TextStyle(fontSize: 25, color: Colors.black54),
            ),
          ),
        ),
        back: Container(
          height: 150,
          width: MediaQuery.of(context).size.width * 0.8, // Adjust width
          decoration: BoxDecoration(
            color: Colors.grey.shade200,
            borderRadius: BorderRadius.circular(15.0),
          ),
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                description,
                style: const TextStyle(fontSize: 25, color: Colors.black54),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
