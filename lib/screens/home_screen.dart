import 'package:flutter/material.dart';
import 'package:simon_2/widgets/animated_circle.dart';

class HomeScreen extends StatefulWidget {
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  Animation<double> animation;
  AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller =
        AnimationController(duration: const Duration(seconds: 2), vsync: this);
    animation = Tween<double>(begin: 1, end: 1.1).animate(controller)
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          controller.reverse();
        } else if (status == AnimationStatus.dismissed) {
          controller.forward();
        }
      });
    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: <Widget>[
          Align(
              alignment: Alignment(0.5, 0.2),
              child: AnimatedCircle(
                  animation: this.animation, color: Colors.red, size: 150)),
          Align(
              alignment: Alignment(-0.5, -0.2),
              child: AnimatedCircle(
                  animation: this.animation, color: Colors.blue, size: 140)),
          Align(
              alignment: Alignment(-0.5, 0.2),
              child: AnimatedCircle(
                  animation: this.animation, color: Colors.yellow, size: 130)),
          Align(
              alignment: Alignment(0.5, -0.2),
              child: AnimatedCircle(
                  animation: this.animation, color: Colors.green, size: 160)),
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

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
