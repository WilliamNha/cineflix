import 'package:flutter/material.dart';
import 'package:cineflix/modules/home/screens/home_desktop_body.dart';
import 'package:cineflix/modules/home/screens/home_mobile_body.dart';
import 'package:cineflix/responsive/responsive_layout.dart';
import 'package:cineflix/modules/home/screens/home_tablet_body.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: ResponsiveLayout(
          mobileBody: HomeMobileBody(),
          tabletBody: HomeTabletBody(),
          desktopBody: HomeDesktopBody()),
    );
  }
}
