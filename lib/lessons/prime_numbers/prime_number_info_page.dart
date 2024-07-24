import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import '../../widgets/MultipageContainer.dart';

class PrimeNumberInfoPage extends StatelessWidget {
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
                              ? 'A prime number can be defined as a natural number greater than 1 whose only factors are 1 and the number itself.'
                              : 'Un número primo se puede definir como un número natural mayor que 1 cuyos únicos factores son 1 y el propio número.',
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
                                    'A prime number can be defined as a natural number greater than 1 whose only factors are 1 and the number itself.')
                                : speakTextSpanish(
                                    'Un número primo se puede definir como un número natural mayor que 1 cuyos únicos factores son 1 y el propio número.');
                          },
                        ),
                        SizedBox(height: 50),
                        Text(
                          isEnglish
                              ? 'For example, 7 has only 2 factors, 1 and 7 itself. So, it is a prime number. However, 6 has four factors, 1, 2, 3 and 6. Therefore, it is not a prime number. It is a composite number. We will learn about composite numbers in the next lesson.'
                              : 'Por ejemplo, 7 tiene solo 2 factores, 1 y 7. Por lo tanto, es un número primo. Sin embargo, 6 tiene cuatro factores, 1, 2, 3 y 6. Por lo tanto, no es un número primo. Es un número compuesto. Aprenderemos sobre los números compuestos en la próxima lección.',
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
                                    'For example, 7 has only 2 factors, 1 and 7 itself. So, it is a prime number. However, 6 has four factors, 1, 2, 3 and 6. Therefore, it is not a prime number. It is a composite number. We will learn about composite numbers in the next lesson.')
                                : speakTextSpanish(
                                    'Por ejemplo, 7 tiene solo 2 factores, 1 y 7. Por lo tanto, es un número primo. Sin embargo, 6 tiene cuatro factores, 1, 2, 3 y 6. Por lo tanto, no es un número primo. Es un número compuesto. Aprenderemos sobre los números compuestos en la próxima lección.');
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
                    child: Image.asset('assets/prime1.png'),
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
                              ? 'A prime number is always bigger than 1. The number 1 is not a prime number.\nThe number 2 is the only even prime number. All other even numbers can be divided by 2, so they are not prime.\nThe smallest prime number is 2.\nPrime numbers can’t be split evenly: If you try to split a prime number into equal groups, there will always be one left over, except when you split it into 1 group or groups of itself.'
                              : 'Un número primo siempre es mayor que 1. El número 1 no es un número primo. El número 2 es el único número primo par. \nTodos los demás números pares se pueden dividir entre 2, por lo que no son primos.\nEl número primo más pequeño es 2. \nLos números primos no se pueden dividir en partes iguales: si intentas dividir un número primo en grupos iguales, siempre quedará uno, excepto cuando lo divides en 1 grupo o en grupos de sí mismo.',
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
                                    'A prime number is always bigger than 1. The number 1 is not a prime number. The number 2 is the only even prime number. All other even numbers can be divided by 2, so they are not prime. The smallest prime number is 2. Prime numbers can’t be split evenly: If you try to split a prime number into equal groups, there will always be one left over, except when you split it into 1 group or groups of itself.')
                                : speakTextSpanish(
                                    'Un número primo siempre es mayor que 1. El número 1 no es un número primo. El número 2 es el único número primo par. Todos los demás números pares se pueden dividir entre 2, por lo que no son primos. El número primo más pequeño es 2. Los números primos no se pueden dividir en partes iguales: si intentas dividir un número primo en grupos iguales, siempre quedará uno, excepto cuando lo divides en 1 grupo o en grupos de sí mismo.');
                          },
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Image.asset('assets/prime2.png', height: 400),
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
                              ? 'The chart below shows the prime numbers up to 100, represented in coloured boxes.'
                              : 'El cuadro de abajo muestra los números primos hasta 100, representados en cuadros de colores.',
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
                                    'The chart below shows the prime numbers up to 100, represented in coloured boxes.')
                                : speakTextSpanish(
                                    'El cuadro de abajo muestra los números primos hasta 100, representados en cuadros de colores.');
                          },
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 40),
                Image.asset('assets/prime3.png', height: 600),
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
                              ? 'Now that you know what prime numbers are let\'s go ahead and solve some fun problems.'
                              : 'Ahora que sabes qué son los números primos, vamos a resolver algunos problemas divertidos.',
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
                                    'Now that you know what prime numbers are let\'s go ahead and solve some fun problems.')
                                : speakTextSpanish(
                                    'Ahora que sabes qué son los números primos, vamos a resolver algunos problemas divertidos.');
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
                    //   // context,
                    //   // MaterialPageRoute(
                    //   //     builder: (context) => ()),
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
