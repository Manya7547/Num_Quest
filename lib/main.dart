import 'package:flutter/material.dart';
import 'package:num_quest/FlashCards/practice_page.dart';
import 'game_list_page.dart';
import 'lessons_page.dart';
//import 'game_list_page.dart';

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
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'NUMQUEST',
                    style: TextStyle(
                      fontSize: 100,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'RaleWay',
                      color: Colors.orange,
                    ),
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      RoundedButton(
                        text: 'LESSONS',
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => LessonsPage()),
                          );
                        },
                      ),
                      SizedBox(width: 40),
                      RoundedButton(
                        text: 'PRACTICE',
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => PracticePage()),
                          );
                        },
                      ),
                      SizedBox(width: 40),
                      RoundedButton(
                        text: 'PLAY',
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => GameListPage()),
                          );
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class RoundedButton extends StatelessWidget {
  final String text;
  final Function onPressed;

  RoundedButton({required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () => onPressed(),
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius:
                BorderRadius.circular(20.0), // Increased border radius
            side: BorderSide(color: Colors.white),
          ),
        ),
        padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
          EdgeInsets.symmetric(
              vertical: 20.0, horizontal: 30.0), // Increased padding
        ),
      ),
      child: Text(
        text,
        style: TextStyle(fontSize: 24), // Increased font size
      ),
    );
  }
}
