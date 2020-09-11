import 'package:flutter/material.dart';

class CatAnimationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cat Animation'),
      ),
      body: CatAnimation(),
    );
  }
}

class CatAnimation extends StatefulWidget {
  @override
  _CatAnimationState createState() => _CatAnimationState();
}

class _CatAnimationState extends State<CatAnimation> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Cat(),
    );
  }
}

class Cat extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Image.network("https://i.imgur.com/QwhZRyL.png");
  }
}
