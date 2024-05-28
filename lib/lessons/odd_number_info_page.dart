import 'package:flutter/material.dart';
import 'package:flip_card/flip_card.dart'; // Import the FlipCard package

class OddNumberInfoPage extends StatelessWidget {
  final GlobalKey<FlipCardState> _flipCardKey = GlobalKey<FlipCardState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('What are Odd Numbers?'),
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
              'Odd numbers are numbers that cannot be divided by 2 evenly.',
              style: TextStyle(
                  fontSize: 32,
                  color: Colors.white), // Increased font size and colored text
            ),
            SizedBox(height: 20),
            Text(
              'Imagine you have some cookies and you want to share them equally between you and your friend. If you can’t give each of you exactly the same amount of cookies without any extras, then the number of cookies you have is an odd number!',
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
              'Los números impares son números que no se pueden dividir por 2 de manera uniforme.',
              style: TextStyle(
                  fontSize: 28,
                  color: Colors.white), // Increased font size and colored text
            ),
            SizedBox(height: 20),
            Text(
              'Imagina que tienes algunas galletas y quieres compartirlas equitativamente entre tú y tu amigo. Si no puedes darle a cada uno exactamente la misma cantidad de galletas sin extras, entonces la cantidad de galletas que tienes es un número impar.',
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
          'Here are a few examples of odd numbers:',
          style: TextStyle(
              fontSize: 24,
              color: Colors.white), // Increased font size and colored text
        ),
        SizedBox(height: 20),
        _buildBulletPoint(context,
            '1: If you have 1 cookie, you can’t split it evenly between you and your friend without any extras.'),
        _buildBulletPoint(context,
            '3: With 3 apples, if you try to give 2 to each of you, there will be one apple left.'),
        _buildBulletPoint(context,
            '5: If you have 5 stickers, you can’t split them evenly between you and your friend without any extras.'),
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
