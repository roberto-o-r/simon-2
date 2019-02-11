import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';
import 'package:simon_2/animated_circle.dart';

void main() => runApp(SimonApp());

class SimonApp extends StatefulWidget {
  _SimonAppState createState() => _SimonAppState();
}

class _SimonAppState extends State<SimonApp>
    with SingleTickerProviderStateMixin {
  Animation<double> animation;
  AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller =
        AnimationController(duration: const Duration(seconds: 2), vsync: this);
    animation = Tween<double>(begin: 150, end: 300).animate(controller)
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
  Widget build(BuildContext context) => AnimatedCircle(animation: animation);

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
