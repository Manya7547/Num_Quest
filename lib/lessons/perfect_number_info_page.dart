import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:num_quest/widgets/MultipageContainer.dart';
import 'package:num_quest/FlashCards/PerfectNumbersPracticePage.dart';

class PerfectNumberInfoPage extends StatelessWidget {
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
                              ? 'A perfect number is a positive integer equal to the total of its positive divisors, except the number itself in number theory. For example, 6 is a perfect number since 1 + 2 + 3 equals 6.'
                              : 'Un número perfecto es un número entero positivo que es igual a la suma de sus divisores positivos, excepto el propio número, en la teoría de números. Por ejemplo, 6 es un número perfecto ya que 1 + 2 + 3 es igual a 6.',
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
                                    'A perfect number is a positive integer equal to the total of its positive divisors, except the number itself in number theory. For example, 6 is a perfect number since 1 + 2 + 3 equals 6.')
                                : speakTextSpanish(
                                    'Un número perfecto es un número entero positivo que es igual a la suma de sus divisores positivos, excepto el propio número, en la teoría de números. Por ejemplo, 6 es un número perfecto ya que 1 + 2 + 3 es igual a 6.');
                          },
                        ),
                        SizedBox(height: 50),
                        Text(
                          isEnglish
                              ? 'Some of the first perfect numbers are 6, 28, 496, and 8128. Perfect numbers are also known as “Complete Numbers” and “Proper Numbers“.'
                              : 'Algunos de los primeros números perfectos son 6, 28, 496 y 8128. Los números perfectos también se conocen como "Números Completos" y "Números Propios".',
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
                                    'Some of the first perfect numbers are 6, 28, 496, and 8128. Perfect numbers are also known as “Complete Numbers” and “Proper Numbers“.')
                                : speakTextSpanish(
                                    'Algunos de los primeros números perfectos son 6, 28, 496 y 8128. Los números perfectos también se conocen como "Números Completos" y "Números Propios".');
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
                    child: Image.asset('assets/perfect1.png'),
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
                              ? 'The smallest perfect number example is the number six. However, there are also several other small perfect numbers whose divisors can be figured out and summed together manually. Below is a short, perfect number list that includes a few smaller perfect numbers. Please keep in mind that this list is not exhaustive.'
                              : 'El ejemplo más pequeño de número perfecto es el número seis. Sin embargo, también hay varios otros números perfectos pequeños cuyos divisores pueden ser calculados y sumados manualmente. A continuación, se presenta una lista corta de números perfectos que incluye algunos de los números perfectos más pequeños. Por favor, tenga en cuenta que esta lista no es exhaustiva.',
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
                                    'The smallest perfect number example is the number six. However, there are also several other small perfect numbers whose divisors can be figured out and summed together manually. Below is a short, perfect number list that includes a few smaller perfect numbers. Please keep in mind that this list is not exhaustive.')
                                : speakTextSpanish(
                                    'El ejemplo más pequeño de número perfecto es el número seis. Sin embargo, también hay varios otros números perfectos pequeños cuyos divisores pueden ser calculados y sumados manualmente. A continuación, se presenta una lista corta de números perfectos que incluye algunos de los números perfectos más pequeños. Por favor, tenga en cuenta que esta lista no es exhaustiva.');
                          },
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Image.asset('assets/perfect2.png', height: 400),
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
                              ? 'Now that you know what perfect numbers are let\'s go ahead and solve some fun problems.'
                              : 'Ahora que sabes qué son los números perfecto, vamos a resolver algunos problemas divertidos.',
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
                                    'Now that you know what perfect numbers are let\'s go ahead and solve some fun problems.')
                                : speakTextSpanish(
                                    'Ahora que sabes qué son los números perfecto, vamos a resolver algunos problemas divertidos.');
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
                           builder: (context) => PerfectNumberPracticePage()),
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
