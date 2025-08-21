import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:confetti/confetti.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter_tts/flutter_tts.dart';

class NumberPatternMatchGame extends StatefulWidget {
  @override
  _NumberPatternMatchGameState createState() => _NumberPatternMatchGameState();
}

class _NumberPatternMatchGameState extends State<NumberPatternMatchGame> {
  late ConfettiController _confettiController;
  late final AudioPlayer _audioPlayer;
  final FlutterTts _flutterTts = FlutterTts();

  List<Map<String, dynamic>> questions = [
    {
      'category': 'Prime',
      'correctNumbers': [5],
      'options': [4, 5, 12, 25, 8],
    },
    {
      'category': 'Composite',
      'correctNumbers': [4],
      'options': [4, 5, 3, 2, 7],
    },
    {
      'category': 'Square',
      'correctNumbers': [9],
      'options': [7, 55, 9, 15, 26],
    },
    {
      'category': 'Prime',
      'correctNumbers': [13],
      'options': [12, 13, 14, 15, 16],
    },
    {
      'category': 'Composite',
      'correctNumbers': [12],
      'options': [11, 12, 13, 2, 7],
    },
    {
      'category': 'Square',
      'correctNumbers': [36],
      'options': [35, 36, 37, 38, 39],
    },
    {
      'category': 'Prime',
      'correctNumbers': [11],
      'options': [15, 10, 12, 11, 18],
    },
  ];

  int currentQuestionIndex = 0;
  List<int> draggedNumbers = [];
  String message = '';
  bool isCorrect = false;
  int score = 0;

  List<int> _getCorrectNumbers() => questions[currentQuestionIndex]['correctNumbers'];
  List<int> _getOptions() => questions[currentQuestionIndex]['options'];

  Future<void> checkAnswer() async {
    List<int> correctNumbers = _getCorrectNumbers();
    bool hasCorrectAnswer = draggedNumbers.any((n) => correctNumbers.contains(n));
    bool hasWrongAnswer = draggedNumbers.any((n) => !correctNumbers.contains(n));

    setState(() {
      if (hasCorrectAnswer && !hasWrongAnswer) {
        message = 'Correct!';
        isCorrect = true;
        score++;
      } else {
        message = 'Try Again!';
        isCorrect = false;
        draggedNumbers.clear();
      }
    });

    // Voice feedback
    await _flutterTts.setLanguage("en-US");
    await _flutterTts.setPitch(1.0);
    await _flutterTts.speak(message);
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
        message = 'You have completed all questions! Final score: $score';
        _confettiController.play();
      });
      _playCelebrationSound();
    }
  }

  void _playCelebrationSound() async {
    await _audioPlayer.play(AssetSource('sounds/celebration.mp3'));
  }

  @override
  void initState() {
    super.initState();
    _confettiController = ConfettiController(duration: const Duration(seconds: 3));
    _audioPlayer = AudioPlayer();
  }

  @override
  void dispose() {
    _confettiController.dispose();
    _audioPlayer.dispose();
    _flutterTts.stop();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final isTablet = size.width > 600;

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('background1.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: <Widget>[
                SizedBox(height: 20),
                Text(
                  'Category: ${questions[currentQuestionIndex]['category']}',
                  style: GoogleFonts.lato(
                    fontSize: isTablet ? 36 : 24,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  'Score: $score',
                  style: GoogleFonts.lato(
                    fontSize: isTablet ? 28 : 20,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 30),
                Expanded(
                  child: GridView.count(
                    crossAxisCount: isTablet ? 5 : 3,
                    crossAxisSpacing: 16.0,
                    mainAxisSpacing: 16.0,
                    children: _getOptions().map((number) {
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
                            child: Text(
                              '$number',
                              style: TextStyle(
                                  fontSize: 24,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                        childWhenDragging: Container(
                          color: Colors.grey,
                          child: Center(
                            child: Text('$number',
                                style:
                                    TextStyle(fontSize: 24, color: Colors.white)),
                          ),
                        ),
                        child: Container(
                          padding: EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            color: Colors.grey.shade50.withOpacity(0.7),
                          ),
                          child: Center(
                            child: Text(
                              '$number',
                              style: TextStyle(
                                fontSize: 35,
                                color: Colors.black38,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                ),
                SizedBox(height: 20),
                DragTarget<int>(
                  builder: (context, accepted, rejected) => Container(
                    height: 200,
                    width: double.infinity,
                    padding: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Colors.greenAccent,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(
                      child: draggedNumbers.isNotEmpty
                          ? ListView(
                              scrollDirection: Axis.horizontal,
                              children: draggedNumbers.map((number) {
                                return Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                    padding: EdgeInsets.all(16),
                                    color: Colors.white,
                                    child: Text('$number',
                                        style: TextStyle(fontSize: 24)),
                                  ),
                                );
                              }).toList(),
                            )
                          : Text('Drop numbers here',
                              style: GoogleFonts.lato(
                                  fontSize: isTablet ? 28 : 22,
                                  fontWeight: FontWeight.bold)),
                    ),
                  ),
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
                  child: Text('Submit',
                      style: TextStyle(
                          fontSize: isTablet ? 24 : 18, color: Colors.white)),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.teal,
                    padding: EdgeInsets.symmetric(vertical: 15, horizontal: 30),
                  ),
                ),
                SizedBox(height: 20),
                Text(
                  message,
                  style: TextStyle(
                      fontSize: isTablet ? 28 : 22,
                      color: isCorrect ? Colors.green : Colors.red,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: nextQuestion,
                  child: Text('Next Question',
                      style: TextStyle(
                          fontSize: isTablet ? 24 : 18, color: Colors.white)),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.orange,
                    padding: EdgeInsets.symmetric(vertical: 15, horizontal: 30),
                  ),
                ),
                _buildConfetti(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildConfetti() {
    return Stack(
      children: [
        Align(
          alignment: Alignment.topCenter,
          child: ConfettiWidget(
            confettiController: _confettiController,
            blastDirectionality: BlastDirectionality.explosive,
            emissionFrequency: 0.03,
            numberOfParticles: 30,
            maxBlastForce: 20,
            minBlastForce: 5,
            gravity: 0.2,
            colors: const [
              Colors.red,
              Colors.green,
              Colors.blue,
              Colors.orange,
              Colors.purple,
              Colors.yellow,
            ],
          ),
        ),
      ],
    );
  }
}
