import 'package:flutter/material.dart';

class GradientAppBar extends StatelessWidget{

  final String title;
  final double barHeigth = 50.0;


  GradientAppBar(this.title);

  @override
  Widget build(BuildContext context) {

    final double statusBarHeight = MediaQuery.of(context).padding.top;

    return Container(
      padding: EdgeInsets.only(bottom: 2),
      height: barHeigth + statusBarHeight,
      decoration: BoxDecoration(
        gradient: LinearGradient(
            colors: [
              const Color(0xFF373B44),
              const Color(0xFF4286F4),
            ],
            begin: const FractionalOffset(0.0, 0.0),
            end: const FractionalOffset(1.0, 0.0),
            stops: [0.0, 1.0],
            tileMode: TileMode.clamp
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          Text('Planetas',
              style: TextStyle(
                  color: Colors.white,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w600,
                  fontSize: 36.0
              )
          )
        ],
      ),
    );
  }

}