import 'package:flutter/material.dart';

class WordProblemsGame extends StatefulWidget {
  @override
  _WordProblemsGameState createState() => _WordProblemsGameState();
}

class _WordProblemsGameState extends State<WordProblemsGame> {
  bool _isEnglish = true; // Language state

  final List<Map<String, dynamic>> questions = [
    {
      'question_en': 'If John has 5 apples and he gives 2 to Mary, how many apples does John have left?',
      'question_es': 'Si John tiene 5 manzanas y le da 2 a Mary, ¿cuántas manzanas le quedan?',
      'answers_en': ['1 apple', '2 apples', '3 apples', '4 apples'],
      'answers_es': ['1 manzana', '2 manzanas', '3 manzanas', '4 manzanas'],
      'correctAnswerIndex': 2,
      'explanation_en': 'John starts with 5 apples and gives 2 away, so he has 5 - 2 = 3 apples left.',
      'explanation_es': 'John comienza con 5 manzanas y regala 2, por lo que le quedan 5 - 2 = 3 manzanas.',
    },
    {
      'question_en': 'What is the smallest prime number?',
      'question_es': '¿Cuál es el número primo más pequeño?',
      'answers_en': ['1', '2', '3', '4'],
      'answers_es': ['1', '2', '3', '4'],
      'correctAnswerIndex': 1,
      'explanation_en': 'The smallest prime number is 2 because it is only divisible by 1 and itself.',
      'explanation_es': 'El número primo más pequeño es 2 porque solo es divisible por 1 y por sí mismo.',
    },
    {
      'question_en': 'How many factors does the number 12 have?',
      'question_es': '¿Cuántos factores tiene el número 12?',
      'answers_en': ['2', '3', '4', '6'],
      'answers_es': ['2', '3', '4', '6'],
      'correctAnswerIndex': 3,
      'explanation_en': 'The number 12 has 6 factors: 1, 2, 3, 4, 6, and 12.',
      'explanation_es': 'El número 12 tiene 6 factores: 1, 2, 3, 4, 6 y 12.',
    },
  ];

  late Map<String, dynamic> currentQuestion;
  int? selectedAnswerIndex;

  @override
  void initState() {
    super.initState();
    generateQuestion();
  }

  void generateQuestion() {
    int randomIndex = DateTime.now().millisecondsSinceEpoch % questions.length;
    setState(() {
      currentQuestion = questions[randomIndex];
      selectedAnswerIndex = null;
    });
  }

  String _translateText(String text) {
    Map<String, String> translations = {
      'Word Problems Game': 'Juego de Problemas Verbales',
      'Solve Some Fun Word Problems!': '¡Resuelve Algunos Problemas Divertidos!',
      'Next Question': 'Siguiente Pregunta',
      'Tap to Translate': 'Toca para Traducir',
      'Correct!': '¡Correcto!',
      'Incorrect. Try again!': 'Incorrecto. ¡Inténtalo de nuevo!',
    };
    return _isEnglish ? text : (translations[text] ?? text);
  }

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;
    final bool isTablet = screenWidth > 600;

    return Scaffold(
      appBar: AppBar(
        title: Text(_translateText('Word Problems Game')),
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
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              "assets/word_problem.jpg",
              fit: BoxFit.cover,
            ),
          ),
          Center(
            child: Padding(
              padding: EdgeInsets.all(screenWidth * 0.05),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    _translateText('Solve Some Fun Word Problems!'),
                    style: TextStyle(fontSize: isTablet ? 28 : 22, fontWeight: FontWeight.bold, color: Colors.white),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: screenHeight * 0.02),

                  // 🔹 Display Question
                  Card(
                    elevation: 5,
                    color: Colors.white.withOpacity(0.9),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        children: [
                          Text(
                            _isEnglish ? currentQuestion['question_en'] : currentQuestion['question_es'],
                            style: TextStyle(fontSize: isTablet ? 24 : 18, fontWeight: FontWeight.bold),
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(height: screenHeight * 0.02),

                          // 🔹 Display Answer Options
                          ...List.generate(currentQuestion[_isEnglish ? 'answers_en' : 'answers_es'].length, (index) {
                            return Padding(
                              padding: const EdgeInsets.symmetric(vertical: 5.0),
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: selectedAnswerIndex == index ? Colors.green : Colors.blueAccent,
                                  padding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                                ),
                                onPressed: () {
                                  setState(() {
                                    selectedAnswerIndex = index;
                                  });
                                },
                                child: Text(
                                  currentQuestion[_isEnglish ? 'answers_en' : 'answers_es'][index],
                                  style: TextStyle(fontSize: isTablet ? 22 : 18, color: Colors.white),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            );
                          }),

                          // 🔹 Display Answer Explanation
                          if (selectedAnswerIndex != null) ...[
                            SizedBox(height: screenHeight * 0.02),
                            Text(
                              selectedAnswerIndex == currentQuestion['correctAnswerIndex']
                                  ? '✅ ${_translateText("Correct!")} ${_isEnglish ? currentQuestion['explanation_en'] : currentQuestion['explanation_es']}'
                                  : '❌ ${_translateText("Incorrect. Try again!")}',
                              style: TextStyle(
                                fontSize: isTablet ? 22 : 18,
                                fontWeight: FontWeight.bold,
                                color: selectedAnswerIndex == currentQuestion['correctAnswerIndex'] ? Colors.green : Colors.red,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.03),

                  // 🔹 Next Question Button
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.orange,
                      padding: EdgeInsets.symmetric(vertical: 15, horizontal: 30),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                    ),
                    onPressed: generateQuestion,
                    child: Text(
                      _translateText('Next Question'),
                      style: TextStyle(fontSize: isTablet ? 22 : 18, color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
