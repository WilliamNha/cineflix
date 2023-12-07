import 'package:cineflix/constants/app_constants.dart';
import 'package:cineflix/modules/home/models/movie_model.dart';
import 'package:cineflix/widgets/global/custom_grid_view_builder.dart';
import 'package:cineflix/widgets/global/custom_movie_card_in_grid.dart';
import 'package:cineflix/widgets/global/custom_section_title.dart';
import 'package:flutter/material.dart';

class LatestMoviesPartDesktop extends StatelessWidget {
  final List<MovieModel> movieList;
  const LatestMoviesPartDesktop({
    required this.movieList,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
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
                buttonIconWidth: 16,
                titleTextSize: 26,
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
          childHeight: MediaQuery.of(context).size.width / 4,
          chilAmountPerRow: 5,
          childAmount: movieList.length,
          itemBuilder: (context, index) {
            var movie = movieList[index];
            return CustomMovieCardInGrid(
              movieData: movie,
            );
          },
        ),
      ],
    );
  }
}
