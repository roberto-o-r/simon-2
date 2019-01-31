import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Welcome to Flutter',
      theme: new ThemeData(primaryColor: Colors.black, fontFamily: 'Quantify'),
      home: Scaffold(
        body: Center(
          child: Text(
            'Simon 2',
            style: TextStyle(
                color: Colors.white, fontFamily: 'Quantify', fontSize: 45),
          ),
        ),
        backgroundColor: Colors.black,
      ),
    );
  }
}
