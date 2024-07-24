import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:num_quest/widgets/MultipageContainer.dart';

class CompositeNumberInfoPage extends StatelessWidget {
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
                              ? 'Composite numbers have more than 2 factors. 16 is an example of a composite number. The factors of 16 are 1, 2, 4, 8 and 16. All of these numbers divide into 16 evenly. Let\'s use pictures to visualize composite numbers.'
                              : 'Los números compuestos tienen más de 2 factores. 16 es un ejemplo de un número compuesto. Los factores de 16 son 1, 2, 4, 8 y 16. Todos estos números se dividen en 16 de manera uniforme. Usemos imágenes para visualizar los números compuestos.',
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
                                    'Composite numbers have more than 2 factors. 16 is an example of a composite number. The factors of 16 are 1, 2, 4, 8 and 16. All of these numbers divide into 16 evenly. Let\'s use pictures to visualize composite numbers.')
                                : speakTextSpanish(
                                    'Los números compuestos tienen más de 2 factores. 16 es un ejemplo de un número compuesto. Los factores de 16 son 1, 2, 4, 8 y 16. Todos estos números se dividen en 16 de manera uniforme. Usemos imágenes para visualizar los números compuestos.');
                          },
                        ),
                        SizedBox(height: 50),
                        Text(
                          isEnglish
                              ? 'A farmer is inventing a new egg carton where he will store the eggs his hens lay. He wants each carton to hold  16 eggs.He could have 1 row of 16 eggs. He could also have 2 rows with 8 eggs in each row.'
                              : 'Un granjero está inventando un nuevo cartón de huevos donde almacenará los huevos que ponen sus gallinas. Quiere que cada cartón contenga 16 huevos. Podría tener 1 fila de 16 huevos. También podría tener 2 filas con 8 huevos en cada fila.',
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
                                    'A farmer is inventing a new egg carton where he will store the eggs his hens lay. He wants each carton to hold  16 eggs.He could have 1 row of 16 eggs. He could also have 2 rows with 8 eggs in each row.')
                                : speakTextSpanish(
                                    'Un granjero está inventando un nuevo cartón de huevos donde almacenará los huevos que ponen sus gallinas. Quiere que cada cartón contenga 16 huevos. Podría tener 1 fila de 16 huevos. También podría tener 2 filas con 8 huevos en cada fila.');
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
                    child: Image.asset('assets/composite1.png'),
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
                              ? '4 rows with 4 eggs in each row. An array of 16 eggs arranged in 4 rows of 4 eggs each. Composite numbers have more than one way that they can be divided into equal groups.'
                              : '4 filas con 4 huevos en cada fila. Una matriz de 16 huevos dispuestos en 4 filas de 4 huevos cada una. Los números compuestos tienen más de una forma en que pueden dividirse en grupos iguales.',
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
                                    '4 rows with 4 eggs in each row. An array of 16 eggs arranged in 4 rows of 4 eggs each. Composite numbers have more than one way that they can be divided into equal groups.')
                                : speakTextSpanish(
                                    '4 filas con 4 huevos en cada fila. Una matriz de 16 huevos dispuestos en 4 filas de 4 huevos cada una. Los números compuestos tienen más de una forma en que pueden dividirse en grupos iguales.');
                          },
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Image.asset('assets/composite2.png', height: 400),
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
                              ? 'The chart below shows the composite numbers up to 100, represented in coloured boxes.'
                              : 'El cuadro de abajo muestra los números compuestos hasta 100, representados en cuadros de colores.',
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
                                    'The chart below shows the composite numbers up to 100, represented in coloured boxes.')
                                : speakTextSpanish(
                                    'El cuadro de abajo muestra los números compuestos hasta 100, representados en cuadros de colores.');
                          },
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 40),
                Image.asset('assets/composite3.png', height: 600),
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
                              ? 'Now that you know what composite numbers are let\'s go ahead and solve some fun problems.'
                              : 'Ahora que sabes qué son los números compuestos, vamos a resolver algunos problemas divertidos.',
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
                                    'Ahora que sabes qué son los números compuestos, vamos a resolver algunos problemas divertidos.');
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
