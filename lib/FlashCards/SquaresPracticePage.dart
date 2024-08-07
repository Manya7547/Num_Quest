import 'package:flutter/material.dart';
import 'package:flip_card/flip_card.dart';
import "package:google_fonts/google_fonts.dart";





class SquaresExamplePage extends StatefulWidget {
  const SquaresExamplePage({super.key});

  @override
  _SquaresExamplePageState createState() {
    return _SquaresExamplePageState();
  }
}

class _SquaresExamplePageState extends State<SquaresExamplePage> {
  bool _isEnglish = true; // State to keep track of language
  List<Map<String, String>> _examples = [];
  final List<Map<String, String>> _allExamples = [
    //
    {
      'Front_en': 'What is the square of 4?',
      'Front_es': '¿Cuál es el cuadrado de 4?',
      'Back_en': '16',
      'Back_es': '16',
    },
    {
      'Front_en': 'What is the square root of 81?',
      'Front_es': ' ¿Cuál es la raíz cuadrada de 81?',
      'Back_en': '9',
      'Back_es': '9',
    },
    {
    'Front_en': 'True or False: 144 is a square number.',
    'Front_es': ' Verdadero o Falso: 144 es un número cuadrado.',
    'Back_en': 'True\n(12 × 12 = 144)',
    'Back_es': 'Verdadero\n(12 × 12 = 144)',
    },
    {
      'Front_en': 'What is the smallest two-digit square number?',
      'Front_es': '¿Cuál es el menor número cuadrado de dos dígitos?',
      'Back_en': '16',
      'Back_es': '16',

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
        title: Text(_isEnglish ? 'Square Number Practice' : 'Práctica de Números Cuadrados'),
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
