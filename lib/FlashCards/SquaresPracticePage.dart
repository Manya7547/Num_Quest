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
    {
      'Front_en': 'What is the square of 4 (four)?',
      'Front_es': '¿Cuál es el cuadrado de 4?',
      'Back_en': '16 (sixteen)',
      'Back_es': '16 (dieciséis)',
    },
    {
      'Front_en': 'What is the square root of 81 (eighty-one)?',
      'Front_es': '¿Cuál es la raíz cuadrada de 81?',
      'Back_en': '9 (nine)',
      'Back_es': '9 (nueve)',
    },
    {
      'Front_en': 'True or False: 144 (one hundred forty-four) is a square number.',
      'Front_es': 'Verdadero o Falso: 144 es un número cuadrado.',
      'Back_en': 'True (12 × 12 = 144)',
      'Back_es': 'Verdadero (12 × 12 = 144)',
    },
    {
      'Front_en': 'What is the smallest two-digit square number?',
      'Front_es': '¿Cuál es el menor número cuadrado de dos dígitos?',
      'Back_en': '16 (sixteen)',
      'Back_es': '16 (dieciséis)',
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
    double screenWidth = MediaQuery.of(context).size.width;
    bool isTablet = screenWidth > 600;

    return Scaffold(
      appBar: AppBar(
        title: Text(_isEnglish
            ? 'Square Number Practice'
            : 'Práctica de Números Cuadrados'),
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
                    ? 'Tap on the card to reveal the answer'
                    : 'Toca la tarjeta para revelar la respuesta',
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
                    return _buildExampleCard(
                      question: _isEnglish
                          ? _examples[index]['Front_en']!
                          : _examples[index]['Front_es']!,
                      answer: _isEnglish
                          ? _examples[index]['Back_en']!
                          : _examples[index]['Back_es']!,
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

  Widget _buildExampleCard({required String question, required String answer}) {
    double screenWidth = MediaQuery.of(context).size.width;
    bool isTablet = screenWidth > 600;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Center(
        child: FlipCard(
          direction: FlipDirection.HORIZONTAL,
          front: Container(
            width: screenWidth * 0.85,
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.9),
              borderRadius: BorderRadius.circular(15.0),
              boxShadow: [BoxShadow(color: Colors.grey, blurRadius: 4)],
            ),
            child: Center(
              child: Text(
                question,
                style: TextStyle(
                  fontSize: isTablet ? 26 : 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.black54,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          back: Container(
            width: screenWidth * 0.85,
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.greenAccent.withOpacity(0.8),
              borderRadius: BorderRadius.circular(15.0),
              boxShadow: [BoxShadow(color: Colors.grey, blurRadius: 4)],
            ),
            child: Center(
              child: Text(
                answer,
                style: TextStyle(
                  fontSize: isTablet ? 26 : 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
