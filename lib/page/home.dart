

import 'dart:convert';
import 'package:http/http.dart'as http;
import 'package:flutter/material.dart';
import 'package:todo/component/product_item.dart';
import 'package:todo/constant/choices.dart';
import 'package:todo/model/choice.dart';
import 'package:todo/model/post.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);


  final String title;
  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Widget> _data = [];
  void _select(Choice choice) {
      setState(() {
      print(choice.title);
    });
  }



    void _fetchPost() async {

    var data= [];

      final response =  await http.get('https://yts.am/api/v2/list_movies.json');
      if (response.statusCode == 200) {

          setState(() {
           List< dynamic> responses = json.decode(response.body)['data']['movies'] as List;
           data=  responses.map((data)=> Post.fromJson(data)).toList();

          });
      } else {
         throw Exception('Failed to load post');
      }
      _data = data.map((post)=> ProductItem(post: post) ).toList();

    }

@override
  void initState() {
    // TODO: implement initState
    super.initState();
    _fetchPost();
  }
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: new Text(widget.title),
        actions: <Widget>[
          IconButton(
            icon: Icon(choices[0].icon),
            onPressed: () {
              _select(choices[0]);
            },
          ), IconButton(
            icon: Icon(choices[1].icon),
            onPressed: () {
              _select(choices[1]);
            },
          ), IconButton(
            icon: Icon(choices[2].icon),
            onPressed: () {
              _select(choices[2]);
            },
          ),
        ],
      ),
      body: new Container(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child:OrientationBuilder(
          builder: (context, orientation) {
            print(orientation);
            return GridView.count(
              // Create a grid with 2 columns in portrait mode, or 3 columns in
              // landscape mode.
              crossAxisCount: orientation == Orientation.portrait ? 1 : 2,
              primary: false,
              crossAxisSpacing: 5.0,
              children: _data,
            );
          },
        )
      )
    );
  }
}
