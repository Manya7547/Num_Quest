import 'package:flutter/material.dart';
import 'package:flip_card/flip_card.dart';
import "package:google_fonts/google_fonts.dart";

class EvenNumberExamplesPage extends StatefulWidget {
  const EvenNumberExamplesPage({super.key});

  @override
  _EvenNumberExamplesPageState createState() {
    return _EvenNumberExamplesPageState();
  }
}

class _EvenNumberExamplesPageState extends State<EvenNumberExamplesPage> {
  bool _isEnglish = true; // State to keep track of language
  List<Map<String, String>> _examples = [];

  // Map to hold numbers and their corresponding English words
  final Map<String, String> numberWords = {
    '2': 'two',
    '4': 'four',
    '6': 'six',
    '8': 'eight',
    '10': 'ten',
    '12': 'twelve',
    '14': 'fourteen',
    '16': 'sixteen',
    '18': 'eighteen',
    '20': 'twenty',
  };

  final List<Map<String, String>> _allExamples = [
    {
      'number': '2',
      'description_en':
          'It\'s EVEN! \nThere are 2 sides to a coin: heads and tails!',
      'description_es': '¡Es PAR! \n¡Hay 2 lados en una moneda: cara y cruz!',
    },
    {
      'number': '4',
      'description_en': 'It\'s EVEN! \nFour wheels on a car make it even!',
      'description_es': '¡Es PAR! \n¡Cuatro ruedas en un coche lo hacen par!',
    },
    {
      'number': '6',
      'description_en': 'It\'s EVEN! \nSix legs on three insects, all even!',
      'description_es': '¡Es PAR! \n¡Seis patas en tres insectos, todo par!',
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
      'Odd-Even Number Practice': 'Ejemplos de Números Pares',
      'Tap on the card to reveal the answer': 'Toca la tarjeta para revelar la respuesta',
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
        title: Text(_translateText('Odd-Even Number Practice')),
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
                      _examples[index]['number']!,
                      _isEnglish ? _examples[index]['description_en']! : _examples[index]['description_es']!,
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

  Widget _buildExampleCard(String number, String description, bool isTablet) {
    String numberText = numberWords[number] != null ? '$number (${numberWords[number]})' : number;

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
            child: Text(
              numberText,
              style: TextStyle(fontSize: isTablet ? 50 : 40, color: Colors.black54),
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
                description,
                style: TextStyle(fontSize: isTablet ? 26 : 20, color: Colors.black54),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
