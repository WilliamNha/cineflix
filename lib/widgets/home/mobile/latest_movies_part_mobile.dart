import 'package:cineflix/modules/home/models/movie_model.dart';
import 'package:cineflix/widgets/global/custom_grid_view_builder.dart';
import 'package:cineflix/widgets/global/custom_movie_card_in_grid.dart';
import 'package:cineflix/widgets/global/custom_section_title.dart';
import 'package:flutter/material.dart';

class LatestMoviesPartMobile extends StatelessWidget {
  final List<MovieModel>? movieList;
  const LatestMoviesPartMobile({
    this.movieList,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.only(top: 30, bottom: 10),
          child: CustomSectionTitle(
            title: 'LATEST MOVIES',
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        CustomGridViewBuilder(
          childHeight: screenWidth < 480
              ? MediaQuery.of(context).size.width / 1.3
              : MediaQuery.of(context).size.width / 1.65,
          chilAmountPerRow: screenWidth < 480 ? 2 : 3,
          childAmount: 6,
          itemBuilder: (context, index) {
            final movie = movieList![index];
            return CustomMovieCardInGrid(
              movieData: movie,
            );
          },
        ),
        const SizedBox(
          height: 20,
        )
      ],
    );
  }
}
