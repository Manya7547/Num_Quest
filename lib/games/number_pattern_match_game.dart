import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NumberPatternMatchGame extends StatefulWidget {
  @override
  _NumberPatternMatchGameState createState() => _NumberPatternMatchGameState();
}

class _NumberPatternMatchGameState extends State<NumberPatternMatchGame> {
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
  int score = 0; // Track the score

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
        message = 'Correct!';
        isCorrect = true;
        score++; // Increase score when the answer is correct
      } else {
        message = 'Try Again!';
        isCorrect = false;

        // Reset the dragged numbers to allow for another attempt
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
        message = 'You have completed all questions! Final score: $score';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final isTablet = size.width > 600;

    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
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
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'Category: ${questions[currentQuestionIndex]['category']}',
                  style: GoogleFonts.lato(
                    textStyle: TextStyle(
                      fontSize: isTablet ? 36 : 24,
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

                Text(
                  'Score: $score', // Display the current score
                  style: GoogleFonts.lato(
                    textStyle: TextStyle(
                      fontSize: isTablet ? 28 : 20,
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
                ),
                SizedBox(height: 30),

                // Number options for dragging
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
                              boxShadow: [
                                BoxShadow(color: Colors.black26, blurRadius: 8)
                              ],
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
                        childWhenDragging: Container(
                          width: 20,  // Set the width to a smaller value
                          height: 20,
                          padding: EdgeInsets.all(16),
                          color: Colors.grey,
                          child: Center(
                            child: Text(
                              '$number',
                              style: TextStyle(fontSize: 24, color: Colors.white),
                            ),
                          ),
                        ),
                          child: Container(
                            padding: EdgeInsets.all(16),
                            decoration: BoxDecoration(
                              color: Colors.grey.shade50.withOpacity(0.7),
                              // borderRadius: BorderRadius.circular(10), // Adding border radius
                              // border: Border.all(color: Colors.grey, width: 2), // Optional: adding a border
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
                    },
                  ),
                ),
                SizedBox(height: 20),

                // Drag target
                DragTarget<int>(
                  builder: (BuildContext context, List<int?> accepted,
                      List<dynamic> rejected) {
                    return Container(
                      height: 200, // Expanded height for the drag target
                      width: double.infinity,
                      padding: EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: Colors.greenAccent,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Colors.green, width: 2),
                      ),
                      child: Center(
                        child: draggedNumbers.isNotEmpty
                            ? ListView(
                          scrollDirection: Axis.horizontal,
                          children: draggedNumbers
                              .map((number) => Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              padding: EdgeInsets.all(16),
                              color: Colors.white,
                              child: Text(
                                '$number',
                                style: TextStyle(fontSize: 24),
                              ),
                            ),
                          ))
                              .toList(),
                        )
                            : Text(
                          'Drop numbers here',
                          style: GoogleFonts.lato(
                            textStyle: TextStyle(
                              fontSize: isTablet ? 28 : 22,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
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
                  onWillAccept: (data) {
                    return true;
                  },
                ),
                SizedBox(height: 20),

                // Submit button
                ElevatedButton(
                  onPressed: checkAnswer,
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 30.0),
                    backgroundColor: Colors.teal,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  child: Text(
                    'Submit',
                    style: GoogleFonts.lato(
                      textStyle: TextStyle(
                        fontSize: isTablet ? 24 : 18,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20),

                // Message text
                Text(
                  message,
                  style: GoogleFonts.lato(
                    textStyle: TextStyle(
                      fontSize: isTablet ? 28 : 22,
                      color: isCorrect ? Colors.green : Colors.red,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(height: 20),

                // Next Question button
                ElevatedButton(
                  onPressed: nextQuestion,
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 30.0),
                    backgroundColor: Colors.orange,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  child: Text(
                    'Next Question',
                    style: GoogleFonts.lato(
                      textStyle: TextStyle(
                        fontSize: isTablet ? 24 : 18,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
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
