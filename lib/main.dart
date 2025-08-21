import 'package:flutter/material.dart';
import 'package:num_quest/FlashCards/practice_page.dart';
import 'game_list_page.dart';
import 'lessons_page.dart';

void main() => runApp(MaterialApp(
      home: MyApp(),
    ));

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Numquest',
      home: Scaffold(
        body: Stack(
          children: <Widget>[
            Positioned.fill(
              child: Image.asset(
                'assets/start_page.jpg',
                fit: BoxFit.cover,
              ),
            ),
            Center(
              child: LayoutBuilder(
                builder: (context, constraints) {
                  final isSmallScreen = constraints.maxWidth < 600;

                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      // Responsive title
                      Text(
                        'NUMQUEST',
                        style: TextStyle(
                          fontSize: isSmallScreen ? 50 : 100,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'RaleWay',
                          color: Colors.orange,
                        ),
                      ),
                      SizedBox(height: isSmallScreen ? 10 : 20),

                      // Responsive buttons layout
                      if (isSmallScreen)
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: _buildButtons(context, isSmallScreen),
                        )
                      else
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: _buildButtons(context, isSmallScreen),
                        ),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<Widget> _buildButtons(BuildContext context, bool isSmallScreen) {
    return [
      RoundedButton(
        text: 'LESSONS',
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => LessonsPage()),
          );
        },
        isSmallScreen: isSmallScreen,
      ),
      SizedBox(width: isSmallScreen ? 20 : 40, height: isSmallScreen ? 20 : 0),
      RoundedButton(
        text: 'PRACTICE',
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => PracticePage()),
          );
        },
        isSmallScreen: isSmallScreen,
      ),
      SizedBox(width: isSmallScreen ? 20 : 40, height: isSmallScreen ? 20 : 0),
      RoundedButton(
        text: 'PLAY',
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => GameListPage()),
          );
        },
        isSmallScreen: isSmallScreen,
      ),
    ];
  }
}

class RoundedButton extends StatelessWidget {
  final String text;
  final Function onPressed;
  final bool isSmallScreen;

  RoundedButton({
    required this.text,
    required this.onPressed,
    required this.isSmallScreen,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () => onPressed(),
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
            side: BorderSide(color: Colors.white),
          ),
        ),
        padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
          EdgeInsets.symmetric(
            vertical: isSmallScreen ? 12.0 : 20.0,
            horizontal: isSmallScreen ? 20.0 : 30.0,
          ),
        ),
      ),
      child: Text(
        text,
        style: TextStyle(fontSize: isSmallScreen ? 18 : 24),
      ),
    );
  }
}
