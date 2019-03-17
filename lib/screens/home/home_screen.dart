import 'package:flutter/material.dart';
import 'package:simon_2/screens/home/widgets/animated_circle.dart';
import 'package:simon_2/util/simon_colors.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Scaffold(
          backgroundColor: Colors.black,
          body: GestureDetector(
            onTapDown: (TapDownDetails details) =>
                Navigator.pushNamed(context, "/game"),
            child: Container(
              color: Colors.black,
              child: Stack(
                children: <Widget>[
                  Align(
                      alignment: Alignment(-0.5, -0.2),
                      child: AnimatedCircle(
                          color: SimonColors.green,
                          size: MediaQuery.of(context).size.width * 0.45,
                          duration: Duration(milliseconds: 2000))),
                  Align(
                      alignment: Alignment(0.5, -0.2),
                      child: AnimatedCircle(
                          color: SimonColors.red,
                          size: MediaQuery.of(context).size.width * 0.40,
                          duration: Duration(milliseconds: 1900))),
                  Align(
                      alignment: Alignment(-0.5, 0.2),
                      child: AnimatedCircle(
                          color: SimonColors.yellow,
                          size: MediaQuery.of(context).size.width * 0.40,
                          duration: Duration(milliseconds: 1800))),
                  Align(
                      alignment: Alignment(0.5, 0.2),
                      child: AnimatedCircle(
                          color: SimonColors.blue,
                          size: MediaQuery.of(context).size.width * 0.45,
                          duration: Duration(milliseconds: 2100))),
                  Center(
                    child: Text(
                      "Simon 2",
                      style: TextStyle(
                        fontSize: 40,
                        fontFamily: 'Quantify',
                        color: Colors.black,
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Padding(
                      padding: EdgeInsets.only(bottom: 50),
                      child: Text(
                        "Tap anywhere to start",
                        style: TextStyle(fontSize: 18, color: Colors.white),
                      ),
                    ),
                  )
                ],
              ),
            ),
          )),
    );
  }
}
