import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import '../../widgets/MultipageContainer.dart';
import 'package:num_quest/games/choose_factors_game.dart';
import 'package:num_quest/FlashCards/FactorsNumberInfoPage.dart';

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
                              ? 'A factor is a number that divides into another number exactly, i.e. with no remainder. A factor in maths is one of two or more numbers that divides into a number without a remainder. For example, 10 (ten) is a factor of 30 (thirty) since 30 divided by 10 is 3(three). However, 10 is not a factor of 27 (twenty seven) because 27 divided by 10 is 2 with a remainder of 7 (seven).'
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
                              ? 'Types of Factors:\nPrime Factors - Most numbers (except square numbers) have an even number of factors. However, a prime number has only two factors – the prime number itself and the number 1 (one). This means it only has one factor pair.\nCommon Factors - When working out the factors of two numbers, there will often be some factors which appear in both lists. We call these common factors. Factors of 18 (eighteen) are 1 (one), 2 (two), 3 (three), 6 (six), 9 (nine) and 18 (eighteen). Factors of 24 (twenty-four) are 1 (one), 2 (two), 3 (three), 4 (four), 6 (six), 8 (eight), 12 (twelve) and 24 (twenty-four). The common factors of 18 (eighteen) and 24 (twenty-four) are 1 (one), 2 (two), 3 (three) and 6 (six).\nThe highest common factor is the common factor with the greatest value. Amongst the common factors of 18 (eighteen) and 24 (twenty-four), the highest number is 6 (six) so 6 (six) is the highest common factor of these two numbers.'
                              : 'Tipos de Factores: \nFactores Primos - La mayoría de los números (excepto los números cuadrados) tienen un número par de factores. Sin embargo, un número primo solo tiene dos factores: el propio número primo y el número 1. Esto significa que solo tiene un par de factores.\nUn factor primo es simplemente un factor que también es un número primo. Es un número mayor que 1 que no puede ser dividido exactamente por ningún número excepto por sí mismo o por 1.\nFactores Comunes Al calcular los factores de dos números, a menudo habrá algunos factores que aparezcan en ambas listas. A estos los llamamos \'factores comunes\'. Los factores de 18 son 1, 2, 3, 6, 9 y 18. Los factores de 24 son 1, 2, 3, 4, 6, 8, 12 y 24. Los factores comunes de 18 y 24 son 1, 2, 3 y 6. \nEl factor común más alto es el factor común con el mayor valor. Entre los factores comunes de 18 y 24, el número más alto es 6, por lo que 6 es el factor común más alto de estos dos números. ',
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
                                    'Types of Factors:\nPrime Factors - Most numbers (except square numbers) have an even number of factors. However, a prime number has only two factors – the prime number itself and the number 1. This means it only has one factor pair.\nCommon Factors - When working out the factors of two numbers, there will often be some factors which appear in both lists. We call these \'common factors\'. Factors of 18 are 1, 2, 3, 6, 9 and 18. Factors of 24 are 1, 2, 3, 4, 6, 8, 12 and 24. The common factors of 18 and 24 are 1, 2, 3 and 6.\nThe highest common factor is the common factor with the greatest value. Amongst the common factors of 18 and 24, the highest number is 6 so 6 is the highest common factor of these two numbers.')
                                : speakTextSpanish(
                                    'Tipos de Factores: \nFactores Primos - La mayoría de los números (excepto los números cuadrados) tienen un número par de factores. Sin embargo, un número primo solo tiene dos factores: el propio número primo y el número 1. Esto significa que solo tiene un par de factores.\nUn factor primo es simplemente un factor que también es un número primo. Es un número mayor que 1 que no puede ser dividido exactamente por ningún número excepto por sí mismo o por 1.\nFactores Comunes Al calcular los factores de dos números, a menudo habrá algunos factores que aparezcan en ambas listas. A estos los llamamos \'factores comunes\'. Los factores de 18 son 1, 2, 3, 6, 9 y 18. Los factores de 24 son 1, 2, 3, 4, 6, 8, 12 y 24. Los factores comunes de 18 y 24 son 1, 2, 3 y 6. \nEl factor común más alto es el factor común con el mayor valor. Entre los factores comunes de 18 y 24, el número más alto es 6, por lo que 6 es el factor común más alto de estos dos números.');
                          },
                        ),
                      ],
                    ),
                  ),
                ),
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
                              ? 'Here\'s an example that shows how to find factors using multiplication'
                              : 'Aquí hay un ejemplo que muestra cómo encontrar factores usando la multiplicación.',
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
                                    'Here\'s an example that shows how to find factors using multiplication')
                                : speakTextSpanish(
                                    'Aquí hay un ejemplo que muestra cómo encontrar factores usando la multiplicación.');
                          },
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Image.asset('assets/factors3.png', height: 600),
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
                     Navigator.push(
                     context,
                       MaterialPageRoute(
                         builder: (context) => FactorsPracticePage()),
                     );
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
