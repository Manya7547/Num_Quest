import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart'; // Import the FlipCard package
import '../../widgets/MultipageContainer.dart';

class TriangularNumberInfoPage extends StatelessWidget {
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
                              ? 'The triangular number sequence is the representation of the numbers in the form of equilateral triangle arranged in a series or sequence. These numbers are in a sequence of 1, 3, 6, 10, 15, 21, 28, 36, 45, and so on.'
                              : 'La secuencia de números triangulares es la representación de los números en forma de triángulo equilátero dispuestos en una serie o secuencia. Estos números están en una secuencia de 1, 3, 6, 10, 15, 21, 28, 36, 45, y así sucesivamente.',
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
                                  ? 'The triangular number sequence is the representation of the numbers in the form of equilateral triangle arranged in a series or sequence. These numbers are in a sequence of 1, 3, 6, 10, 15, 21, 28, 36, 45, and so on.'
                                  : 'La secuencia de números triangulares es la representación de los números en forma de triángulo equilátero dispuestos en una serie o secuencia. Estos números están en una secuencia de 1, 3, 6, 10, 15, 21, 28, 36, 45, y así sucesivamente.',
                              isEnglish,
                            );
                          },
                        ),
                        SizedBox(height: 50),
                        Text(
                          isEnglish
                              ? 'List Of Triangular Numbers: 0, 1, 3, 6, 10, 15, 21, 28, 36, 45, 55, 66, 78, 91, 105, 120,136, 153, 171, 190, 210, 231, 253, 276, 300, 325, 351, 378, 406, 435, 465, 496, 528, 561, 595, 630, 666, 703, 741, 780, 820, 861, 903, 946, 990, 1035, 1081, 1128, 1176, 1225, 1275, 1326, 1378, 1431, and so on.'
                              : 'Lista de Números Triangulares: 0, 1, 3, 6, 10, 15, 21, 28, 36, 45, 55, 66, 78, 91, 105, 120, 136, 153, 171, 190, 210, 231, 253, 276, 300, 325, 351, 378, 406, 435, 465, 496, 528, 561, 595, 630, 666, 703, 741, 780, 820, 861, 903, 946, 990, 1035, 1081, 1128, 1176, 1225, 1275, 1326, 1378, 1431, y así sucesivamente.',
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
                                  ? 'List Of Triangular Numbers: 0, 1, 3, 6, 10, 15, 21, 28, 36, 45, 55, 66, 78, 91, 105, 120,136, 153, 171, 190, 210, 231, 253, 276, 300, 325, 351, 378, 406, 435, 465, 496, 528, 561, 595, 630, 666, 703, 741, 780, 820, 861, 903, 946, 990, 1035, 1081, 1128, 1176, 1225, 1275, 1326, 1378, 1431, and so on.'
                                  : 'Lista de Números Triangulares: 0, 1, 3, 6, 10, 15, 21, 28, 36, 45, 55, 66, 78, 91, 105, 120, 136, 153, 171, 190, 210, 231, 253, 276, 300, 325, 351, 378, 406, 435, 465, 496, 528, 561, 595, 630, 666, 703, 741, 780, 820, 861, 903, 946, 990, 1035, 1081, 1128, 1176, 1225, 1275, 1326, 1378, 1431, y así sucesivamente.',
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
                    child: Image.asset('assets/triangular1.png'),
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
                              ? 'In the pattern of triangular numbers you will see, the next number in the sequence is added with an extra row. Let us explain in detail. First number is 1. In number 2,  a row is added with two dots to the first number. In number 3, a row is added with three dots to the second numberAgain, in number 4, a row is added with four dots to the third number and so on. So the sequence formed here is in the pattern: 1, 1 + 2, 1 + 2 + 3, 1 + 2 + 3 + 4,  and so on.'
                              : 'En el patrón de los números triangulares, verás que el siguiente número en la secuencia se forma añadiendo una fila extra. Vamos a explicar esto en detalle. El primer número es 1. En el número 2, se añade una fila con dos puntos al primer número. En el número 3, se añade una fila con tres puntos al segundo número. De nuevo, en el número 4, se añade una fila con cuatro puntos al tercer número, y así sucesivamente. Así que la secuencia que se forma sigue el patrón: 1, 1 + 2, 1 + 2 + 3, 1 + 2 + 3 + 4, y así sucesivamente.',
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
                                  ? 'In the pattern of triangular numbers you will see, the next number in the sequence is added with an extra row. Let us explain in detail. First number is 1. In number 2,  a row is added with two dots to the first number. In number 3, a row is added with three dots to the second numberAgain, in number 4, a row is added with four dots to the third number and so on. So the sequence formed here is in the pattern: 1, 1 + 2, 1 + 2 + 3, 1 + 2 + 3 + 4,  and so on.'
                                  : 'En el patrón de los números triangulares, verás que el siguiente número en la secuencia se forma añadiendo una fila extra. Vamos a explicar esto en detalle. El primer número es 1. En el número 2, se añade una fila con dos puntos al primer número. En el número 3, se añade una fila con tres puntos al segundo número. De nuevo, en el número 4, se añade una fila con cuatro puntos al tercer número, y así sucesivamente. Así que la secuencia que se forma sigue el patrón: 1, 1 + 2, 1 + 2 + 3, 1 + 2 + 3 + 4, y así sucesivamente.',
                              isEnglish,
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 100),
                Image.asset('assets/triangular2.jpg', height: 400),
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
                              ? 'Now that you know what triangular numbers are let\'s go ahead and solve some fun problems.'
                              : 'Ahora que sabes qué son los Números Triangulares, vamos a resolver algunos problemas divertidos.',
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
                                  ? 'Now that you know what triangular numbers are let\'s go ahead and solve some fun problems.'
                                  : 'Ahora que sabes qué son los Números Triangulares, vamos a resolver algunos problemas divertidos.',
                              isEnglish,
                            );
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

void main() {
  runApp(MaterialApp(
    home: TriangularNumberInfoPage(),
  ));
}
