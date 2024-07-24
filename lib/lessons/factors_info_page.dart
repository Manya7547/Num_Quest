import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import '../../widgets/MultipageContainer.dart';

class FactorsInfoPage extends StatelessWidget {
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
                              ? 'A factor is a number that divides into another number exactly, i.e. with no remainder. A factor in maths is one of two or more numbers that divides into a number without a remainder. For example, 10 is a factor of 30 since 30 divided by 10 is 3. However, 10 is not a factor of 27 because 27 divided by 10 is 2 with a remainder of 7.'
                              : 'Un factor es un número que se divide en otro número exactamente, es decir, sin dejar residuo. Un factor en matemáticas es uno de dos o más números que se dividen en un número sin dejar residuo. Por ejemplo, 10 es un factor de 30 ya que 30 dividido por 10 es 3. Sin embargo, 10 no es un factor de 27 porque 27 dividido por 10 es 2 con un residuo de 7.',
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
                                    'A factor is a number that divides into another number exactly, i.e. with no remainder. A factor in maths is one of two or more numbers that divides into a number without a remainder. For example, 10 is a factor of 30 since 30 divided by 10 is 3. However, 10 is not a factor of 27 because 27 divided by 10 is 2 with a remainder of 7.')
                                : speakTextSpanish(
                                    'Un factor es un número que se divide en otro número exactamente, es decir, sin dejar residuo. Un factor en matemáticas es uno de dos o más números que se dividen en un número sin dejar residuo. Por ejemplo, 10 es un factor de 30 ya que 30 dividido por 10 es 3. Sin embargo, 10 no es un factor de 27 porque 27 dividido por 10 es 2 con un residuo de 7.');
                          },
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 350,
                  child: Padding(
                    padding: EdgeInsets.only(top: 10),
                    child: Image.asset('assets/factors1.png'),
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
