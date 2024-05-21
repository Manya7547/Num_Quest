import 'package:flutter/material.dart';
import 'package:flip_card/flip_card.dart'; // Import the FlipCard package

class TriangularNumberInfoPage extends StatelessWidget {
  final GlobalKey<FlipCardState> _flipCardKey = GlobalKey<FlipCardState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('What are Triangle Numbers?'),
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
              'Triangle numbers are numbers that can form an equilateral triangle when dots are arranged in the shape of a triangle.',
              style: TextStyle(
                  fontSize: 32,
                  color: Colors.white), // Increased font size and colored text
            ),
            SizedBox(height: 20),
            Text(
              'Imagine you have some dots and you arrange them in the shape of a triangle with one dot in the first row, two dots in the second row, three dots in the third row, and so on. The number of dots you need to form the triangle is a triangle number!',
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
              'Los números triangulares son números que pueden formar un triángulo equilátero cuando los puntos están dispuestos en forma de triángulo.',
              style: TextStyle(
                  fontSize: 28,
                  color: Colors.white), // Increased font size and colored text
            ),
            SizedBox(height: 20),
            Text(
              'Imagina que tienes algunos puntos y los dispones en forma de triángulo con un punto en la primera fila, dos puntos en la segunda fila, tres puntos en la tercera fila, y así sucesivamente. La cantidad de puntos que necesitas para formar el triángulo es un número triangular.',
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
          'Here are a few examples of triangle numbers:',
          style: TextStyle(
              fontSize: 24,
              color: Colors.white), // Increased font size and colored text
        ),
        SizedBox(height: 20),
        _buildBulletPoint(context,
            'Triangle numbers up to 10: 1, 3, 6, 10, 15, 21, 28, 36, 45, 55'),
        _buildBulletPoint(context,
            'Triangle numbers up to 20: 1, 3, 6, 10, 15, 21, 28, 36, 45, 55, 66, 78, 91, 105, 120, 136, 153, 171, 190, 210'),
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
