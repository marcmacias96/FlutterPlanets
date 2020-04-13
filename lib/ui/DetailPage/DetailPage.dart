import 'package:flutter/material.dart';
import 'package:flutter_ui/models/Planet.dart';
import 'package:flutter_ui/ui/HomePage/components/PlanetSumary.dart';
import 'package:flutter_ui/ui/Layout/Separator.dart';

import '../TextStyle.dart';

class DetailPage extends StatelessWidget{
  final Planet planet;


  DetailPage(this.planet);

  @override
  Widget build(BuildContext context) {

    Container _getBackground() {
      return Container(
        constraints: BoxConstraints.expand(height: 300.0),
        child: Image.network(
          planet.picture,
          fit: BoxFit.cover,
          height: 300.0,
        ),
      );
    }

    Container _getGradient() {
      return Container(
        margin: const EdgeInsets.only(top:190.0),
        height: 110.0,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: <Color> [
              Color(0x00736AB7),
              Color(0xFF736AB7)
            ],
            stops: [0.0, 0.9],
            begin: const FractionalOffset(0.0, 0.0),
            end: const FractionalOffset(0.0, 1.0)
          )
        ),
      );
    }

    Widget _getContent() {
      final _overviewTitle =  "Overview".toUpperCase();
      return ListView(
        padding: const EdgeInsets.fromLTRB(0.0, 72.0, 0.0, 32.0),
        children: <Widget>[
          PlanetSumary(
            planet,
            horizontal: false,
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 32.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(_overviewTitle, style: Style.headerTextStyle,),
                Separator(),
                Text(planet.description, style: Style.commonTextStyle,)
              ],
            ),
          )
        ],
      );
    }

    Container _getToolBar (BuildContext context) {
      return Container(
        margin: EdgeInsets.only(
          top: MediaQuery.of(context).padding.top
        ),
        child: BackButton(color: Colors.white,),
      );
    }

    return Scaffold(
      body: Container(
        constraints: BoxConstraints.expand(),
        color: Color(0xFF736AB7),
        child: Stack(
        children: <Widget>[
          _getBackground(),
          _getGradient(),
          _getContent(),
          _getToolBar(context)
        ],
        ),
      )
    );
  }

}