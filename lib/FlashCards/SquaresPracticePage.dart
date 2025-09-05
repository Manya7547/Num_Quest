import 'package:flutter/material.dart';
import 'package:flip_card/flip_card.dart';
import "package:google_fonts/google_fonts.dart";
import '../analytics_engine.dart';

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
  final String practiceType = 'square_numbers';

  final List<Map<String, String>> _allExamples = [
    {
      'Front_en': 'What is the square of 4(four)?',
      'Front_es': '¿Cuál es el cuadrado de 4?',
      'Back_en': '16',
      'Back_es': '16',
    },
    {
      'Front_en': 'What is the square root of 81(eighty one)?',
      'Front_es': ' ¿Cuál es la raíz cuadrada de 81?',
      'Back_en': '9',
      'Back_es': '9',
    },
    {
      'Front_en':
          'True or False: 144 (one hundred and forty four) is a square number.',
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
    // Log "More Examples" button click
    AnalyticsEngine.logMoreExamplesClick(practiceType);
    print('More Examples clicked in Even/Odd Practice');
  }

  void _onCardFlip() {
    // Log card flip interaction
    AnalyticsEngine.logCardFlip(practiceType);
    print('Card flipped in Even/Odd Practice');
  }

  void _onTranslatePressed() {
    setState(() {
      _isEnglish = !_isEnglish;
    });
    
    // Log translate button click
    String language = AnalyticsEngine.getLanguageString(_isEnglish);
    AnalyticsEngine.logTranslateButtonClickPractice(language, practiceType);
    print('Translate button clicked in Even/Odd Practice: $language');
  }

  // Function to convert numbers to their word equivalents
  String _numberToWords(String number) {
    Map<String, String> numberWords = {
      '0': 'zero',
      '1': 'one',
      '2': 'two',
      '3': 'three',
      '4': 'four',
      '5': 'five',
      '6': 'six',
      '7': 'seven',
      '8': 'eight',
      '9': 'nine',
      '10': 'ten',
      '11': 'eleven',
      '12': 'twelve',
      '13': 'thirteen',
      '14': 'fourteen',
      '15': 'fifteen',
      '16': 'sixteen',
      '17': 'seventeen',
      '18': 'eighteen',
      '19': 'nineteen',
      '20': 'twenty',
      '25': 'twenty-five',
      '36': 'thirty-six',
      '49': 'forty-nine',
      '64': 'sixty-four',
      '81': 'eighty-one',
      '100': 'one hundred',
      '144': 'one hundred forty-four',
    };

    return numberWords[number] != null
        ? '$number (${numberWords[number]})'
        : number;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_isEnglish
            ? 'Square Number Practice'
            : 'Práctica de Números Cuadrados'),
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
  child: SafeArea(
    child: SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
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
                      offset: Offset(5.0, 5.0),
                      blurRadius: 3.0,
                      color: Colors.grey.withOpacity(0.5),
                    ),
                  ],
                ),
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 30),

            // Card list
            ListView.builder(
              itemCount: _examples.length,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(), // Prevent nested scrolling
              itemBuilder: (context, index) {
                return _buildExampleCard(
                  _isEnglish
                      ? _examples[index]['Front_en']!
                      : _examples[index]['Front_es']!,
                  _isEnglish
                      ? _numberToWords(_examples[index]['Back_en']!)
                      : _examples[index]['Back_es']!,
                );
              },
            ),

            SizedBox(height: 30),

            // Button row
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
                  onPressed: _onTranslatePressed,
                  style: ElevatedButton.styleFrom(
                    padding:
                        EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                    backgroundColor: Colors.amber.shade700,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  child: Text(
                    _isEnglish
                        ? 'Tap to Translate'
                        : 'Toca para Traducir',
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
),

    );
  }

  Widget _buildExampleCard(String number, String description) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: FlipCard(
        direction: FlipDirection.HORIZONTAL,
        onFlip:_onCardFlip,
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
