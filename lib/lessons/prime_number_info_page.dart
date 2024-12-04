import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_tts/flutter_tts.dart';
import '../widgets/MultipageContainer.dart';

class PrimeNumberInfoPage extends StatefulWidget {
  @override
  _PrimeNumberInfoPageState createState() => _PrimeNumberInfoPageState();
}

class _PrimeNumberInfoPageState extends State<PrimeNumberInfoPage> {
  final FlutterTts flutterTts = FlutterTts();
  List<Map<String, dynamic>>? pages;

  @override
  void initState() {
    super.initState();
    _loadContent();
  }

  Future<void> _loadContent() async {
    final String jsonString =
        await rootBundle.loadString('assets/prime_lessons.json');
    final Map<String, dynamic> jsonData = json.decode(jsonString);
    setState(() {
      pages = List<Map<String, dynamic>>.from(jsonData['pages']);
    });
  }

  void speakText(String text, String language) async {
    await flutterTts.setLanguage(language);
    await flutterTts.setPitch(1.0);
    await flutterTts.speak(text);
  }

  @override
  Widget build(BuildContext context) {
    if (pages == null) {
      return Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }

    return MultipageContainer(
      pages: pages!.map((page) {
        return (bool isEnglish) => Column(
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
                          isEnglish ? page['text_en'] : page['text_es'],
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
                            speakText(
                              isEnglish ? page['text_en'] : page['text_es'],
                              isEnglish ? "en-US" : "es-ES",
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 40),
                Image.asset(page['image'], height: 400),
              ],
            );
      }).toList(),
    );
  }
}
