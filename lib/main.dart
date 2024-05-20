import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Numquest',
      home: Scaffold(
        body: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            // Background Image
            Image.asset(
              '/Users/manyasohal/num_quest/assets/vecteezy_meadow-panorama-3d-illustration-bright-landscape-of-green_20570946.jpg',
              fit: BoxFit.cover,
            ),
            // Overlay
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                // Title
                Text(
                  'NUMQUEST',
                  style: TextStyle(
                    fontSize: 90,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Raleway',
                    color: Colors.orange,
                  ),
                ),
                SizedBox(height: 10),
                // Buttons Row
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    RoundedButton(
                      text: 'LEARN',
                      onPressed: () {
                        // Navigate to learn page or perform desired action
                      },
                    ),
                    SizedBox(width: 20),
                    RoundedButton(
                      text: 'PLAY',
                      onPressed: () {
                        // Navigate to play page or perform desired action
                      },
                    ),
                    SizedBox(width: 20),
                    RoundedButton(
                      text: 'SETTINGS',
                      onPressed: () {
                        // Navigate to settings page or perform desired action
                      },
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class RoundedButton extends StatelessWidget {
  final String text;
  final Function()? onPressed;

  const RoundedButton({required this.text, this.onPressed, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
        ),
        padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
          EdgeInsets.symmetric(vertical: 20.0, horizontal: 30.0),
        ),
      ),
      child: Text(
        text,
        style: TextStyle(fontSize: 24),
      ),
    );
  }
}
