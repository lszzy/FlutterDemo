import 'dart:async';
import 'package:flutter/material.dart';

class BlocPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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

    return Scaffold(
      appBar: AppBar(
        title: Text("Bloc"),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
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
}