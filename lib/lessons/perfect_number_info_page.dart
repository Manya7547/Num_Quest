import 'package:flutter/material.dart';
import 'package:flip_card/flip_card.dart'; // Import the FlipCard package

class PerfectNumberInfoPage extends StatelessWidget {
  final GlobalKey<FlipCardState> _flipCardKey = GlobalKey<FlipCardState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('What are Perfect Numbers?'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: FlipCard(
            key: _flipCardKey, // Assign the GlobalKey to the FlipCard
            direction:
                FlipDirection.HORIZONTAL, // Set the direction of the flip
            flipOnTouch: true,
            front: _buildFront(context),
            back: _buildBack(context),
          ),
        ),
      ),
    );
  }

  Widget _buildFront(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(
              '/Users/manyasohal/num_quest/assets/classboard.jpg'), // Set your background image here
          fit: BoxFit.cover,
        ),
      ),
      child: Container(
        color: Colors.black.withOpacity(0.5), // Add opacity to background color
        padding: EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Perfect numbers are numbers that are equal to the sum of their proper divisors, excluding the number itself.',
              style: TextStyle(
                  fontSize: 32,
                  color: Colors.white), // Increased font size and colored text
            ),
            SizedBox(height: 20),
            Text(
              'For example, the first perfect number is 6 because its divisors are 1, 2, and 3, and 1 + 2 + 3 = 6.',
              style: TextStyle(
                  fontSize: 24,
                  color: Colors.white), // Increased font size and colored text
            ),
            SizedBox(height: 20),
            _buildExamples(context),
            SizedBox(height: 20),
            RotatedBox(
              quarterTurns: 1, // Rotate the icon button 90 degrees
              child: IconButton(
                icon: Icon(Icons.translate),
                onPressed: () {
                  // Add logic to flip the card using the GlobalKey
                  _flipCardKey.currentState?.toggleCard();
                },
              ),
            ),
            Text(
              'Tap to Translate',
              style: TextStyle(
                  fontSize: 24,
                  color: Colors.white), // Increased font size and colored text
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBack(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(
              '/Users/manyasohal/num_quest/assets/classboard.jpg'), // Set your background image here
          fit: BoxFit.cover,
        ),
      ),
      child: Container(
        color: Colors.black.withOpacity(0.5), // Add opacity to background color
        padding: EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Los números perfectos son números que son iguales a la suma de sus divisores propios, excluyendo el propio número.',
              style: TextStyle(
                  fontSize: 28,
                  color: Colors.white), // Increased font size and colored text
            ),
            SizedBox(height: 20),
            Text(
              'Por ejemplo, el primer número perfecto es 6 porque sus divisores son 1, 2 y 3, y 1 + 2 + 3 = 6.',
              style: TextStyle(
                  fontSize: 24,
                  color: Colors.white), // Increased font size and colored text
            ),
            SizedBox(height: 20),
            _buildExamples(context),
            SizedBox(height: 20),
            RotatedBox(
              quarterTurns: 1, // Rotate the icon button 90 degrees
              child: IconButton(
                icon: Icon(Icons.translate),
                onPressed: () {
                  // Add logic to flip the card using the GlobalKey
                  _flipCardKey.currentState?.toggleCard();
                },
              ),
            ),
            Text(
              'Tap to Translate',
              style: TextStyle(
                  fontSize: 24,
                  color: Colors.white), // Increased font size and colored text
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildExamples(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 20),
        Text(
          'Here are a few examples of perfect numbers:',
          style: TextStyle(
              fontSize: 24,
              color: Colors.white), // Increased font size and colored text
        ),
        SizedBox(height: 20),
        _buildBulletPoint(context, '6: 1 + 2 + 3 = 6'),
        _buildBulletPoint(context, '28: 1 + 2 + 4 + 7 + 14 = 28'),
        _buildBulletPoint(
            context, '496: 1 + 2 + 4 + 8 + 16 + 31 + 62 + 124 + 248 = 496'),
        SizedBox(height: 20),
      ],
    );
  }

  Widget _buildBulletPoint(BuildContext context, String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(right: 10),
            child: Icon(
              Icons.circle,
              size: 20,
              color: Colors.white, // Change bullet point color to white
            ),
          ),
          Expanded(
            child: Text(
              text,
              style: TextStyle(
                  fontSize: 24,
                  color: Colors.white), // Increased font size and colored text
            ),
          ),
        ],
      ),
    );
  }
}
