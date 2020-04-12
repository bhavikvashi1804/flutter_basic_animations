import 'package:flutter/material.dart';

class FlipperPage extends StatefulWidget {
  @override
  _FlipperPageState createState() => _FlipperPageState();
}

class _FlipperPageState extends State<FlipperPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flipper'),
      ),
      body: Center(
        child:Text('Flipper Demo'),
      ),
      
    );
  }
}