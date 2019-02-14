import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AnimatedCircle extends AnimatedWidget {
  AnimatedCircle({Key key, Animation<double> animation, this.color, this.size})
      : super(key: key, listenable: animation);

  final Color color;
  final double size;

  Widget build(BuildContext context) {
    final Animation<double> animation = listenable;
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      height: animation.value * this.size,
      width: animation.value * this.size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: color,
      ),
    );
  }
}
