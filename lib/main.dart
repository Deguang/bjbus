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

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new HomeState();
  }
}

class HomeState extends State<Home> {
  List data;
  @override
  void initState() {
    super.initState();
    _pullNet();
  }

  void _pullNet() async {
    await http.get('http://www.wanandroid.com/project/list/1/json?cid=1')
      .then((http.Response response) {
        var convertDataToJson = JSON.decode(response.body);
        convertDataToJson = convertDataToJson["data"]["datas"];

        print(convertDataToJson);

        setState(() {
          data = convertDataToJson;
        });
      });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new ListView(
        children: _getItem(),
      )
    );
  }
}

List<Widget> _getItem() {
  return data.map((item) {
    return new Card(
      child: new Padding(
        padding: const EdgeInsets.all(10.0),
        child: _getRowWidget(item),
      ),
      elevation: 3.0,
      margin: const EdgeInsets.all(10.0)
    );
  }).toList();
}

Widget _getRowWidget(item) {
  return new Row(children: <Widget>[
    new Flexible(
      flex: 1,
      fit: FlexFit.tight,
      child: new Stack(children: <Widget>[
        new Column(children: <Widget>[
          new Text(
            "${item["title"]}".trim(),
            style: new TextStyle(color: Colors.black, fontSize: 20.0),
            textAlign: TextAlign.left,
          ),
          new Text(
            "${item["desc"]}",
            maxLines: 3,
          )
        ],)
      ],)
    ),
    new ClipRect(
      child: new FadeInImage.assetNetwork(
        placeholder: "images/ic_shop_normal.png",
        image: "${item['envelopePic']}",
        width: 50.0,
        height: 50.0,
        fit: BoxFit.fitWidth
      )
    )
  ],);
}