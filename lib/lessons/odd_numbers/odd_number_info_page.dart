import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import '../../widgets/MultipageContainer.dart';
import './practice_odd.dart';

class OddNumberInfoPage extends StatelessWidget {
  final FlutterTts flutterTts = FlutterTts();

  Future<void> speak(String text, bool isEnglish) async {
    await flutterTts.setLanguage(isEnglish ? 'en-US' : 'es-ES');
    await flutterTts.setPitch(1.0);
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
                              ? 'Odd numbers, like even numbers can be small or they can be very big. If a number ends in a 1 (one), 3 (three), 5 (five), 7 (seven) or 9 (nine) it is an odd number.'
                              : 'Los números impares, al igual que los pares, pueden ser pequeños o muy grandes. Si un número termina en 1 (uno), 3 (tres), 5 (cinco), 7 (siete) o 9 (nueve) es un número impar.',
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
                            speak(
                              isEnglish
                                  ? 'Odd numbers, like even numbers can be small or they can be very big. If a number ends in a 1, 3, 5, 7 or 9 it is an odd number.'
                                  : 'Los números impares, al igual que los pares, pueden ser pequeños o muy grandes. Si un número termina en 1, 3, 5, 7 o 9 es un número impar.',
                              isEnglish,
                            );
                          },
                        ),
                        SizedBox(height: 50),
                        Text(
                          isEnglish
                              ? 'Imagine you have some candies, and you want to share them equally between you and your friend. If after dividing the candies equally, there is one candy left over, then the number of candies you have is an odd number! Odd numbers can\'t be halved exactly, there\'s always one left over.'
                              : 'Imagina que tienes algunos dulces y quieres compartirlos en partes iguales entre tú y tu amigo. Si después de dividir los caramelos en partes iguales, queda un caramelo, entonces el número de caramelos que tienes es impar. Los números impares no se pueden dividir exactamente por la mitad, siempre sobra uno.',
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
                            speak(
                              isEnglish
                                  ? 'Imagine you have some candies, and you want to share them equally between you and your friend. If after dividing the candies equally, there is one candy left over, then the number of candies you have is an odd number! Odd numbers can\'t be halved exactly, there\'s always one left over.'
                                  : 'Imagina que tienes algunos dulces y quieres compartirlos en partes iguales entre tú y tu amigo. Si después de dividir los caramelos en partes iguales, queda un caramelo, entonces el número de caramelos que tienes es impar. Los números impares no se pueden dividir exactamente por la mitad, siempre sobra uno.',
                              isEnglish,
                            );
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
                    child: Image.asset('assets/Odd_candy.png'),
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
                              ? 'Suppose you have 7 (seven) candies. Let\'s make pairs, we see that after pairing the candies, there is one candy left over. That means 7 (seven) is an odd number! Odd numbers can\'t be halved exactly, there\'s always one left over.'
                              : 'Supongamos que tienes 7 (siete) caramelos. Hagamos parejas, vemos que después de emparejar los caramelos queda un caramelo. ¡Eso significa que 7 (siete) es un número impar! Los números impares no se pueden dividir exactamente por la mitad, siempre sobra uno.',
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
                            speak(
                              isEnglish
                                  ? 'Suppose you have 7 candies. Let\'s make pairs, we see that after pairing the candies, there is one candy left over. That means 7 is an odd number! Odd numbers can\'t be halved exactly, there\'s always one left over.'
                                  : 'Supongamos que tienes 7 caramelos. Hagamos parejas, vemos que después de emparejar los caramelos queda un caramelo. ¡Eso significa que 7 es un número impar! Los números impares no se pueden dividir exactamente por la mitad, siempre sobra uno.',
                              isEnglish,
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 100),
                Image.asset('assets/Odd_candy_2.png', height: 400),
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
                              ? 'This is a number square. Do you see the numbers that are highlighted in a special color? Those are our odd numbers! They form a special pattern! Can you see the way they line up in neat rows and columns?'
                              : 'Este es un cuadrado numérico. ¿Ves los números que están resaltados en un color especial? ¡Esos son nuestros números impares! ¡Forman un patrón especial! ¿Puedes ver cómo se alinean en filas y columnas ordenadas?',
                          style: TextStyle(
                            fontSize: 30,
                            color: Color.fromARGB(255, 18, 3, 48),
                          ),
                        ),
                        SizedBox(height: 10),
                        IconButton(
                          icon: Icon(Icons.play_arrow),
                          onPressed: () {
                            speak(
                              isEnglish
                                  ? 'This is a number square. Do you see the numbers that are highlighted in a special color? Those are our odd numbers! They form a special pattern! Can you see the way they line up in neat rows and columns?'
                                  : 'Este es un cuadrado numérico. ¿Ves los números que están resaltados en un color especial? ¡Esos son nuestros números impares! ¡Forman un patrón especial! ¿Puedes ver cómo se alinean en filas y columnas ordenadas?',
                              isEnglish,
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 40),
                Image.asset('assets/odd_table.png', height: 600),
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
                              ? 'Now that you know what odd numbers are let\'s practice finding them in the next section!'
                              : 'Ahora que sabes qué son los números impares, ¡practiquemos encontrándolos en la siguiente sección!',
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
                            speak(
                              isEnglish
                                  ? 'Now that you know what odd numbers are let\'s practice finding them in the next section!'
                                  : 'Ahora que sabes qué son los números impares, ¡practiquemos encontrándolos en la siguiente sección!',
                              isEnglish,
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => WordProblemPractice()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromARGB(255, 18, 3, 48),
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: Text(
                    isEnglish ? 'Start Practice' : 'Comenzar práctica',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
      ],
    );
  }
}
