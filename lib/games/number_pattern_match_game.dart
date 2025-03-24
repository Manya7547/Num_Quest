import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NumberPatternMatchGame extends StatefulWidget {
  @override
  _NumberPatternMatchGameState createState() => _NumberPatternMatchGameState();
}

class _NumberPatternMatchGameState extends State<NumberPatternMatchGame> {
  List<Map<String, dynamic>> questions = [
    {
      'category_en': 'Prime',
      'category_es': 'Primo',
      'correctNumbers': [5],
      'options': [4, 5, 12, 25, 8],
    },
    {
      'category_en': 'Composite',
      'category_es': 'Compuesto',
      'correctNumbers': [4],
      'options': [4, 5, 3, 2, 7],
    },
    {
      'category_en': 'Square',
      'category_es': 'Cuadrado',
      'correctNumbers': [9],
      'options': [7, 55, 9, 15, 26],
    },
  ];

  int currentQuestionIndex = 0;
  List<int> draggedNumbers = [];
  String message = '';
  bool isCorrect = false;
  int score = 0;
  bool _isEnglish = true; // Toggle for translation

  List<int> _getCorrectNumbers() {
    return questions[currentQuestionIndex]['correctNumbers'];
  }

  List<int> _getOptions() {
    return questions[currentQuestionIndex]['options'];
  }

  void checkAnswer() {
    List<int> correctNumbers = _getCorrectNumbers();
    bool hasCorrectAnswer =
        draggedNumbers.any((number) => correctNumbers.contains(number));
    bool hasWrongAnswer =
        draggedNumbers.any((number) => !correctNumbers.contains(number));

    setState(() {
      if (hasCorrectAnswer && !hasWrongAnswer) {
        message = _translateText('Correct!');
        isCorrect = true;
        score += 10;
      } else {
        message = _translateText('Try Again!');
        isCorrect = false;
        draggedNumbers.clear();
      }
    });
  }

  void nextQuestion() {
    if (currentQuestionIndex < questions.length - 1) {
      setState(() {
        currentQuestionIndex++;
        draggedNumbers.clear();
        message = '';
        isCorrect = false;
      });
    } else {
      setState(() {
        message = _translateText('You have completed all questions! Final score:') + ' $score';
      });
    }
  }

  String _translateText(String text) {
    Map<String, String> translations = {
      'Correct!': '¡Correcto!',
      'Try Again!': '¡Inténtalo de nuevo!',
      'You have completed all questions! Final score:': '¡Has completado todas las preguntas! Puntuación final:',
      'Tap to Translate': 'Toca para Traducir',
    };
    return _isEnglish ? text : (translations[text] ?? text);
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final isTablet = size.width > 600;

    return Scaffold(
      appBar: AppBar(
        title: Text(_isEnglish
            ? 'Number Pattern Match'
            : 'Coincidencia de Patrones de Números'),
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
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  '${_isEnglish ? "Category" : "Categoría"}: ${_isEnglish ? questions[currentQuestionIndex]['category_en'] : questions[currentQuestionIndex]['category_es']}',
                  style: GoogleFonts.lato(
                    textStyle: TextStyle(
                      fontSize: isTablet ? 36 : 24,
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
                SizedBox(height: 20),
                Text(
                  '${_isEnglish ? "Score" : "Puntuación"}: $score',
                  style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 30),

                Expanded(
                  child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: isTablet ? 5 : 3,
                      crossAxisSpacing: 16.0,
                      mainAxisSpacing: 16.0,
                    ),
                    itemCount: _getOptions().length,
                    itemBuilder: (context, index) {
                      final number = _getOptions()[index];
                      return Draggable<int>(
                        data: number,
                        feedback: Material(
                          color: Colors.transparent,
                          child: Container(
                            padding: EdgeInsets.all(16),
                            decoration: BoxDecoration(
                              color: Colors.blueAccent,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Center(
                              child: Text(
                                '$number',
                                style: TextStyle(
                                  fontSize: 24,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ),
                        child: Container(
                          padding: EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            color: Colors.white70,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Center(
                            child: Text(
                              '$number',
                              style: TextStyle(fontSize: 30),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                SizedBox(height: 20),

                DragTarget<int>(
                  builder: (context, accepted, rejected) {
                    return Container(
                      height: 200,
                      width: double.infinity,
                      padding: EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: Colors.greenAccent.withOpacity(0.8),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Center(
                        child: draggedNumbers.isNotEmpty
                            ? Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: draggedNumbers
                                    .map((number) => Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text(
                                            '$number',
                                            style: TextStyle(fontSize: 30),
                                          ),
                                        ))
                                    .toList(),
                              )
                            : Text(
                                _isEnglish ? 'Drop numbers here' : 'Suelta los números aquí',
                                style: TextStyle(fontSize: 24),
                              ),
                      ),
                    );
                  },
                  onAccept: (int number) {
                    setState(() {
                      if (!draggedNumbers.contains(number)) {
                        draggedNumbers.add(number);
                      }
                    });
                  },
                ),
                SizedBox(height: 20),

                ElevatedButton(
                  onPressed: checkAnswer,
                  child: Text(_translateText('Correct!'), style: TextStyle(fontSize: 24)),
                ),
                SizedBox(height: 20),

                Text(
                  message,
                  style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                    color: isCorrect ? Colors.green : Colors.red,
                  ),
                ),
                SizedBox(height: 20),

                ElevatedButton(
                  onPressed: nextQuestion,
                  child: Text(
                    _isEnglish ? 'Next Question' : 'Siguiente Pregunta',
                    style: TextStyle(fontSize: 24),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
