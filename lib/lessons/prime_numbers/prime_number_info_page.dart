import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import '../../widgets/MultipageContainer.dart';
//import './practice_even.dart';

class PrimeNumberInfoPage extends StatelessWidget {
  final AudioPlayer audioPlayer = AudioPlayer();

  void playAudio(String url) async {
    int result = await audioPlayer.play(url);
    if (result == 1) {
      // success
    }
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
                              ? 'A prime number can be defined as a natural number greater than 1 whose only factors are 1 and the number itself. '
                              : '',
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
                            playAudio(isEnglish ? '' : '');
                          },
                        ),
                        SizedBox(height: 50),
                        Text(
                          isEnglish
                              ? 'For example, 7 has only 2 factors, 1 and 7 itself. So, it is a prime number. However, 6 has four factors, 1, 2, 3 and 6. Therefore, it is not a prime number. It is a composite number. We will learn about composite numbers in the next lesson.'
                              : '',
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
                            playAudio(isEnglish
                                ? 'https://drive.google.com/uc?export=download&id=1hrbOYtGLKH5vJ5rcxRIj0oXFrp_CYE-0'
                                : 'https://drive.google.com/uc?export=download&id=1IeupKYCYia4JB47rs4discodUcDfU0yb');
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
                    child: Image.asset('assets/candies.png'),
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
                          isEnglish ? '' : '',
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
                            playAudio(isEnglish
                                ? 'https://drive.google.com/uc?export=download&id=1HoNkco_Ct4uqv1uWuY0Uxm36L4Ulhc5o'
                                : 'https://drive.google.com/uc?export=download&id=1fufJFTw1GhARSj9sJUJqgTjeXFPRUfYp');
                          },
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 100),
                Image.asset('assets/candies2.png', height: 400),
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
                              ? 'This is a number square. Do you see the numbers that are highlighted in a special color? Those are our even numbers! They form a special pattern! Can you see the way they line up in neat rows and columns?'
                              : 'Este es un cuadrado numérico. ¿Ves los números que están resaltados en un color especial? ¡Esos son nuestros números pares! ¡Forman un patrón especial! ¿Puedes ver cómo se alinean en filas y columnas ordenadas?',
                          style: TextStyle(
                            fontSize: 30,
                            color: Color.fromARGB(255, 18, 3, 48),
                          ),
                        ),
                        SizedBox(height: 10),
                        IconButton(
                          icon: Icon(Icons.play_arrow),
                          onPressed: () {
                            playAudio(isEnglish
                                ? 'https://drive.google.com/uc?export=download&id=1OCGKlY2mXpprP-ZUKi5kcwfD_ptQeA7r'
                                : 'https://drive.google.com/uc?export=download&id=1AO_a5We4vckT8_GGG69NJW4Kkhc2ZH61');
                          },
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 40),
                Image.asset('assets/number_square.png', height: 600),
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
                              ? 'Now that you know what even numbers are let\'s go ahead and solve some fun problems.'
                              : 'Ahora que sabes qué son los números pares, vamos a resolver algunos problemas divertidos.',
                          style: TextStyle(
                            fontSize: 30,
                            color: Color.fromARGB(255, 18, 3, 48),
                          ),
                        ),
                        SizedBox(height: 10),
                        IconButton(
                          icon: Icon(Icons.play_arrow),
                          onPressed: () {
                            playAudio(isEnglish
                                ? 'https://example.com/english5.mp3'
                                : 'https://example.com/spanish5.mp3');
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

// void main() {
//   runApp(MaterialApp(
//     home: EvenNumberInfoPage(),
//   ));
// }
