import 'package:cineflix/modules/movie_detail/screens/movie_detail_desktop_body.dart';
import 'package:cineflix/modules/movie_detail/screens/movie_detail_mobile_body.dart';
import 'package:cineflix/modules/movie_detail/screens/movie_detail_tablet_body.dart';
import 'package:cineflix/responsive/responsive_layout.dart';
import 'package:flutter/material.dart';

class MovieDetailScreen extends StatelessWidget {
  final String movieID;
  const MovieDetailScreen({super.key, required this.movieID});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ResponsiveLayout(
          mobileBody: MovieDetailMobileBody(
            movieID: movieID,
          ),
          tabletBody: MovieDetailTabletBody(
            movieID: movieID,
          ),
          desktopBody: MovieDetailDesktopBody(
            movieID: movieID,
          )),
    );
  }
}
