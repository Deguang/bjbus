import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:bjbus/detail.dart';

void main() {
  runApp(new MaterialApp(
    title: 'Navigation basics',
    home: new Home()
  ));
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('北京实时公交'),
      ),
      body: new Center(
        child: new RaisedButton(
          child: new Text('Lanch new screen'),
          onPressed: () {
            Navigator.push(
              context,
              new MaterialPageRoute(builder: (context) => new Detail())
            );
            // Navigate to second screen when tapped!
          }
        ),
      ),
    );
  }
}

Future<http.Response> fetchObject() {
  return http.get('http://www.bjbus.com/home/ajax_rtbus_data.php?act=busTime&selBLine=966&selBDir=5437790928461106576&selBStop=18');
}

