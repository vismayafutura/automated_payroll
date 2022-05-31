import 'package:flutter/material.dart';

class Background extends StatelessWidget {
  final Widget child;

  const Background({
     Key key,
     this.child,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      width: double.infinity,
      height: size.height,
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Positioned(
            top: 30,
            right: 0,
            left: 75,
            child: Image.asset(
              "assets/images/top1.png",
              width: size.width
            ),
          ),
          Positioned(
            top: 20,
            right: 0,
            left: 80,
            child: Image.asset(
              "assets/images/top2.png",
              width: size.width
            ),
          ),
          Positioned(
            top: 50,
            right: 10,
            child: Image.asset(
              "assets/images/main.png",
              width: size.width * 0.35
            ),
          ),
          Positioned(
            bottom: 0,
            right: 40,
            child: Image.asset(
              "assets/images/bottom1.png",
              width: size.width
            ),
          ),
          Positioned(
            bottom: 20,
            right: 0,
            left: 80,

            child: Image.asset(
              "assets/images/bottom2.png",
              width: size.width
            ),
          ),
          child
        ],
      ),
    );
  }
}