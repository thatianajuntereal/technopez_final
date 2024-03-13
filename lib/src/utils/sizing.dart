import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

const double baseHeight = 650.0;
const double spaceHeight = 8.0;
const double doubleSpaceHeight = 16.0;
const double paddingSpace = 25.0;
const double fontSizeNormal = 14.0;

class SpaceHeight extends StatelessWidget {
  final double? height;

  SpaceHeight({this.height});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height ?? Adaptive.sp(8),
    );
  }

  Size screenSize(BuildContext context) {
    return MediaQuery.of(context).size;
  }

  double screenHeight(BuildContext context,
      {double dividedBy = 1, double reducedBy = 0.0}) {
    return (screenSize(context).height - reducedBy) / dividedBy;
  }

  double screenWidth(BuildContext context,
      {double dividedBy = 1, double reducedBy = 0.0}) {
    return (screenSize(context).width - reducedBy) / dividedBy;
  }
}
