import 'package:flutter/material.dart';
import 'package:flip_card/flip_card.dart';
import "package:google_fonts/google_fonts.dart";
import 'package:num_quest/translation_service.dart';

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
  final TranslationService _translationService = TranslationService(); // Translation service instance
  Map<String, String> _translatedTexts = {}; // Cache for translated texts

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
    },
    {
      'number': '4',
      'description_en': 'It\'s EVEN! \nFour wheels on a car make it even!',
    },
    {
      'number': '6',
      'description_en': 'It\'s EVEN! \nSix legs on three insects, all even!',
    },
    //... more numbers
  ];

  @override
  void initState() {
    super.initState();
    _translationService.loadModel(); // Load the translation model
    _refreshExamples();
  }

  void _refreshExamples() {
    setState(() {
      _examples = (_allExamples.toList()..shuffle()).take(3).toList();
    });
  }

  Future<String> _translateText(String text) async {
    if (_isEnglish) {
      return text; // No translation needed for English
    }
    if (_translatedTexts.containsKey(text)) {
      return _translatedTexts[text]!; // Return cached translation
    }
    final translated = await _translationService.translateText(text);
    setState(() {
      _translatedTexts[text] = translated; // Cache the translation
    });
    return translated;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_isEnglish
            ? 'Even Number Practice'
            : 'Práctica de Números Pares'),
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
                        return FutureBuilder(
                          future: _translateText(
                              _examples[index]['description_en']!),
                          builder: (context, snapshot) {
                            if (snapshot.connectionState ==
                                ConnectionState.waiting) {
                              return Center(
                                child: CircularProgressIndicator(),
                              );
                            }
                            final description =
                                snapshot.data ?? 'Translating...';
                            return _buildExampleCard(
                              _examples[index]['number']!,
                              description,
                            );
                          },
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
