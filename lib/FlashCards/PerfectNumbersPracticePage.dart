import 'package:flutter/material.dart';
import 'package:flip_card/flip_card.dart';
import "package:google_fonts/google_fonts.dart";
import 'package:num_quest/translation_service.dart';

class PerfectNumberPracticePage extends StatefulWidget {
  const PerfectNumberPracticePage({super.key});

  @override
  _PerfectNumberPracticePageState createState() =>
      _PerfectNumberPracticePageState();
}

class _PerfectNumberPracticePageState
    extends State<PerfectNumberPracticePage> {
  bool _isEnglish = true; // State to keep track of language
  List<Map<String, String>> _examples = [];
  final List<Map<String, String>> _allExamples = [
    {
      'Front_en': 'What is the smallest perfect number?',
      'Back_en':
          'The smallest perfect number is 6.\nA perfect number is a number that is equal to the sum of its proper divisors (excluding itself). For 6: 1 + 2 + 3 = 6.',
    },
    {
      'Front_en': 'What is the second perfect number?',
      'Back_en':
          'The second perfect number is 28.\nFor 28: 1 + 2 + 4 + 7 + 14 = 28.',
    },
    {
      'Front_en': 'Is 496 a perfect number?',
      'Back_en':
          'Yes, 496 is a perfect number.\nThe divisors of 496 (excluding itself) are 1, 2, 4, 8, 16, 31, 62, 124, and 248. Their sum is 496.',
    },
    {
      'Front_en': 'What is the next perfect number after 28?',
      'Back_en':
          'The next perfect number after 28 is 496.\nPerfect numbers increase rapidly; 496 is the third perfect number.',
    },
    {
      'Front_en': 'Is 8128 a perfect number?',
      'Back_en':
          'Yes, 8128 is a perfect number.\nThe divisors of 8128 (excluding itself) sum to 8128.',
    },
  ];

  final TranslationService _translationService = TranslationService(); // Translation service instance
  Map<String, String> _translatedTexts = {}; // Cache for translated texts

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
            ? 'Perfect Number Practice'
            : 'Práctica de Números Perfectos'),
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
                          future: Future.wait([
                            _translateText(_examples[index]['Front_en']!),
                            _translateText(_examples[index]['Back_en']!),
                          ]),
                          builder: (context, snapshot) {
                            if (snapshot.connectionState ==
                                ConnectionState.waiting) {
                              return Center(
                                child: CircularProgressIndicator(),
                              );
                            }
                            final frontText = snapshot.data?[0] ?? 'Loading...';
                            final backText = snapshot.data?[1] ?? 'Loading...';
                            return _buildExampleCard(frontText, backText);
                          },
                        );
                      },
                    ),
                  ),
                ),
                ElevatedButton.icon(
                  onPressed: () {
                    setState(() {
                      _isEnglish = !_isEnglish;
                    });
                  },
                  icon: Icon(Icons.translate),
                  label: Text(
                      _isEnglish ? 'Switch to Spanish' : 'Cambiar a Inglés'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildExampleCard(String frontText, String backText) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: FlipCard(
        front: Card(
          child: ListTile(
            title: Text(frontText),
          ),
        ),
        back: Card(
          child: ListTile(
            title: Text(backText),
          ),
        ),
      ),
    );
  }
}
