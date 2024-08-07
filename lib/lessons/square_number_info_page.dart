import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:num_quest/widgets/MultipageContainer.dart';

class SquareNumberInfoPage extends StatelessWidget {
  final FlutterTts flutterTts = FlutterTts();

  void speakText(String text) async {
    await flutterTts.setLanguage("en-US"); // Set language to English
    await flutterTts.setPitch(1.0); // Set pitch
    await flutterTts.speak(text);
  }

  void speakTextSpanish(String text) async {
    await flutterTts.setLanguage("es-ES"); // Set language to Spanish
    await flutterTts.setPitch(1.0); // Set pitch
    await flutterTts.speak(text);
  }

  @override
  Widget build(BuildContext context) {
    return MultipageContainer(
      pages: [
        // First Page Content
        (bool isEnglish) => Column(
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
                          isEnglish
                              ? 'When a number or integer (not a fraction) is multiplied by itself, the resultant is called a "Square Number." For example, 3 multiplied by 3 is equal to 3-squared or 3 x 3 = 3². The exponential form of multiplication of a number or integer by itself is called a square number. Also, if we multiply the number by itself again, we get the cube of the integer: a x a x a = a³.'
                              : 'Cuando un número o entero (no una fracción) se multiplica por sí mismo, el resultado se llama "Número Cuadrado". Por ejemplo, 3 multiplicado por 3 es igual a 3 al cuadrado o 3 x 3 = 3². La forma exponencial de multiplicar un número o entero por sí mismo se llama número cuadrado. Además, si multiplicamos el número por sí mismo nuevamente, obtenemos el cubo del entero: a x a x a = a³.',
                          style: TextStyle(
                            fontSize: 30,
                            color: Color.fromARGB(255, 18, 3, 48),
                          ),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: 10),
                        IconButton(
                          icon: Icon(Icons.play_arrow),
                          onPressed: () {
                            isEnglish
                                ? speakText(
                                    'When a number or integer (not a fraction) is multiplied by itself, the resultant is called a "Square Number." For example, 3 multiplied by 3 is equal to 3-squared or 3 x 3 = 3². The exponential form of multiplication of a number or integer by itself is called a square number. Also, if we multiply the number by itself again, we get the cube of the integer: a x a x a = a³.')
                                : speakTextSpanish(
                                    'Cuando un número o entero (no una fracción) se multiplica por sí mismo, el resultado se llama "Número Cuadrado". Por ejemplo, 3 multiplicado por 3 es igual a 3 al cuadrado o 3 x 3 = 3². La forma exponencial de multiplicar un número o entero por sí mismo se llama número cuadrado. Además, si multiplicamos el número por sí mismo nuevamente, obtenemos el cubo del entero: a x a x a = a³.');
                          },
                        ),
                        SizedBox(height: 50),
                        Text(
                          isEnglish
                              ? 'Square numbers are always positive. If a negative sign is multiplied by itself, it results in a positive sign (+). For example, (-4)² = 16. So, we can say here 16 is a positive square number, whose square root is an integer again, i.e. √16 = 4.'
                              : 'Los números cuadrados siempre son positivos. Si un signo negativo se multiplica por sí mismo, resulta en un signo positivo (+). Por ejemplo, (-4)² = 16. Entonces, podemos decir que 16 es un número cuadrado positivo, cuya raíz cuadrada es un número entero, es decir, √16 = 4.',
                          style: TextStyle(
                            fontSize: 30,
                            color: Color.fromARGB(255, 18, 3, 48),
                          ),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: 10),
                        IconButton(
                          icon: Icon(Icons.play_arrow),
                          onPressed: () {
                            isEnglish
                                ? speakText(
                                    'Square numbers are always positive. If a negative sign is multiplied by itself, it results in a positive sign (+). For example, (-4)² = 16. So, we can say here 16 is a positive square number, whose square root is an integer again, i.e. √16 = 4.')
                                : speakTextSpanish(
                                    'Los números cuadrados siempre son positivos. Si un signo negativo se multiplica por sí mismo, resulta en un signo positivo (+). Por ejemplo, (-4)² = 16. Entonces, podemos decir que 16 es un número cuadrado positivo, cuya raíz cuadrada es un número entero, es decir, √16 = 4.');
                          },
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 350,
                  child: Padding(
                    padding: EdgeInsets.only(top: 10),
                    child: Image.asset('assets/square2.png'),
                  ),
                ),
              ],
            ),
        // Second Page Content
        (bool isEnglish) => Column(
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
                          isEnglish
                              ? 'In geometry, a square shape has all its sides equal. Therefore the area of the square is equal to the square of its side.'
                              : 'En geometría, una forma cuadrada tiene todos sus lados iguales. Por lo tanto, el área del cuadrado es igual al cuadrado de su lado.',
                          style: TextStyle(
                            fontSize: 30,
                            color: Color.fromARGB(255, 18, 3, 48),
                          ),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: 10),
                        IconButton(
                          icon: Icon(Icons.play_arrow),
                          onPressed: () {
                            isEnglish
                                ? speakText(
                                    'In geometry, a square shape has all its sides equal. Therefore the area of the square is equal to the square of its side.')
                                : speakTextSpanish(
                                    'En geometría, una forma cuadrada tiene todos sus lados iguales. Por lo tanto, el área del cuadrado es igual al cuadrado de su lado.');
                          },
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Image.asset('assets/square1.png', height: 400),
              ],
            ),
        // Third Page Content
        (bool isEnglish) => Column(
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
                          isEnglish
                              ? 'The area of square is best example of square of a number.'
                              : 'El área de un cuadrado es el mejor ejemplo del cuadrado de un número.',
                          style: TextStyle(
                            fontSize: 30,
                            color: Color.fromARGB(255, 18, 3, 48),
                          ),
                        ),
                        SizedBox(height: 10),
                        IconButton(
                          icon: Icon(Icons.play_arrow),
                          onPressed: () {
                            isEnglish
                                ? speakText(
                                    'The area of square is best example of square of a number.')
                                : speakTextSpanish(
                                    'El área de un cuadrado es el mejor ejemplo del cuadrado de un número.');
                          },
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 40),
                Image.asset('assets/square3.png', height: 600),
              ],
            ),
        // Fourth Page Content
        (bool isEnglish) => Column(
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
                          isEnglish
                              ? 'Now that you know what sqaure numbers are let\'s go ahead and solve some fun problems.'
                              : 'Ahora que sabes qué son los números cuadrados, vamos a resolver algunos problemas divertidos',
                          style: TextStyle(
                            fontSize: 30,
                            color: Color.fromARGB(255, 18, 3, 48),
                          ),
                        ),
                        SizedBox(height: 10),
                        IconButton(
                          icon: Icon(Icons.play_arrow),
                          onPressed: () {
                            isEnglish
                                ? speakText(
                                    'Now that you know what composite numbers are let\'s go ahead and solve some fun problems.')
                                : speakTextSpanish(
                                    'Ahora que sabes qué son los números cuadrados, vamos a resolver algunos problemas divertidos.');
                          },
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 40),
                Image.asset('assets/practice.png', height: 500),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(
                    //       builder: (context) => WordProblemPractice()),
                    // );
                  },
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                    backgroundColor: Colors.orange,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  child: Text(
                    isEnglish ? 'Quiz' : 'examen',
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                ),
              ],
            ),
      ],
    );
  }
}
