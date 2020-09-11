import 'package:flutter/material.dart';
import 'dart:math' as math;

class BrickPage extends StatefulWidget {
  @override
  _BrickPageState createState() => _BrickPageState();
}

class _BrickPageState extends State<BrickPage> with TickerProviderStateMixin {
  AnimationController _animationController;
  Tween _tween;

  @override
  void initState() {
    _animationController =
        AnimationController(duration: Duration(milliseconds: 5000));

    _tween = Tween(begin: 0.0, end: 1.0);

    _animationController.repeat();

    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  //for B1
  Animation get animOne => _tween.animate(CurvedAnimation(
        parent: _animationController,
        curve: Interval(0.0, 0.125, curve: Curves.linear),
      ));
  //for B1
  Animation get animTwo => _tween.animate(CurvedAnimation(
        parent: _animationController,
        curve: Interval(0.125, 0.250, curve: Curves.linear),
      ));

  //for B2
  Animation get animThree => _tween.animate(CurvedAnimation(
        parent: _animationController,
        curve: Interval(0.250, 0.375, curve: Curves.linear),
      ));
  //for B3
  Animation get animFour => _tween.animate(CurvedAnimation(
        parent: _animationController,
        curve: Interval(0.375, 0.5, curve: Curves.linear),
      ));

  //for B4
  Animation get animFive => _tween.animate(CurvedAnimation(
        parent: _animationController,
        curve: Interval(0.5, 0.625, curve: Curves.linear),
      ));
  //for B4
  Animation get animSix => _tween.animate(CurvedAnimation(
        parent: _animationController,
        curve: Interval(0.625, 0.750, curve: Curves.linear),
      ));

  //for B3
  Animation get animSeven => _tween.animate(CurvedAnimation(
        parent: _animationController,
        curve: Interval(0.750, 0.875, curve: Curves.linear),
      ));

  //for B2
  Animation get animEight => _tween.animate(CurvedAnimation(
        parent: _animationController,
        curve: Interval(0.875, 1.0, curve: Curves.linear),
      ));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Brick Animation'),
      ),
      body: Center(
          child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          AnimatedBrick(
            animations: [animOne, animTwo],
            controller: _animationController,
            marginLeft: 0.0,
            alignment: Alignment.centerLeft,
            isClockWise: true,
          ),
          AnimatedBrick(
            animations: [animThree, animEight],
            controller: _animationController,
            marginLeft: 0.0,
            isClockWise: false,
          ),
          AnimatedBrick(
            animations: [animFour, animSeven],
            controller: _animationController,
            marginLeft: 30.0,
            isClockWise: true,
          ),
          AnimatedBrick(
            animations: [animFive, animSix],
            controller: _animationController,
            marginLeft: 30.0,
            isClockWise: false,
          ),
        ],
      )),
    );
  }
}

class AnimatedBrick extends AnimatedWidget {
  final AnimationController controller;
  final List<Animation> animations;
  final double marginLeft;
  final Alignment alignment;
  final bool isClockWise;

  AnimatedBrick(
      {Key key,
      this.controller,
      this.animations,
      this.marginLeft,
      this.alignment = Alignment.centerRight,
      this.isClockWise})
      : super(key: key, listenable: controller);

  Matrix4 clockWise(animation) =>
      Matrix4.rotationZ(animation.value * math.pi * 2.0 * 0.5);
  Matrix4 antiClockWise(animation) =>
      Matrix4.rotationZ(-(animation.value * math.pi * 2.0 * 0.5));

  @override
  Widget build(BuildContext context) {
    var firstTransformation, secondTransformation;

    if (isClockWise) {
      firstTransformation = clockWise(animations[0]);
      secondTransformation = clockWise(animations[1]);
    } else {
      firstTransformation = antiClockWise(animations[0]);
      secondTransformation = antiClockWise(animations[1]);
    }

    return Transform(
      transform: firstTransformation,
      alignment: alignment,
      child: Transform(
        transform: secondTransformation,
        alignment: alignment,
        child: Brick(
          leftMargin: marginLeft,
        ),
      ),
    );
  }
}

class Brick extends StatelessWidget {
  final double leftMargin;
  Brick({this.leftMargin = 15.0});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 10,
      width: 40,
      margin: EdgeInsets.only(left: leftMargin),
      decoration: BoxDecoration(
          color: Colors.green, borderRadius: BorderRadius.circular(15.0)),
    );
  }
}
