import 'package:flutter/material.dart';

class Detail extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("线路详情"),
      ),
      body: new Center(
        child: new RaisedButton(
          child: new Text('GO back!'),
          onPressed: () {
            // Navigate to first screen when tapped!
            Navigator.pop(context);
          },
        )
      )
    );
  }
}


