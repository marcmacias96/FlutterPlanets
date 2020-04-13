import 'package:flutter/material.dart';
import 'package:flutter_ui/ui/Layout/GradientAppBar.dart';
import 'components/HomePageBody.dart';

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Column(
        children: <Widget>[
          GradientAppBar("treva"),
          HomePageBody()
        ],
      ),
    );
  }

}
