import 'package:flutter/material.dart';
import 'package:simon_2/widgets/animated_circle.dart';

class HomeScreen extends StatefulWidget {
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: <Widget>[
          Align(
              alignment: Alignment(-0.5, -0.2),
              child: AnimatedCircle(
                  color: Colors.green,
                  scale: 1.5,
                  duration: Duration(milliseconds: 2000))),
          Align(
              alignment: Alignment(0.5, -0.2),
              child: AnimatedCircle(
                  color: Colors.red,
                  scale: 1.4,
                  duration: Duration(milliseconds: 1900))),
          Align(
              alignment: Alignment(-0.5, 0.2),
              child: AnimatedCircle(
                  color: Colors.yellow,
                  scale: 1.4,
                  duration: Duration(milliseconds: 1800))),
          Align(
              alignment: Alignment(0.5, 0.2),
              child: AnimatedCircle(
                  color: Colors.blue,
                  scale: 1.5,
                  duration: Duration(milliseconds: 2100))),
          Center(
            child: Text(
              "Simon 2",
              style: TextStyle(
                fontSize: 40,
                color: Colors.black,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
