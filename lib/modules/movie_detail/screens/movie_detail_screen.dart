import 'package:cineflix/modules/movie_detail/screens/movie_detail_desktop_body.dart';
import 'package:cineflix/modules/movie_detail/screens/movie_detail_mobile_body.dart';
import 'package:cineflix/modules/movie_detail/screens/movie_detail_tablet_body.dart';
import 'package:cineflix/responsive/responsive_layout.dart';
import 'package:flutter/material.dart';

class MovieDetailScreen extends StatelessWidget {
  const MovieDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: ResponsiveLayout(
          mobileBody: MovieDetailMobileBody(),
          tabletBody: MovieDetailTabletBody(),
          desktopBody: MovieDetailDesktopBody()),
    );
  }
}
