import 'package:flutter/material.dart';
import 'package:num_quest/game_list_page.dart';

void main() => runApp(LCMGame());

class LCMGame extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "LCM Matching Game",
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late List<ItemModel> items;
  late List<ItemModel> items2;

  late int score;
  late bool gameOver;

  @override
  void initState() {
    super.initState();
    initGame();
  }

  initGame() {
    gameOver = false;
    score = 0;
    items = [
      ItemModel(name: "12 and 8", value: "24"),
      ItemModel(name: "18 and 9", value: "18"),
      ItemModel(name: "20 and 5", value: "20"),
      ItemModel(name: "15 and 6", value: "30"),
      ItemModel(name: "7 and 14", value: "14"),
    ];
    items2 = [
      ItemModel(name: "24", value: "24"),
      ItemModel(name: "18", value: "18"),
      ItemModel(name: "20", value: "20"),
      ItemModel(name: "30", value: "30"),
      ItemModel(name: "14", value: "14"),
    ];
    items.shuffle();
    items2.shuffle();
  }

  @override
  Widget build(BuildContext context) {
    if (items.isEmpty) gameOver = true;
    return Scaffold(
      backgroundColor: Colors.amber,
      appBar: AppBar(
        centerTitle: true,
        title: Text('LCM Matching Game'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(
                  builder: (context) =>
                      GameListPage()), // Replace `PreviousScreen` with your previous screen widget
            );
          },
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: <Widget>[
            Text.rich(TextSpan(children: [
              TextSpan(text: "Score: "),
              TextSpan(
                  text: "$score",
                  style: TextStyle(
                    color: Colors.green,
                    fontWeight: FontWeight.bold,
                    fontSize: 50.0,
                  ))
            ])),
            if (!gameOver)
              Column(
                children: <Widget>[
                  // Top Row with "number and number" boxes
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: items.map((item) {
                      return Container(
                        margin: const EdgeInsets.all(8.0),
                        child: DragTarget<ItemModel>(
                          onAccept: (receivedItem) {
                            if (item.value == receivedItem.value) {
                              setState(() {
                                items.remove(item);
                                items2.remove(receivedItem);
                                score += 10;
                                item.accepting = false;
                              });
                            } else {
                              setState(() {
                                score -= 5;
                                item.accepting = false;
                              });
                            }
                          },
                          onLeave: (receivedItem) {
                            setState(() {
                              item.accepting = false;
                            });
                          },
                          onWillAccept: (receivedItem) {
                            setState(() {
                              item.accepting = true;
                            });
                            return true;
                          },
                          builder: (context, acceptedItems, rejectedItem) =>
                              Container(
                            color: item.accepting ? Colors.red : Colors.teal,
                            height: 150,
                            width: 150,
                            alignment: Alignment.center,
                            margin: const EdgeInsets.all(8.0),
                            child: Text(
                              item.name,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 30.0),
                            ),
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                  SizedBox(height: 40),
                  // Bottom Row with LCM boxes
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: items2.map((item) {
                      return Draggable<ItemModel>(
                        data: item,
                        childWhenDragging: Container(
                          height: 150,
                          width: 150,
                          color: Colors.grey,
                          child: Center(
                            child: Text(
                              item.name,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 50.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                        feedback: Material(
                          color: Colors.transparent,
                          child: Container(
                            height: 150,
                            width: 150,
                            color: Colors.teal.withOpacity(0.7),
                            child: Center(
                              child: Text(
                                item.name,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 50.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ),
                        child: Container(
                          height: 150,
                          width: 150,
                          color: Colors.teal,
                          child: Center(
                            child: Text(
                              item.name,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 50.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                ],
              ),
            if (gameOver)
              Text(
                "GameOver",
                style: TextStyle(
                  color: Colors.red,
                  fontWeight: FontWeight.bold,
                  fontSize: 24.0,
                ),
              ),
            if (gameOver)
              Center(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.pink,
                    textStyle: TextStyle(color: Colors.white),
                  ),
                  child: Text("New Game"),
                  onPressed: () {
                    initGame();
                    setState(() {});
                  },
                ),
              )
          ],
        ),
      ),
    );
  }
}

class ItemModel {
  final String name;
  final String value;
  bool accepting;

  ItemModel({
    required this.name,
    required this.value,
    this.accepting = false,
  });
}
