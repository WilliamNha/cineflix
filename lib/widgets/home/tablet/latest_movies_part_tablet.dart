import 'package:cineflix/widgets/global/custom_grid_view_builder.dart';
import 'package:cineflix/widgets/global/custom_movie_card_in_grid.dart';
import 'package:cineflix/widgets/global/custom_section_title.dart';
import 'package:flutter/material.dart';

class LatestMoviesPartTablet extends StatefulWidget {
  const LatestMoviesPartTablet({
    super.key,
  });

  @override
  State<LatestMoviesPartTablet> createState() => _LatestMoviesPartTabletState();
}

class _LatestMoviesPartTabletState extends State<LatestMoviesPartTablet> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 15, top: 60, bottom: 20),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: const [
              CustomSectionTitle(
                buttonIconWidth: 14,
                titleTextSize: 24,
                title: 'LATEST MOVIES',
              ),
              SizedBox(
                width: 15,
              ),
            ],
          ),
        ),
        CustomGridViewBuilder(
          horizontalSpacing: 10,
          childHeight: screenWidth >= 1080
              ? MediaQuery.of(context).size.width / 2.9
              : MediaQuery.of(context).size.width / 2.3,
          chilAmountPerRow: screenWidth >= 1080 ? 5 : 4,
          childAmount: 12,
          itemBuilder: (context, index) {
            return const CustomMovieCardInGrid(
              movieTitle: 'Blue Beetle',
              imageUrl: 'images/blue_beetle.jpg',
            );
          },
        ),
      ],
    );
  }
}
