import 'package:flutter/material.dart';
import 'package:flutter_ui/models/Planet.dart';
import 'PlanetSumary.dart';

class HomePageBody extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Expanded(
      child: Container(
        color: new Color(0xFF736AB7),
        child: CustomScrollView(
          scrollDirection: Axis.vertical,
          slivers: <Widget>[
            SliverPadding(
              padding: const EdgeInsets.symmetric(vertical: 24.0),
              sliver: SliverFixedExtentList(
                itemExtent: 155.0,
                delegate: SliverChildBuilderDelegate(
                      (context, index) => new PlanetSumary(planets[index]),
                  childCount: planets.length
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

