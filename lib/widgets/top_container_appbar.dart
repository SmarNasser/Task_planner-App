import 'package:flutter/material.dart';
import 'package:taskplanner/colors/light_colors.dart';

class TopContainerAppbar extends StatelessWidget {
  final double height;
  final double width;
  final Widget child;
  final EdgeInsets padding;
  TopContainerAppbar({this.height, this.width, this.child, this.padding});


  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding!=null ? padding : EdgeInsets.symmetric(horizontal: 20.0),
      decoration: BoxDecoration(
          color: LightColors.kLightPurple,
    borderRadius: BorderRadius.only(
    bottomRight: Radius.circular(40.0),
    bottomLeft: Radius.circular(40.0),
    )),
      height: height,
      width: width,
      child: child,
    );
  }
}
