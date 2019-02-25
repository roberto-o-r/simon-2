import 'package:flutter/material.dart';
import 'package:simon_2/util/simon_colors.dart';

class GameScreen extends StatefulWidget {
  _GameScreenState createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: <Widget>[
          Align(
            alignment: Alignment.topLeft,
            child: FractionallySizedBox(
              widthFactor: 0.5,
              heightFactor: 0.5,
              child: Padding(
                padding: EdgeInsets.only(left: 8, top: 8, right: 4, bottom: 4),
                child: RaisedButton(
                  color: SimonColors.green,
                  onPressed: () {},
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.topRight,
            child: FractionallySizedBox(
              widthFactor: 0.5,
              heightFactor: 0.5,
              child: Padding(
                padding: EdgeInsets.only(left: 4, top: 8, right: 8, bottom: 4),
                child: RaisedButton(
                  color: SimonColors.red,
                  onPressed: () {},
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: FractionallySizedBox(
              widthFactor: 0.5,
              heightFactor: 0.5,
              child: Padding(
                padding: EdgeInsets.only(left: 8, top: 4, right: 4, bottom: 8),
                child: RaisedButton(
                  color: SimonColors.yellow,
                  onPressed: () {},
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: FractionallySizedBox(
              widthFactor: 0.5,
              heightFactor: 0.5,
              child: Padding(
                padding: EdgeInsets.only(left: 4, top: 4, right: 8, bottom: 8),
                child: RaisedButton(
                  color: SimonColors.blue,
                  onPressed: () {},
                ),
              ),
            ),
          ),
          Center(
            child: Container(
                decoration: BoxDecoration(
                    shape: BoxShape.circle, color: SimonColors.translucent),
                child: Padding(
                  padding: EdgeInsets.all(8),
                  child: Text(
                    "00",
                    style: TextStyle(fontSize: 50, color: Colors.white),
                  ),
                )),
          )
        ],
      ),
    );
  }
}
