import 'package:flutter/material.dart';
import 'package:flutter_ui/models/Planet.dart';
import 'package:flutter_ui/ui/DetailPage/DetailPage.dart';
import 'package:flutter_ui/ui/Layout/Separator.dart';
import 'package:flutter_ui/ui/TextStyle.dart';
class PlanetSumary extends StatelessWidget{

  final Planet planet;
  final bool horizontal;


  PlanetSumary(this.planet, {this.horizontal = true});

  PlanetSumary.vertical(this.planet): horizontal = false;


  @override
  Widget build(BuildContext context) {

    final planetThumbnail = Container(
      margin: const EdgeInsets.symmetric(
          vertical: 16.0
      ),
      alignment: horizontal ? FractionalOffset.centerLeft : FractionalOffset.center,
      child: Hero(
        tag: "planet-hero-${planet.id}",
        child: Image.asset(planet.image, height: 96.0, width: 96.0,),
      ),
    );

    Widget _planetValue ({String value, String image}) {
      return Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Image.asset(image, height: 12.0,),
          Container(width: 8.0,),
          Text(value, style: Style.smallTextStyle,)
        ],
      );
    }

    final planetCardContent = Container(
      margin: EdgeInsets.fromLTRB(horizontal ? 76.0 : 16.0, horizontal ? 16.0 : 42.0, 16.0, 16.0),
      constraints: BoxConstraints.expand(),
      child: Column(
        crossAxisAlignment: horizontal ? CrossAxisAlignment.start : CrossAxisAlignment.center,
        children: <Widget>[
          Container(height: 4.0),
          Text(planet.name, style: Style.headerTextStyle,),
          Container(height: 4.0),
          Text(planet.location, style: Style.commonTextStyle,),
          Separator(),
          Row(
            mainAxisAlignment: horizontal ? MainAxisAlignment.start : MainAxisAlignment.center,
            children: <Widget>[
              Expanded(
                flex: horizontal ? 1 : 0,
                child: _planetValue(
                  image: 'assets/img/ic_distance.png',
                  value: planet.distance
                ),
              ),
              Container(
                width: 32.0,
              ),
              Expanded(
                flex: horizontal ? 1 : 0,
                child: _planetValue(
                  image: 'assets/img/ic_gravity.png',
                  value: planet.gravity
                ),
              )
            ],
          )
        ],
      ),
    );

    final planetCard = Container(
      height: horizontal ? 124.0 : 154.0,
      margin: horizontal ?
        EdgeInsets.only(left: 46.0)
      : EdgeInsets.only(top: 72.0),
      decoration: BoxDecoration(
          color: new Color(0xFF333366),
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(8.0),
          boxShadow: <BoxShadow> [
            BoxShadow(
                color: Colors.black12,
                blurRadius: 10.0,
                offset: Offset(0.0,10.0)
            )
          ]
      ),
      child: planetCardContent,
    );


    return GestureDetector(
      onTap: () => horizontal ?
        Navigator.of(context).push(PageRouteBuilder(
        pageBuilder: (_,__,___) => DetailPage(planet),
        transitionsBuilder: (context, animation, secundaryAnimation, child) =>
            FadeTransition(opacity: animation, child: child,)
      )) : null,
      child: Container(
        margin: const EdgeInsets.symmetric(
          vertical: 16.0,
          horizontal: 24.0,
        ),
        child: Stack(
          children: <Widget>[
            planetCard,
            planetThumbnail
          ],
        ),
      ),
    );
  }

}