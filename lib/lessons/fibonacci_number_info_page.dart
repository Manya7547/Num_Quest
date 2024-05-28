import 'package:flutter/material.dart';
import 'package:flip_card/flip_card.dart'; // Import the FlipCard package

class FibonacciNumberInfoPage extends StatelessWidget {
  final GlobalKey<FlipCardState> _flipCardKey = GlobalKey<FlipCardState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('What are Fibonacci Numbers?'),
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
              'assets/classboard.jpg'), // Set your background image here
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
              'Fibonacci numbers are a series of numbers in which each number is the sum of the two preceding ones, usually starting with 0 and 1.',
              style: TextStyle(
                  fontSize: 32,
                  color: Colors.white), // Increased font size and colored text
            ),
            SizedBox(height: 20),
            Text(
              'These numbers often appear in nature, such as in the branching of trees or in the arrangement of seeds in a sunflower.',
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
              'assets/classboard.jpg'), // Set your background image here
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
              'Los números de Fibonacci son una serie de números en la cual cada número es la suma de los dos anteriores, generalmente comenzando con 0 y 1.',
              style: TextStyle(
                  fontSize: 28,
                  color: Colors.white), // Increased font size and colored text
            ),
            SizedBox(height: 20),
            Text(
              'Estos números a menudo aparecen en la naturaleza, como en la ramificación de los árboles o en la disposición de las semillas en un girasol.',
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
          'Here are a few examples of Fibonacci numbers:',
          style: TextStyle(
              fontSize: 24,
              color: Colors.white), // Increased font size and colored text
        ),
        SizedBox(height: 20),
        _buildBulletPoint(context,
            'First 10 Fibonacci numbers: 0, 1, 1, 2, 3, 5, 8, 13, 21, 34'),
        _buildBulletPoint(context,
            'First 20 Fibonacci numbers: 0, 1, 1, 2, 3, 5, 8, 13, 21, 34, 55, 89, 144, 233, 377, 610, 987, 1597, 2584, 4181'),
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
