import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:google_fonts/google_fonts.dart';

class FactorsPracticePage extends StatelessWidget {
  FactorsPracticePage({super.key});
  final FlutterTts flutterTts = FlutterTts();

  void speak(String text) async {
    await flutterTts.setLanguage("en-US");
    await flutterTts.setPitch(1.0);
    await flutterTts.speak(text);
  }

  void showResultDialog(BuildContext context, bool isCorrect) {
  String message = isCorrect ? 'Correct!' : 'Try Again.';
  speak(message);

  showDialog(
    context: context,
    barrierDismissible: false, // prevent closing by tapping outside
    builder: (BuildContext dialogContext) {
      return AlertDialog(
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        title: Text(
          isCorrect ? 'Well Done!' : 'Oops!',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: isCorrect ? Colors.green : Colors.red,
          ),
        ),
        content: Text(
          message,
          style: const TextStyle(fontSize: 20)
        ),
        actions: [
          TextButton(
            child: const Text('OK', style: TextStyle(fontSize: 18)),
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
        title: const Text('Factors Practice'),
        backgroundColor: Colors.orange,
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
                    'Tap on the correct answer',
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

                  // Question Cards
                  buildQuestionCard(
                    context,
                    question: 'Which of the following are factors of 18?',
                    options: ['2', '5', '9', '12'],
                    correctAnswers: ['2', '9'],
                  ),
                  buildQuestionCard(
                    context,
                    question: 'Which number is a common factor of 12 and 16?',
                    options: ['2', '3', '4', '6'],
                    correctAnswers: ['2', '4'],
                  ),
                  buildQuestionCard(
                    context,
                    question: 'Which one is NOT a factor of 24?',
                    options: ['1', '3', '8', '7'],
                    correctAnswers: ['7'],
                  ),
                  buildQuestionCard(
                    context,
                    question: 'What is the highest common factor (HCF) of 18 and 24?',
                    options: ['3', '6', '9', '12'],
                    correctAnswers: ['6'],
                  ),
                  buildQuestionCard(
                    context,
                    question: 'Which number has exactly two factors?',
                    options: ['1', '7', '9', '10'],
                    correctAnswers: ['7'],
                  ),
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
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text(
              question,
              style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 12),
            ...options.map((option) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 6.0),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.orange.shade300,
                    foregroundColor: Colors.white,
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
