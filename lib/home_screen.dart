import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  final String i;
  final String j;

  HomeScreen(this.i, this.j);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[Text(i), Text(j)],
      )),
    );
  }
}
