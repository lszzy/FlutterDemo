import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  final String title = 'Home';

  @override
  State<StatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;

  void _incrementIndex() {
    setState(() {
      _currentIndex++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            RaisedButton(
              onPressed: _incrementIndex,
              child: Text('Increment $_currentIndex'),
            ),
            RaisedButton(
              onPressed: (){
                Navigator.of(context).pushNamed("/bloc");
              },
              child: Text('Bloc'),
            )
          ],
        ),
      ),
    );
  }
}