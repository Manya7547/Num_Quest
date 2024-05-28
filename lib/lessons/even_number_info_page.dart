import 'package:flutter/material.dart';
import 'package:num_quest/lessons/EvenNumberExamplesPage.dart';
import 'package:num_quest/practice/practice_even.dart';

class EvenNumberInfoPage extends StatefulWidget {
  EvenNumberInfoPage({super.key});

  @override
  _EvenNumberInfoPageState createState() => _EvenNumberInfoPageState();
}

class _EvenNumberInfoPageState extends State<EvenNumberInfoPage> {
  bool _isEnglish = true; // State to keep track of language

  double _opacity1 = 0.0;
  double _opacity2 = 0.0;
  double _opacity3 = 0.0;
  double _opacity4 = 0.0;

  @override
  void initState() {
    super.initState();
    // Start the animation after a delay
    Future.delayed(Duration(milliseconds: 500), () {
      setState(() {
        _opacity1 = 1.0;
      });
    });
    Future.delayed(Duration(milliseconds: 1000), () {
      setState(() {
        _opacity2 = 1.0;
      });
    });
    Future.delayed(Duration(milliseconds: 1500), () {
      setState(() {
        _opacity3 = 1.0;
      });
    });
    Future.delayed(Duration(milliseconds: 2000), () {
      setState(() {
        _opacity4 = 1.0;
      });
    });
  }

  Widget buildEvenNumberCircle(int number, double opacity) {
    return AnimatedOpacity(
      duration: Duration(milliseconds: 500),
      opacity: opacity,
      child: Container(
        width: 80,
        height: 80,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.blue.withOpacity(0.8),
        ),
        child: Center(
          child: Text(
            number.toString(),
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_isEnglish
            ? 'What are Even Numbers?'
            : '¿Qué son los números pares?'),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
                '/Users/manyasohal/num_quest/assets/classboard.jpg'), // Set your background image here
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: <Widget>[
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Card(
                        color: Colors.white.withOpacity(0.8),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                _isEnglish
                                    ? 'Even numbers can be small or they can be very big. If a number ends in a 0, 2, 4, 6 or 8, it is an even number.'
                                    : 'Los números pares pueden ser pequeños o muy grandes. Si un número termina en 0, 2, 4, 6 u 8, es un número par.',
                                style: TextStyle(
                                    fontSize: 30,
                                    color: Color.fromARGB(255, 18, 3, 48)),
                                textAlign: TextAlign.center,
                              ),
                              SizedBox(height: 20),
                              Text(
                                _isEnglish
                                    ? 'Imagine you have some candies, and you want to share them equally between you and your friend. If you can give each of you exactly the same amount of candies without any extras, then the number of candies you have is an even number!'
                                    : 'Imagina que tienes algunos dulces y quieres compartirlos en partes iguales entre tú y tu amigo. Si pueden darles a cada uno exactamente la misma cantidad de dulces sin extras, ¡entonces la cantidad de dulces que tienen es par!',
                                style: TextStyle(
                                    fontSize: 30,
                                    color: Color.fromARGB(255, 18, 3, 48)),
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 150, // Set the height of the image
                        child: Image.asset(
                            '/Users/manyasohal/num_quest/assets/candies.png'),
                      ),
                      SizedBox(height: 15),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          buildEvenNumberCircle(12, _opacity1),
                          buildEvenNumberCircle(4, _opacity2),
                          buildEvenNumberCircle(76, _opacity3),
                          buildEvenNumberCircle(28, _opacity4),
                        ],
                      ),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => EvenNumberExamplesPage()),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        padding:
                            EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                        backgroundColor: Colors.blue,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      child: Text(
                        _isEnglish ? 'Examples' : 'Ejemplos',
                        style: TextStyle(fontSize: 20, color: Colors.white),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => WordProblemPractice()),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        padding:
                            EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                        backgroundColor: Colors.green,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      child: Text(
                        _isEnglish ? 'Practice' : 'Práctica',
                        style: TextStyle(fontSize: 20, color: Colors.white),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          _isEnglish = !_isEnglish;
                        });
                      },
                      style: ElevatedButton.styleFrom(
                        padding:
                            EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                        backgroundColor: Colors.orange,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      child: Text(
                        _isEnglish ? 'Translate' : 'Traducir',
                        style: TextStyle(fontSize: 20, color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
