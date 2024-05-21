import 'package:flutter/material.dart';
import 'package:flip_card/flip_card.dart'; // Import the FlipCard package

class EvenNumberInfoPage extends StatelessWidget {
  final GlobalKey<FlipCardState> _flipCardKey = GlobalKey<FlipCardState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('What are Even Numbers?'),
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
              'Even numbers are numbers that you can divide by 2 and get a whole number without any leftovers.',
              style: TextStyle(
                  fontSize: 32,
                  color: Colors.white), // Increased font size and colored text
            ),
            SizedBox(height: 20),
            Text(
              'Imagine you have some candies and you want to share them equally between you and your friend. If you can give each of you exactly the same amount of candies without any extras, then the number of candies you have is an even number!',
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
              'Los números pares son números que puedes dividir por 2 y obtener un número entero sin sobras.',
              style: TextStyle(
                  fontSize: 28,
                  color: Colors.white), // Increased font size and colored text
            ),
            SizedBox(height: 20),
            Text(
              'Imagina que tienes algunas golosinas y quieres compartirlas equitativamente entre tú y tu amigo. Si puedes darle a cada uno exactamente la misma cantidad de golosinas sin extras, entonces la cantidad de golosinas que tienes es un número par.',
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
          'Here are a few examples of even numbers:',
          style: TextStyle(
              fontSize: 24,
              color: Colors.white), // Increased font size and colored text
        ),
        SizedBox(height: 20),
        _buildBulletPoint(context,
            '2: If you have 2 cookies, you can give 1 to you and 1 to your friend, and there won\'t be any leftover cookies.'),
        _buildBulletPoint(context,
            '4: With 4 apples, you can give 2 to each of you, and again, no apples will be left behind.'),
        _buildBulletPoint(context,
            '6: If you have 6 stickers, you can split them into 3 for each of you, and everyone gets the same number.'),
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
