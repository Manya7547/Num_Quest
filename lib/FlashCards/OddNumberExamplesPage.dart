import 'package:flutter/material.dart';
import 'package:flip_card/flip_card.dart';
import "package:google_fonts/google_fonts.dart";


class OddNumberExamplesPage extends StatefulWidget {
  const OddNumberExamplesPage({super.key});

  @override
  _OddNumberExamplesPageState createState() {
    return _OddNumberExamplesPageState();
  }
}

class _OddNumberExamplesPageState extends State<OddNumberExamplesPage> {
  bool _isEnglish = true; // State to keep track of language
  List<Map<String, String>> _examples = [];
  final List<Map<String, String>> _allExamples = [
    {
      'number': '75',
      'description_en': 'It\'s ODD! \n75 is not divisible by 2 and it ends with 5. \nRemember, odd numbers are not divisible by 2 and end with 1, 3, 5, 7, or 9.',
      'description_es': '¡Es IMPAR! \n75 no es divisible por 2 y termina en 5. \nRecuerda, los números impares no son divisibles por 2 y terminan en 1, 3, 5, 7 o 9.'
    },
    {
      'number': '45',
      'description_en': 'It\'s ODD! \n45 is not divisible by 2 and it ends with 5. \nRemember, odd numbers are not divisible by 2 and end with 1, 3, 5, 7, or 9.',
      'description_es': '¡Es IMPAR! \n45 no es divisible por 2 y termina en 5. \nRecuerda, los números impares no son divisibles por 2 y terminan en 1, 3, 5, 7 o 9.'
    },
    {
      'number': '9',
      'description_en': 'It\'s ODD! \n9 is not divisible by 2 and it ends with 9. \nRemember, odd numbers are not divisible by 2 and end with 1, 3, 5, 7, or 9.',
      'description_es': '¡Es IMPAR! \n9 no es divisible por 2 y termina en 9. \nRecuerda, los números impares no son divisibles por 2 y terminan en 1, 3, 5, 7 o 9.'
    },
    {
      'number': '15',
      'description_en': 'It\'s ODD! \n15 is not divisible by 2 and it ends with 5. \nRemember, odd numbers are not divisible by 2 and end with 1, 3, 5, 7, or 9.',
      'description_es': '¡Es IMPAR! \n15 no es divisible por 2 y termina en 5. \nRecuerda, los números impares no son divisibles por 2 y terminan en 1, 3, 5, 7 o 9.'
    },
    {
      'number': '55',
      'description_en': 'It\'s ODD! \n55 is not divisible by 2 and it ends with 5. \nRemember, odd numbers are not divisible by 2 and end with 1, 3, 5, 7, or 9.',
      'description_es': '¡Es IMPAR! \n55 no es divisible por 2 y termina en 5. \nRecuerda, los números impares no son divisibles por 2 y terminan en 1, 3, 5, 7 o 9.'
    },
    {
      'number': '9',
      'description_en': 'It\'s ODD! \n9 is not divisible by 2 and it ends with 9. \nRemember, odd numbers are not divisible by 2 and end with 1, 3, 5, 7, or 9.',
      'description_es': '¡Es IMPAR! \n9 no es divisible por 2 y termina en 9. \nRecuerda, los números impares no son divisibles por 2 y terminan en 1, 3, 5, 7 o 9.'
    },
    {
      'number': '31',
      'description_en': 'It\'s ODD! \n31 is not divisible by 2 and it ends with 1. \nRemember, odd numbers are not divisible by 2 and end with 1, 3, 5, 7, or 9.',
      'description_es': '¡Es IMPAR! \n31 no es divisible por 2 y termina en 1. \nRecuerda, los números impares no son divisibles por 2 y terminan en 1, 3, 5, 7 o 9.'
    },
    // Add more odd number examples here
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
        title: Text(_isEnglish ? 'Even Number Examples' : 'Ejemplos de Números Pares'),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/demo1.jpg'),
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
                      ? 'Tap on these numbers to reveal if they are even or odd'
                      : 'Pulsa estos números para revelar si son pares o impares.',
                  style: GoogleFonts.lato(
                    textStyle: TextStyle(
                      fontSize: 38,
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
                          _examples[index]['number']!,
                          _isEnglish ? _examples[index]['description_en']! : _examples[index]['description_es']!,
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
                          backgroundColor: Colors.blue,
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
                          backgroundColor: Colors.green,
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
            color: Colors.teal.shade500,
            borderRadius: BorderRadius.circular(15.0),
          ),
          child: Center(
            child: Text(
              number,
              style: const TextStyle(fontSize: 50, color: Colors.white),
            ),
          ),
        ),
        back: Container(
          height: 150,
          width: MediaQuery.of(context).size.width * 0.8, // Adjust width
          decoration: BoxDecoration(
            color: Colors.amber.shade500,
            borderRadius: BorderRadius.circular(15.0),
          ),
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                description,
                style: const TextStyle(fontSize: 25, color: Colors.white),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
