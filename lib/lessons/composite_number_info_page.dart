import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:num_quest/widgets/MultipageContainer.dart';
import 'package:num_quest/translation_service.dart';

class CompositeNumberInfoPage extends StatefulWidget {
  @override
  _CompositeNumberInfoPageState createState() =>
      _CompositeNumberInfoPageState();
}

class _CompositeNumberInfoPageState extends State<CompositeNumberInfoPage> {
  final FlutterTts flutterTts = FlutterTts();
  final TranslationService translationService = TranslationService();

  bool isEnglish = true; // Tracks the current language
  Map<String, String> translatedTexts = {}; // Cache for translated texts

  @override
  void initState() {
    super.initState();
    translationService.loadModel(); // Load the translation model
  }

  Future<String> translateText(String text) async {
    if (isEnglish) {
      return text; // No translation needed for English
    }
    if (translatedTexts.containsKey(text)) {
      return translatedTexts[text]!; // Return cached translation
    }
    final translated = await translationService.translateText(text);
    setState(() {
      translatedTexts[text] = translated; // Cache the translation
    });
    return translated;
  }

  void speakText(String text) async {
    await flutterTts.setLanguage(isEnglish ? "en-US" : "es-ES");
    await flutterTts.setPitch(1.0);
    await flutterTts.speak(text);
  }

  @override
  Widget build(BuildContext context) {
    return MultipageContainer(
      pages: [
        // First Page Content
        (_) => FutureBuilder(
              future: translateText(
                  'Composite numbers have more than 2 factors. 16 (sixteen) is an example of a composite number. The factors of 16 are 1(one), 2(two), 4(four), 8(eight) and 16(sixteen). All of these numbers divide into 16(sixteen) evenly. Let\'s use pictures to visualize composite numbers.'),
              builder: (context, snapshot) {
                final text = snapshot.data ?? 'Translating...';
                return buildPageContent(
                  text,
                  'assets/composite1.png',
                  'A farmer is inventing a new egg carton where he will store the eggs his hens lay. He wants each carton to hold 16 (sixteen) eggs.He could have 1 (one) row of 16 (sixteen) eggs. He could also have 2 (two) rows with 8 (eight) eggs in each row.',
                  'assets/composite1.png',
                );
              },
            ),
        // Second Page Content
        (_) => FutureBuilder(
              future: translateText(
                  '4 (four) rows with 4 (four) eggs in each row. An array of 16 (sixteen) eggs arranged in 4 (four) rows of 4 (four) eggs each. Composite numbers have more than one way that they can be divided into equal groups.'),
              builder: (context, snapshot) {
                final text = snapshot.data ?? 'Translating...';
                return buildPageContent(
                  text,
                  'assets/composite2.png',
                  '',
                  '',
                );
              },
            ),
        // Third Page Content
        (_) => FutureBuilder(
              future: translateText(
                  'The chart below shows the composite numbers up to 100 (one hundred), represented in coloured boxes.'),
              builder: (context, snapshot) {
                final text = snapshot.data ?? 'Translating...';
                return buildPageContent(
                  text,
                  'assets/composite3.png',
                  '',
                  '',
                );
              },
            ),
        // Fourth Page Content
        (_) => FutureBuilder(
              future: translateText(
                  'Now that you know what composite numbers are let\'s go ahead and solve some fun problems.'),
              builder: (context, snapshot) {
                final text = snapshot.data ?? 'Translating...';
                return buildPageContent(
                  text,
                  'assets/practice.png',
                  '',
                  '',
                  isQuiz: true,
                );
              },
            ),
      ],
    );
  }

  Widget buildPageContent(String text, String imagePath, String subText,
      String subImagePath, {bool isQuiz = false}) {
    return Column(
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
                  text,
                  style: TextStyle(
                    fontSize: 30,
                    color: Color.fromARGB(255, 18, 3, 48),
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 10),
                IconButton(
                  icon: Icon(Icons.play_arrow),
                  onPressed: () => speakText(text),
                ),
                if (subText.isNotEmpty) ...[
                  SizedBox(height: 20),
                  Text(
                    subText,
                    style: TextStyle(
                      fontSize: 30,
                      color: Color.fromARGB(255, 18, 3, 48),
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 10),
                  IconButton(
                    icon: Icon(Icons.play_arrow),
                    onPressed: () => speakText(subText),
                  ),
                ],
              ],
            ),
          ),
        ),
        SizedBox(height: 10),
        Image.asset(imagePath, height: 400),
        if (isQuiz)
          ElevatedButton(
            onPressed: () {
              // Navigate to quiz page
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
    );
  }
}
