import 'package:flutter/material.dart';

class ResponsiveLayout extends StatelessWidget {
  final Widget mobileBody;
  final Widget tabletBody;
  final Widget desktopBody;
  const ResponsiveLayout(
      {super.key,
      required this.mobileBody,
      required this.tabletBody,
      required this.desktopBody});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      // debugPrint("width: ${constraints.maxWidth}");
      if (constraints.maxWidth < 750) {
        return mobileBody;
      } else if (constraints.maxWidth < 1320) {
        return tabletBody;
      } else {
        return desktopBody;
      }
    });
  }
}
