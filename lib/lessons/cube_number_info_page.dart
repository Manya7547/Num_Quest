import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import '../../widgets/MultipageContainer.dart';

class CubeNumberInfoPage extends StatelessWidget {
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
                              ? 'A cube number (or a perfect cube) is a number that is the result of multiplying an integer by itself twice. In other words, it is the product of an integer raised to the power of three.'
                              : 'Un número cúbico (o un cubo perfecto) es un número que resulta de multiplicar un número entero por sí mismo dos veces. En otras palabras, es el producto de un número entero elevado a la potencia de tres.',
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
                                    'A cube number (or a perfect cube) is a number that is the result of multiplying an integer by itself twice. In other words, it is the product of an integer raised to the power of three.')
                                : speakTextSpanish(
                                    'Un número cúbico (o un cubo perfecto) es un número que resulta de multiplicar un número entero por sí mismo dos veces. En otras palabras, es el producto de un número entero elevado a la potencia de tres.');
                          },
                        ),
                        SizedBox(height: 50),
                        Text(
                          isEnglish
                              ? 'For example, the number 27 (twenty seven) is a cube number because it can be written as 3 × 3 × 3. ). Here, 3 is the integer that has been multiplied by itself twice to produce 27.'
                              : 'Por ejemplo, el número 27 es un número cúbico porque se puede escribir como 3 × 3 × 3. Aquí, 3 es el número entero que se ha multiplicado por sí mismo dos veces para producir 27.',
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
                                    'For example, the number 27 is a cube number because it can be written as 3 × 3 × 3. ). Here, 3 is the integer that has been multiplied by itself twice to produce 27.')
                                : speakTextSpanish(
                                    'Por ejemplo, el número 27 es un número cúbico porque se puede escribir como 3 × 3 × 3. Aquí, 3 es el número entero que se ha multiplicado por sí mismo dos veces para producir 27.');
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
                    child: Image.asset('assets/cube1.png'),
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
                              ? 'To cube a number all you do is multiply it and by itself and then itself again. This works for all numbers. So for example 11 (eleven) cubed is 11³ or 11 x 11 x 11 which is 1331. Another example could be 256³ (two hundred fifty six cube) or 256 x 256 x 256 which is 16,777,216 As you can see when you cube a whole number, you’ll find the numbers get very big very quickly!'
                              : 'Para elevar un número al cubo, todo lo que tienes que hacer es multiplicarlo por sí mismo y luego por sí mismo otra vez. Esto funciona para todos los números. Por ejemplo, 11 al cubo es 11³ o 11 x 11 x 11, lo cual es 1331. Otro ejemplo podría ser 256³ o 256 x 256 x 256, lo cual es 16,777,216. ¡Como puedes ver, cuando elevas un número entero al cubo, los números se vuelven muy grandes muy rápido!',
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
                                    'To cube a number all you do is multiply it and by itself and then itself again. This works for all numbers. So for example 11 cubed is 11³ or 11 x 11 x 11 which is 1331. Another example could be 256³ or 256 x 256 x 256 which is 16,777,216 As you can see when you cube a whole number, you’ll find the numbers get very big very quickly!')
                                : speakTextSpanish(
                                    'Para elevar un número al cubo, todo lo que tienes que hacer es multiplicarlo por sí mismo y luego por sí mismo otra vez. Esto funciona para todos los números. Por ejemplo, 11 al cubo es 11³ o 11 x 11 x 11, lo cual es 1331. Otro ejemplo podría ser 256³ o 256 x 256 x 256, lo cual es 16,777,216. ¡Como puedes ver, cuando elevas un número entero al cubo, los números se vuelven muy grandes muy rápido!');
                          },
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Image.asset('assets/cube2.png', height: 400),
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
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          isEnglish
                              ? 'Now that you know what cube numbers are let\'s go ahead and solve some fun problems.'
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
                                    'Now that you know what cube numbers are let\'s go ahead and solve some fun problems.')
                                : speakTextSpanish(
                                    'Ahora que sabes qué son los números cúbico, vamos a resolver algunos problemas divertidos.');
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
