import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AnimatedCircle extends StatefulWidget {
  final Color color;
  final Duration duration;
  final double scale;

  AnimatedCircle(
      {@required this.color, @required this.duration, @required this.scale});

  @override
  _AnimatedCircleState createState() => _AnimatedCircleState();
}

class _AnimatedCircleState extends State<AnimatedCircle>
    with TickerProviderStateMixin {
  AnimationController _controller;
  Animation _animation;

  Widget build(BuildContext context) {
    _controller.forward();

    return AnimatedBuilder(
      animation: _animation,
      builder: (BuildContext context, Widget child) {
        return Container(
          margin: EdgeInsets.symmetric(vertical: 10),
          height: _animation.value * widget.scale,
          width: _animation.value * widget.scale,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: widget.color,
          ),
        );
      },
    );
  }

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(vsync: this, duration: widget.duration);
    _animation = Tween<double>(begin: 100, end: 110).animate(_controller)
      ..addStatusListener(handler);
  }

  void handler(status) {
    if (status == AnimationStatus.completed) {
      _controller.reverse();
    } else if (status == AnimationStatus.dismissed) {
      _controller.forward();
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
