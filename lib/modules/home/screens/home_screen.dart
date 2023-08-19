import 'package:flutter/material.dart';
import 'package:cineflix/responsive/desktop_body.dart';
import 'package:cineflix/responsive/mobile_body.dart';

import 'package:cineflix/responsive/responsive_layout.dart';
import 'package:cineflix/responsive/tablet_body.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: ResponsiveLayout(
          mobileBody: MobileBody(),
          tabletBody: TabletBody(),
          desktopBody: DesktopBody()),
    );
  }
}
