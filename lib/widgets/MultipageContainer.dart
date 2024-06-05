import 'package:flutter/material.dart';

class MultipageContainer extends StatefulWidget {
  final List<Widget Function(bool isEnglish)> pages;
  final bool initialLanguageEnglish;

  MultipageContainer({
    Key? key,
    required this.pages,
    this.initialLanguageEnglish = true,
  }) : super(key: key);

  @override
  _MultipageContainerState createState() => _MultipageContainerState();
}

class _MultipageContainerState extends State<MultipageContainer> {
  bool _isEnglish = true;

  @override
  void initState() {
    super.initState();
    _isEnglish = widget.initialLanguageEnglish;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_isEnglish ? 'Lessons' : 'lecciones'),
      ),
      body: PageView(
        children: widget.pages.map((pageBuilder) {
          return Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/classboard.jpg'),
                fit: BoxFit.cover,
              ),
            ),
            child: Column(
              children: <Widget>[
                Align(
                  alignment: Alignment.topRight,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(
                      onPressed: () {
                        setState(() {
                          _isEnglish = !_isEnglish;
                        });
                      },
                      style: ElevatedButton.styleFrom(
                        padding:
                            EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                        backgroundColor: Colors.orange,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      child: Text(
                        _isEnglish ? 'Translate' : 'Traducir',
                        style: TextStyle(fontSize: 20, color: Colors.white),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: SingleChildScrollView(
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: pageBuilder(_isEnglish),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        }).toList(),
      ),
    );
  }
}
