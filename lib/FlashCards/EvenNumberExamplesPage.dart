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
    '75': 'seventy-five',
    '45': 'forty-five',
    '9': 'nine',
    '15': 'fifteen',
    '55': 'fifty-five',
    '31': 'thirty-one',
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
    //... more numbers
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
        title: Text(_isEnglish
            ? 'Odd-Even Number Practice'
            : 'Ejemplos de Números Primos'),
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
                Center(
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width * 0.8,
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: _examples.length,
                      itemBuilder: (context, index) {
                        return _buildExampleCard(
                          _examples[index]['number']!,
                          _isEnglish
                              ? _examples[index]['description_en']!
                              : _examples[index]['description_es']!,
                        );
                      },
                    ),
                  ),
                ),
                const SizedBox(height: 30),
                Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton(
                        onPressed: _refreshExamples,
                        style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.symmetric(
                              horizontal: 30, vertical: 15),
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
                              horizontal: 30, vertical: 15),
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
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildExampleCard(String number, String description) {
    String numberText = numberWords[number] != null
        ? '$number (${numberWords[number]})'
        : number;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: FlipCard(
        direction: FlipDirection.HORIZONTAL,
        front: Container(
          height: 150,
          width: MediaQuery.of(context).size.width * 0.8,
          decoration: BoxDecoration(
            color: Colors.white70,
            borderRadius: BorderRadius.circular(15.0),
          ),
          child: Center(
            child: Text(
              numberText, // Display number with text
              style: const TextStyle(fontSize: 50, color: Colors.black54),
            ),
          ),
        ),
        back: Container(
          height: 150,
          width: MediaQuery.of(context).size.width * 0.8,
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
