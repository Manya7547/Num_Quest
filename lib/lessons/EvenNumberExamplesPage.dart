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
      'number': '10',
      'description_en':
          'It\'s EVEN! \nIf you have 10 cookies, they are even. You can keep 5 for you and give 5 to your friend. \nThere won\'t be any leftover cookies.',
      'description_es':
          '¡Es PAR! \nSi tienes 10 galletas, son pares. Puedes quedarte con 5 y darle 5 a tu amigo. \nNo quedarán galletas sobrantes.'
    },
    {
      'number': '75',
      'description_en':
          'It\'s ODD! \n75 is not divisible by 2 and it ends with 5. \nRemember, odd numbers are not divisible by 2 and end with 1, 3, 5, 7, or 9.',
      'description_es':
          '¡Es IMPAR! \n75 no es divisible por 2 y termina en 5. \nRecuerda, los números impares no son divisibles por 2 y terminan en 1, 3, 5, 7 o 9.'
    },
    {
      'number': '8',
      'description_en':
          'It\'s EVEN! \n8 is divisible by 2 and it ends with 8. \nRemember, even numbers are divisible by 2 and end with 0, 2, 4, 6, or 8.',
      'description_es':
          '¡Es PAR! \n8 es divisible por 2 y termina en 8. \nRecuerda, los números pares son divisibles por 2 y terminan en 0, 2, 4, 6 u 8.'
    },
    // Add more examples here
    {
      'number': '12',
      'description_en':
          'It\'s EVEN! \n12 is divisible by 2 and it ends with 2. \nRemember, even numbers are divisible by 2 and end with 0, 2, 4, 6, or 8.',
      'description_es':
          '¡Es PAR! \n12 es divisible por 2 y termina en 2. \nRecuerda, los números pares son divisibles por 2 y terminan en 0, 2, 4, 6 u 8.'
    },
    {
      'number': '45',
      'description_en':
          'It\'s ODD! \n45 is not divisible by 2 and it ends with 5. \nRemember, odd numbers are not divisible by 2 and end with 1, 3, 5, 7, or 9.',
      'description_es':
          '¡Es IMPAR! \n45 no es divisible por 2 y termina en 5. \nRecuerda, los números impares no son divisibles por 2 y terminan en 1, 3, 5, 7 o 9.'
    },
    {
      'number': '22',
      'description_en':
          'It\'s EVEN! \n22 is divisible by 2 and it ends with 2. \nRemember, even numbers are divisible by 2 and end with 0, 2, 4, 6, or 8.',
      'description_es':
          '¡Es PAR! \n22 es divisible por 2 y termina en 2. \nRecuerda, los números pares son divisibles por 2 y terminan en 0, 2, 4, 6 u 8.'
    },
    // Continue adding up to 18 examples
  ];

  @override
  void initState() {
    super.initState();
    _refreshExamples();
  }

  void _refreshExamples() {
    _examples = (_allExamples.toList()..shuffle()).take(3).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
            _isEnglish ? 'Even Number Examples' : 'Ejemplos de Números Pares'),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
                '/Users/manyasohal/num_quest/assets/classboard.jpg'), // Set your background image here
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: <Widget>[
                Text(
                  _isEnglish
                      ? 'Tap on these numbers to reveal if they are even or odd'
                      : 'Pulsa estos números para revelar si son pares o impares.',
                  style: TextStyle(
                      fontSize: 28,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 20),
                Expanded(
                  child: ListView.builder(
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
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          _refreshExamples();
                        });
                      },
                      style: ElevatedButton.styleFrom(
                        padding:
                            EdgeInsets.symmetric(horizontal: 20, vertical: 10),
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
                        padding:
                            EdgeInsets.symmetric(horizontal: 20, vertical: 10),
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
