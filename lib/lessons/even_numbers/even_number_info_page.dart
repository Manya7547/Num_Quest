import 'package:flutter/material.dart';
import 'package:num_quest/lessons/even_numbers/practice_even.dart';

class EvenNumberInfoPage extends StatefulWidget {
  EvenNumberInfoPage({Key? key}) : super(key: key);

  @override
  _EvenNumberInfoPageState createState() => _EvenNumberInfoPageState();
}

class _EvenNumberInfoPageState extends State<EvenNumberInfoPage> {
  bool _isEnglish = true; // State to keep track of language

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_isEnglish
            ? 'What are Even Numbers?'
            : '¿Qué son los números pares?'),
      ),
      body: PageView(
        children: [
          // First Page
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  'assets/classboard.jpg',
                ),
                fit: BoxFit.cover,
              ),
            ),
            child: Column(
              children: <Widget>[
                Align(
                  alignment: Alignment.topRight,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(
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
                  ),
                ),
                Expanded(
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
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
                                      color: Color.fromARGB(255, 18, 3, 48),
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                  SizedBox(height: 50),
                                  Text(
                                    _isEnglish
                                        ? 'Imagine you have some candies, and you want to share them equally between you and your friend. If you can give each of you exactly the same amount of candies without any extras, then the number of candies you have is an even number! Even Numbers can be halved with no remainders left over.'
                                        : 'Imagina que tienes algunos dulces y quieres compartirlos en partes iguales entre tú y tu amigo. Si pueden darles a cada uno exactamente la misma cantidad de dulces sin extras, ¡entonces la cantidad de dulces que tienen es par! Los números pares se pueden dividir por la mitad sin dejar restos.',
                                    style: TextStyle(
                                      fontSize: 30,
                                      color: Color.fromARGB(255, 18, 3, 48),
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 350, // Adjusted height
                            child: Padding(
                              padding: EdgeInsets.only(
                                  top: 10), // Add top padding here
                              child: Image.asset('assets/candies.png'),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          // Second Page
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  'assets/classboard.jpg',
                ),
                fit: BoxFit.cover,
              ),
            ),
            child: Column(
              children: [
                Align(
                  alignment: Alignment.topRight,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(
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
                  ),
                ),
                Expanded(
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
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
                                        ? 'Suppose you have 6 candies. Let\'s make pairs, we see that all the candies are in pairs, and there are no candies left over. That means 6 is an even number! Even Numbers can be halved with no remainders left over.'
                                        : 'Supongamos que tienes 6 caramelos. Hagamos parejas, vemos que todos los caramelos están emparejados y no queda ningún caramelo sobrante. ¡Eso significa que 6 es un número par! Los números pares se pueden dividir por la mitad sin dejar restos.',
                                    style: TextStyle(
                                      fontSize: 30,
                                      color: Color.fromARGB(255, 18, 3, 48),
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 100,
                          ),
                          Image.asset(
                            'assets/candies2.png',
                            height: 400,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          // Third Page
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  'assets/classboard.jpg',
                ),
                fit: BoxFit.cover,
              ),
            ),
            child: Column(
              children: [
                Align(
                  alignment: Alignment.topRight,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(
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
                  ),
                ),
                Expanded(
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
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
                                        ? 'This is a number square. Do you see the numbers that are highlighted in a special color? Those are our even numbers! They form a special pattern! Can you see the way they line up in neat rows and columns?'
                                        : 'Este es un cuadrado numérico. ¿Ves los números que están resaltados en un color especial? ¡Esos son nuestros números pares! ¡Forman un patrón especial! ¿Puedes ver cómo se alinean en filas y columnas ordenadas?',
                                    style: TextStyle(
                                      fontSize: 30,
                                      color: Color.fromARGB(255, 18, 3, 48),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 40,
                          ),
                          Image.asset(
                            'assets/number_square.png',
                            height: 600,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          //fourth page
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  'assets/classboard.jpg',
                ),
                fit: BoxFit.cover,
              ),
            ),
            child: Column(
              children: [
                Align(
                  alignment: Alignment.topRight,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(
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
                  ),
                ),
                Expanded(
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Card(
                            color: Colors.white.withOpacity(0.8),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  Text(
                                    _isEnglish
                                        ? 'Now that you know what even numbers are let\'s go ahead and solve some fun problems.'
                                        : 'Ahora que sabes qué son los números pares, vamos a resolver algunos problemas divertidos.',
                                    style: TextStyle(
                                      fontSize: 30,
                                      color: Color.fromARGB(255, 18, 3, 48),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 40,
                          ),
                          Image.asset(
                            'assets/practice.png',
                            height: 500,
                          ),
                          SizedBox(height: 20),
                          ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        WordProblemPractice()),
                              );
                            },
                            style: ElevatedButton.styleFrom(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 20),
                              backgroundColor: Colors.orange,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                            ),
                            child: Text(
                              'Practice',
                              style:
                                  TextStyle(fontSize: 20, color: Colors.white),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
