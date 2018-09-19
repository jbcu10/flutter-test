import 'package:flutter/material.dart';
import 'package:todo/page/home.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Todo',
      theme: new ThemeData(
        primaryColor: Colors.black,
        primaryColorDark: Colors.blueGrey,
        accentColor: Colors.grey,
        backgroundColor: Colors.blueGrey
      ),
      home: new MyHomePage(title: 'Todo List'),

    );
  }
}

