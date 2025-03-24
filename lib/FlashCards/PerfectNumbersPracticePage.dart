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
  bool _isEnglish = true; // Language state
  List<Map<String, String>> _examples = [];

  final List<Map<String, String>> _allExamples = [
    {
      'Front_en': 'What is the smallest perfect number?',
      'Front_es': '¿Cuál es el número perfecto más pequeño?',
      'Back_en': 'The smallest perfect number is 6.\nFor 6: 1 + 2 + 3 = 6.',
      'Back_es': 'El número perfecto más pequeño es 6.\nPara 6: 1 + 2 + 3 = 6.',
    },
    {
      'Front_en': 'What is the second perfect number?',
      'Front_es': '¿Cuál es el segundo número perfecto?',
      'Back_en': 'The second perfect number is 28.\nFor 28: 1 + 2 + 4 + 7 + 14 = 28.',
      'Back_es': 'El segundo número perfecto es 28.\nPara 28: 1 + 2 + 4 + 7 + 14 = 28.',
    },
    {
      'Front_en': 'Is 496 a perfect number?',
      'Front_es': '¿Es 496 un número perfecto?',
      'Back_en': 'Yes, 496 is a perfect number.\nThe sum of its divisors equals 496.',
      'Back_es': 'Sí, 496 es un número perfecto.\nLa suma de sus divisores es 496.',
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

  String _translateText(String text) {
    Map<String, String> translations = {
      'Perfect Number Practice': 'Práctica de Números Perfectos',
      'Tap on the card to reveal the answer': 'Toca la tarjeta para ver la respuesta',
      'More Examples': 'Más Ejemplos',
      'Tap to Translate': 'Toca para Traducir',
    };
    return _isEnglish ? text : (translations[text] ?? text);
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    bool isTablet = screenWidth > 600;

    return Scaffold(
      appBar: AppBar(
        title: Text(_translateText('Perfect Number Practice')),
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
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                _translateText('Tap on the card to reveal the answer'),
                style: GoogleFonts.lato(
                  textStyle: TextStyle(
                    fontSize: isTablet ? 32 : 24,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    shadows: [
                      Shadow(
                        offset: const Offset(3.0, 3.0),
                        blurRadius: 2.0,
                        color: Colors.grey.withOpacity(0.5),
                      ),
                    ],
                  ),
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: screenWidth * 0.05),

              // Flip Cards List
              Expanded(
                child: ListView.builder(
                  itemCount: _examples.length,
                  itemBuilder: (context, index) {
                    return _buildExampleCard(
                      _isEnglish ? _examples[index]['Front_en']! : _examples[index]['Front_es']!,
                      _isEnglish ? _examples[index]['Back_en']! : _examples[index]['Back_es']!,
                      isTablet,
                    );
                  },
                ),
              ),
              SizedBox(height: screenWidth * 0.05),

              // Buttons
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: _refreshExamples,
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.symmetric(vertical: 15, horizontal: 30),
                      backgroundColor: Colors.lightBlueAccent.shade200,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    child: Text(
                      _translateText('More Examples'),
                      style: TextStyle(fontSize: isTablet ? 22 : 18, color: Colors.white),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        _isEnglish = !_isEnglish;
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.symmetric(vertical: 15, horizontal: 30),
                      backgroundColor: Colors.amber.shade700,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    child: Text(
                      _translateText('Tap to Translate'),
                      style: TextStyle(fontSize: isTablet ? 22 : 18, color: Colors.white),
                    ),
                  ),
                ],
              ),
              SizedBox(height: screenWidth * 0.05),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildExampleCard(String frontText, String backText, bool isTablet) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10.0),
      child: FlipCard(
        direction: FlipDirection.HORIZONTAL,
        front: Container(
          height: isTablet ? 180 : 150,
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.white70,
            borderRadius: BorderRadius.circular(15.0),
          ),
          child: Center(
            child: Padding(
              padding: EdgeInsets.all(10),
              child: Text(
                frontText,
                style: TextStyle(fontSize: isTablet ? 28 : 22, fontWeight: FontWeight.bold, color: Colors.black54),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ),
        back: Container(
          height: isTablet ? 180 : 150,
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.grey.shade200,
            borderRadius: BorderRadius.circular(15.0),
          ),
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                backText,
                style: TextStyle(fontSize: isTablet ? 24 : 18, color: Colors.black54),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
