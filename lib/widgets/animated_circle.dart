import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AnimatedCircle extends AnimatedWidget {
  AnimatedCircle({Key key, Animation<double> animation})
      : super(key: key, listenable: animation);

  Widget build(BuildContext context) {
    final Animation<double> animation = listenable;
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      height: animation.value,
      width: animation.value,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.red,
      ),
    );
  }
}
