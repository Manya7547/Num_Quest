import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:num_quest/widgets/MultipageContainer.dart';

class FibonacciNumberInfoPage extends StatelessWidget {
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
                              ? 'The Fibonacci sequence is a famous series of numbers with a pattern. The pattern is that every number is added to the one before it. Here’s the first few parts of the sequence: 0, 1, 1, 2, 3, 5, 8, 13, 21, 34, 55, 89.'
                              : 'La secuencia de Fibonacci es una serie famosa de números con un patrón. El patrón es que cada número se suma al anterior. Aquí están las primeras partes de la secuencia: 0, 1, 1, 2, 3, 5, 8, 13, 21, 34, 55, 89',
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
                                    'The Fibonacci sequence is a famous series of numbers with a pattern. The pattern is that every number is added to the one before it. Here’s the first few parts of the sequence: 0, 1, 1, 2, 3, 5, 8, 13, 21, 34, 55, 89.')
                                : speakTextSpanish(
                                    'La secuencia de Fibonacci es una serie famosa de números con un patrón. El patrón es que cada número se suma al anterior. Aquí están las primeras partes de la secuencia: 0, 1, 1, 2, 3, 5, 8, 13, 21, 34, 55, 89');
                          },
                        ),
                        SizedBox(height: 50),
                        Text(
                          isEnglish
                              ? 'As you can see, 1 + 1 = 2, 2 + 1 = 3, 3 + 2 = 5 and so on. It’s a really simple progression and can go on forever. What’s impressive about this sequence is that you get a spiral if you turn those numbers into boxes.'
                              : 'Como puedes ver, 1 + 1 = 2, 2 + 1 = 3, 3 + 2 = 5, y así sucesivamente. Es una progresión muy simple y puede continuar para siempre. Lo impresionante de esta secuencia es que obtienes una espiral si conviertes esos números en cuadrados.',
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
                                    'As you can see, 1 + 1 = 2, 2 + 1 = 3, 3 + 2 = 5 and so on. It’s a really simple progression and can go on forever. What’s impressive about this sequence is that you get a spiral if you turn those numbers into boxes.')
                                : speakTextSpanish(
                                    'Como puedes ver, 1 + 1 = 2, 2 + 1 = 3, 3 + 2 = 5, y así sucesivamente. Es una progresión muy simple y puede continuar para siempre. Lo impresionante de esta secuencia es que obtienes una espiral si conviertes esos números en cuadrados.');
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
                    child: Image.asset('assets/fibonacci1.png'),
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
                              ? 'You can see the Fibonacci sequence in a lot of things in real life. Surprisingly, it’s found a lot in nature. Here’s a list of where you can find the Fibonacci sequence in real life, think about the spiral from earlier and where you might find it.'
                              : 'Puedes ver la secuencia de Fibonacci en muchas cosas en la vida real. Sorprendentemente, se encuentra mucho en la naturaleza. Aquí hay una lista de dónde puedes encontrar la secuencia de Fibonacci en la vida real, piensa en la espiral de antes y dónde podrías encontrarla.',
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
                                    'You can see the Fibonacci sequence in a lot of things in real life. Surprisingly, it’s found a lot in nature. Here’s a list of where you can find the Fibonacci sequence in real life, think about the spiral from earlier and where you might find it.')
                                : speakTextSpanish(
                                    'Puedes ver la secuencia de Fibonacci en muchas cosas en la vida real. Sorprendentemente, se encuentra mucho en la naturaleza. Aquí hay una lista de dónde puedes encontrar la secuencia de Fibonacci en la vida real, piensa en la espiral de antes y dónde podrías encontrarla.');
                          },
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Image.asset('assets/fibonacci2.png', height: 400),
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
                              ? 'Here’s the Fibonacci sequence.'
                              : 'Aquí está la secuencia de Fibonacci.',
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
                                ? speakText('Here’s the Fibonacci sequence.')
                                : speakTextSpanish(
                                    'Aquí está la secuencia de Fibonacci.');
                          },
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 40),
                Image.asset('assets/fibonacci3.png', height: 600),
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
                              ? 'Now that you know what fibonacci numbers are let\'s go ahead and solve some fun problems.'
                              : 'Ahora que sabes qué son los números fibonacci, vamos a resolver algunos problemas divertidos',
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
                                    'Now that you know what fibonacci numbers are let\'s go ahead and solve some fun problems.')
                                : speakTextSpanish(
                                    'Ahora que sabes qué son los números fibonacci, vamos a resolver algunos problemas divertidos.');
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
