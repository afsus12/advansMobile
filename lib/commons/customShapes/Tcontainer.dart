import 'package:flutter/material.dart';

class Tcontainer extends StatelessWidget {
  const Tcontainer({
    super.key,
    this.child,
    this.height = 400,
    this.backgroundcolor = Colors.white,
    this.padding = 0,
    this.raduis = 400,
    this.width = 400,
  });

  final double? width;
  final double? height;
  final double raduis;
  final double padding;
  final Widget? child;
  final Color backgroundcolor;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      padding: EdgeInsets.all(padding),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(raduis),
        color: backgroundcolor,
      ),
      child: child,
    );
  }
}
