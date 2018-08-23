import 'dart:async';
import 'dart:convert';
import 'dart:io';

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
  List data = [
      {'no': 621, 'station': '北苑家园西'},
      {'no': 966, 'station': '北苑家园西'},
      {'no': 621, 'station': '广顺桥南'},
      {'no': 966, 'station': '广顺桥南'}
    ];
  @override
  void initState() {
    super.initState();
    // _pullNet();
  }

  void _pullNet() async {
    // await http.get('http://www.wanandroid.com/project/list/1/json?cid=1')
    //   .then((http.Response response) {
    //     var convertDataToJson = JSON.decode(response.body);
    //     convertDataToJson = convertDataToJson["data"]["datas"];

    //     print("------------------");
    //     print(convertDataToJson);

    //     setState(() {
    //       data = convertDataToJson;
    //     });
    //   });
    setState(() {
      data = [
        {'no': 621, 'station': '北苑家园西'},
        {'no': 966, 'station': '北苑家园西'},
        {'no': 621, 'station': '广顺桥南'},
        {'no': 966, 'station': '广顺桥南'}
      ];
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("北京公交实时查询"),
      ),
      body: new ListView(
        children: _getItem(data, context),
      )
    );
  }
}

List<Widget> _getItem(data, context) {
  return data.map<Widget>((item) {
    return new GestureDetector(
      child: new Card(
        child: new Padding(
          padding: const EdgeInsets.all(10.0),
          child: _getRowWidget(item),
        ),
        elevation: 3.0,
        margin: const EdgeInsets.all(10.0)
      ),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Detail())
        );
      }
    );
  }).toList();
}

Widget _getRowWidget(item) {
  return new ListTile(
    title: new Text("${item['no']}路"),
    subtitle: new Text(item['station'])
  );
  // return new Row(children: <Widget>[
  //   new Flexible(
  //     flex: 1,
  //     fit: FlexFit.tight,
  //     child: new Stack(children: <Widget>[
  //       new Column(children: <Widget>[
  //         new Text(
  //           "${item["title"]}".trim(),
  //           style: new TextStyle(color: Colors.black, fontSize: 20.0),
  //           textAlign: TextAlign.left,
  //         ),
  //         new Text(
  //           "${item["desc"]}",
  //           maxLines: 3,
  //         )
  //       ],)
  //     ],)
  //   ),
  //   new ClipRect(
  //     child: new FadeInImage.assetNetwork(
  //       placeholder: "images/ic_shop_normal.png",
  //       image: "${item['envelopePic']}",
  //       width: 50.0,
  //       height: 50.0,
  //       fit: BoxFit.fitWidth
  //     )
  //   )
  // ],);
}