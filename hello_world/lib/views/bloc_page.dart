import 'dart:async';
import 'package:flutter/material.dart';

class BlocPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _BlocPageState();
}

class _BlocPageState extends State<BlocPage> {
  int _counter = 0;
  final StreamController<int> _streamController = StreamController<int>();

  @override
  void dispose() {
    _streamController.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Bloc"),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            RaisedButton(
              child: StreamBuilder<int>(
                stream: _streamController.stream,
                initialData: _counter,
                builder: (BuildContext context, AsyncSnapshot<int> snapshot){
                  return Text("Counter ${snapshot.data}");
                },
              ),
              onPressed: (){
                _streamController.sink.add(++_counter);
              },
            ),
            RaisedButton(
              child: Text("Stream"),
              onPressed: _onClickStream,
            ),
            RaisedButton(
              child: Text("Broadcast"),
              onPressed: _onClickBroadCast,
            ),
          ],
        ),
      ),
    );
  }

  void _onClickStream() {
    final StreamController ctrl = StreamController();
    final StreamSubscription subscription = ctrl.stream.listen((data){
      print("$data");
    });

    ctrl.sink.add('test string');
    ctrl.sink.add(123);
    ctrl.close();
  }

  void _onClickBroadCast() {
    final StreamController<int> ctrl = StreamController<int>.broadcast();
    final StreamSubscription subscription = ctrl.stream.where((value) => (value % 2 == 0)).listen((value) => print('$value'));
    for (int i=1; i<11; i++) {
      ctrl.sink.add(i);
    }
    ctrl.close();
  }
}