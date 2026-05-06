import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:google_fonts/google_fonts.dart';
import '../analytics_engine.dart';

class ModuloPracticePage extends StatefulWidget {
  ModuloPracticePage({super.key});
  final FlutterTts flutterTts = FlutterTts();

  @override
  _ModuloPracticePageState createState() => _ModuloPracticePageState();
}

class _ModuloPracticePageState extends State<ModuloPracticePage> {
  bool _isEnglish = true;
  List<Map<String, dynamic>> _questions = [];
  final String practiceType = 'modulo';

  final List<Map<String, dynamic>> _allQuestions = [
    {
      'question_en': 'What is 17 mod 5?',
      'question_es': '¿Cuánto es 17 mod 5?',
      'options': ['1', '2', '3', '4'],
      'correct': ['2'],
    },
    {
      'question_en': 'What is 12 mod 4?',
      'question_es': '¿Cuánto es 12 mod 4?',
      'options': ['0', '1', '2', '3'],
      'correct': ['0'],
    },
    {
      'question_en': 'What is 23 mod 6?',
      'question_es': '¿Cuánto es 23 mod 6?',
      'options': ['3', '4', '5', '6'],
      'correct': ['5'],
    },
    {
      'question_en': 'Which numbers give 0 when mod 2 is applied (i.e. are even)?',
      'question_es': '¿Qué números dan 0 al aplicar mod 2 (es decir, son pares)?',
      'options': ['7', '8', '11', '14'],
      'correct': ['8', '14'],
    },
    {
      'question_en': 'What is 8 mod 10?',
      'question_es': '¿Cuánto es 8 mod 10?',
      'options': ['0', '1', '8', '10'],
      'correct': ['8'],
    },
    {
      'question_en': 'What is 100 mod 7?',
      'question_es': '¿Cuánto es 100 mod 7?',
      'options': ['1', '2', '3', '4'],
      'correct': ['2'],
    },
    {
      'question_en': 'A clock shows 25 hours. Using 25 mod 12, what hour is it?',
      'question_es': 'Un reloj marca 25 horas. Usando 25 mod 12, ¿qué hora es?',
      'options': ['1', '2', '12', '13'],
      'correct': ['1'],
    },
    {
      'question_en': 'Which of these are divisible by 3 (i.e. n mod 3 = 0)?',
      'question_es': '¿Cuáles de estos son divisibles por 3 (es decir, n mod 3 = 0)?',
      'options': ['9', '10', '15', '16'],
      'correct': ['9', '15'],
    },
  ];

  @override
  void initState() {
    super.initState();
    _loadInitialQuestions();
  }

  void _loadInitialQuestions() {
    setState(() {
      _questions = _allQuestions.take(4).toList();
    });
  }

  void _loadMoreQuestions() {
    setState(() {
      final remaining = _allQuestions.skip(_questions.length).toList();
      if (remaining.isNotEmpty) {
        _questions.addAll(remaining.take(3));
      }
    });

    AnalyticsEngine.logMoreExamplesClick(practiceType);
    print('More Examples clicked in Modulo Practice');
  }

  void speak(String text) async {
    await widget.flutterTts.setLanguage("en-US");
    await widget.flutterTts.setPitch(1.0);
    await widget.flutterTts.speak(text);
  }

  void _onTranslatePressed() {
    setState(() {
      _isEnglish = !_isEnglish;
    });

    String language = AnalyticsEngine.getLanguageString(_isEnglish);
    AnalyticsEngine.logTranslateButtonClickPractice(language, practiceType);
    print('Translate button clicked in Modulo Practice: $language');
  }

  void showResultDialog(BuildContext context, bool isCorrect) {
    String message = isCorrect
        ? (_isEnglish ? 'Correct!' : '¡Correcto!')
        : (_isEnglish ? 'Try Again.' : 'Intenta de nuevo.');

    speak(message);

    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext dialogContext) {
        return AlertDialog(
          backgroundColor: Colors.white,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          title: Text(
            isCorrect
                ? (_isEnglish ? 'Well Done!' : '¡Bien hecho!')
                : (_isEnglish ? 'Oops!' : '¡Vaya!'),
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: isCorrect ? Colors.green : Colors.red,
            ),
          ),
          content: Text(message, style: const TextStyle(fontSize: 20)),
          actions: [
            TextButton(
              child: Text(_isEnglish ? 'OK' : 'Aceptar',
                  style: TextStyle(fontSize: 18)),
              onPressed: () {
                Navigator.of(dialogContext, rootNavigator: true).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:
            Text(_isEnglish ? 'Modulo Practice' : 'Práctica de Módulo'),
        backgroundColor: Colors.lightBlue.shade100,
        foregroundColor: Colors.black87,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
            AnalyticsEngine.logGameCompleteInMiddle();
          },
        ),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
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
                children: [
                  Text(
                    _isEnglish
                        ? 'Tap on the correct answer'
                        : 'Toca la respuesta correcta',
                    style: GoogleFonts.lato(
                      textStyle: TextStyle(
                        fontSize: 32,
                        color: Colors.black,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.bold,
                        shadows: [
                          Shadow(
                            offset: Offset(4.0, 4.0),
                            blurRadius: 3.0,
                            color: Colors.grey.withOpacity(0.5),
                          ),
                        ],
                      ),
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 20),
                  ..._questions.map((q) {
                    return buildQuestionCard(
                      context,
                      question:
                          _isEnglish ? q['question_en'] : q['question_es'],
                      options: List<String>.from(q['options']),
                      correctAnswers: List<String>.from(q['correct']),
                    );
                  }).toList(),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton(
                        onPressed: _loadMoreQuestions,
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 30, vertical: 15),
                          backgroundColor: Colors.lightBlueAccent.shade200,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                        child: Text(
                          _isEnglish ? 'More Questions' : 'Más Preguntas',
                          style: const TextStyle(
                              fontSize: 20, color: Colors.white),
                        ),
                      ),
                      ElevatedButton(
                        onPressed: _onTranslatePressed,
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(
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
                          style: const TextStyle(
                              fontSize: 20, color: Colors.white),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget buildQuestionCard(
    BuildContext context, {
    required String question,
    required List<String> options,
    required List<String> correctAnswers,
  }) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 12.0),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      elevation: 5,
      color: Colors.white70,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text(
              question,
              style:
                  const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 12),
            ...options.map((option) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 6.0),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.lightBlue.shade100,
                    foregroundColor: Colors.black87,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    minimumSize: const Size(double.infinity, 50),
                  ),
                  onPressed: () {
                    bool isCorrect = correctAnswers.contains(option);
                    showResultDialog(context, isCorrect);
                  },
                  child: Text(option, style: const TextStyle(fontSize: 18)),
                ),
              );
            }).toList(),
          ],
        ),
      ),
    );
  }
}
