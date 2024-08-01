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
  final List<Map<String, String>> _allExamples = [
    {
      'number': '2',
      'description_en': 'It\'s EVEN! \nThere are 2 sides to a coin: heads and tails!',
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
    {
      'number': '8',
      'description_en': 'It\'s EVEN! \nEight slices of pizza, let\'s share!',
      'description_es': '¡Es PAR! \n¡Ocho porciones de pizza, vamos a compartir!',
    },
    {
      'number': '10',
      'description_en': 'It\'s EVEN! \n10 cookies: 5 for you and 5 for your friend!',
      'description_es': '¡Es PAR! \n10 galletas: ¡5 para ti y 5 para tu amigo!',
    },
    {
      'number': '12',
      'description_en': 'It\'s EVEN! \nA dozen eggs, all even!',
      'description_es': '¡Es PAR! \nUna docena de huevos, todo par!',
    },
    {
      'number': '14',
      'description_en': 'It\'s EVEN! \nFourteen stars in the sky, paired up high!',
      'description_es': '¡Es PAR! \n¡Catorce estrellas en el cielo, emparejadas en lo alto!',
    },
    {
      'number': '16',
      'description_en': 'It\'s EVEN! \nSixteen colorful blocks, build in pairs!',
      'description_es': '¡Es PAR! \n¡Dieciséis bloques coloridos, construye en pares!',
    },
    {
      'number': '18',
      'description_en': 'It\'s EVEN! \nEighteen fish in the aquarium, swimming in pairs!',
      'description_es': '¡Es PAR! \n¡Dieciocho peces en el acuario, nadando en parejas!',
    },
    {
      'number': '20',
      'description_en': 'It\'s EVEN! \nTwenty crayons, perfect for sharing!',
      'description_es': '¡Es PAR! \n¡Veinte crayones, perfectos para compartir!',
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
        title: Text(_isEnglish ? 'Even Number Examples' : 'Ejemplos de Números Pares'),
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
              style: const TextStyle(fontSize: 50, color: Colors.black54),
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
