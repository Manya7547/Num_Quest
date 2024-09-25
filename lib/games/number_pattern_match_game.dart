import 'package:flutter/material.dart';

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
      'correctNumbers': [4],
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

  List<int> _getCorrectNumbers() {
    return questions[currentQuestionIndex]['correctNumbers'];
  }

  List<int> _getOptions() {
    return questions[currentQuestionIndex]['options'];
  }

  void checkAnswer() {
    List<int> correctNumbers = _getCorrectNumbers();
    bool hasCorrectAnswer = draggedNumbers.any((number) => correctNumbers.contains(number));
    bool hasWrongAnswer = draggedNumbers.any((number) => !correctNumbers.contains(number));

    setState(() {
      if (hasCorrectAnswer && !hasWrongAnswer) {
        message = 'Correct!';
        isCorrect = true;
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
        message = 'You have completed all questions!';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final isTablet = size.width > 600;

    return Scaffold(
      appBar: AppBar(
        title: Text('Number Pattern Match Game'),
        backgroundColor: Colors.teal,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: isTablet ? 40.0 : 16.0, vertical: 20.0),
        child: Column(
          children: [
            Text(
              'Category: ${questions[currentQuestionIndex]['category']}',
              style: TextStyle(fontSize: isTablet ? 24 : 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),

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
                          boxShadow: [BoxShadow(color: Colors.black26, blurRadius: 8)],
                        ),
                        child: Center(
                          child: Text(
                            '$number',
                            style: TextStyle(fontSize: 24, color: Colors.white, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
                    childWhenDragging: Container(
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
                      color: Colors.lightBlueAccent,
                      child: Center(
                        child: Text(
                          '$number',
                          style: TextStyle(fontSize: 24, color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),

            SizedBox(height: 20),

            DragTarget<int>(
              builder: (BuildContext context, List<int?> accepted, List<dynamic> rejected) {
                return Container(
                  height: 150,
                  width: double.infinity,
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
                      style: TextStyle(fontSize: isTablet ? 24 : 18, fontWeight: FontWeight.bold),
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

            ElevatedButton(
              onPressed: checkAnswer,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.teal,
                padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 30.0),
              ),
              child: Text(
                'Submit',
                style: TextStyle(fontSize: isTablet ? 22 : 16, fontWeight: FontWeight.bold),
              ),
            ),

            SizedBox(height: 20),

            Text(
              message,
              style: TextStyle(
                fontSize: isTablet ? 24 : 18,
                fontWeight: FontWeight.bold,
                color: isCorrect ? Colors.green : Colors.red,
              ),
            ),

            SizedBox(height: 20),

            ElevatedButton(
              onPressed: nextQuestion,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.teal,
                padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 30.0),
              ),
              child: Text(
                'Next Question',
                style: TextStyle(fontSize: isTablet ? 22 : 16, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
