import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Welcome to Flutter',
      theme: new ThemeData(primaryColor: Colors.black, fontFamily: 'Quantify'),
      home: Scaffold(
        body: Stack(
          children: <Widget>[
            Center(
              child: AnimatedContainer(
                width: 200,
                height: 200,
                decoration:
                    BoxDecoration(shape: BoxShape.circle, color: Colors.black),
                duration: Duration(seconds: 1),
              ),
            ),
            Center(
              child: Text(
                'Simon 2',
                style: TextStyle(
                    color: Colors.white, fontFamily: 'Quantify', fontSize: 45),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
