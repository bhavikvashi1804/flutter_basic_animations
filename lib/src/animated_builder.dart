import 'package:flutter/material.dart';
import 'dart:math';

import 'package:random_pk/random_pk.dart';

class AnimatedBuilderPage extends StatefulWidget {
  @override
  _AnimatedBuilderPageState createState() => _AnimatedBuilderPageState();
}

class _AnimatedBuilderPageState extends State<AnimatedBuilderPage>
    with SingleTickerProviderStateMixin {
  AnimationController _animationController;
  Animation _animation;

  @override
  void initState() {
    _animationController = AnimationController(duration: Duration(seconds: 10))
      ..repeat();

    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Animated Builder'),
      ),
      body: Center(
        child: RandomContainer(
          height: 200,
          width: 200,
          //random container is not rebuilding
          //only AnimatedBuilder is rebuilding
          child: AnimatedBuilder(
            animation: _animationController,
            builder: (context, child) => Transform.rotate(
              angle: _animationController.value * 2.0 * pi,
              child: child,
            ),
            child: Container(
              color: Colors.red,
            ),
          ),
        ),
      ),
    );
  }
}
