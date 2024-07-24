import 'package:flutter/material.dart';
import 'package:flip_card/flip_card.dart';

class EvenNumberExamplesPage extends StatefulWidget {
  @override
  _EvenNumberExamplesPageState createState() => _EvenNumberExamplesPageState();
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
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/classboard.jpg'), // Set your background image here
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: <Widget>[
                Text(
                  _isEnglish ? 'Tap on these numbers to reveal if they are even or odd' : 'Pulsa estos números para revelar si son pares o impares.',
                  style: TextStyle(fontSize: 28, color: Colors.black, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 20),
                Expanded(
                  child: ListView.builder(
                    itemCount: _examples.length,
                    itemBuilder: (context, index) {
                      return _buildExampleCard(
                        _examples[index]['number']!,
                        _isEnglish ? _examples[index]['description_en']! : _examples[index]['description_es']!,
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
                        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
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
                        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
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

  Widget _buildExampleCard(String number, String description) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: FlipCard(
        direction: FlipDirection.HORIZONTAL,
        front: Container(
          height: 150,
          decoration: BoxDecoration(
            color: Colors.blueAccent,
            borderRadius: BorderRadius.circular(10.0),
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
          decoration: BoxDecoration(
            color: Colors.orangeAccent,
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                description,
                style: const TextStyle(fontSize: 20, color: Colors.white),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
