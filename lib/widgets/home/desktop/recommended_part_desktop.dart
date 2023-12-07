import 'package:cineflix/modules/home/models/movie_model.dart';
import 'package:cineflix/widgets/global/custom_grid_view_builder.dart';
import 'package:cineflix/widgets/global/custom_movie_card_in_grid.dart';
import 'package:cineflix/widgets/global/custom_movie_type_selection_button.dart';
import 'package:cineflix/widgets/global/custom_section_title.dart';
import 'package:flutter/material.dart';

class RecommendedPartDesktop extends StatefulWidget {
  final List<MovieModel> movieList;
  const RecommendedPartDesktop({
    required this.movieList,
    super.key,
  });

  @override
  State<RecommendedPartDesktop> createState() => _RecommendedPartDesktopState();
}

class _RecommendedPartDesktopState extends State<RecommendedPartDesktop> {
  int selectedMovieTypeIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 15, top: 30, bottom: 20),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const CustomSectionTitle(
                  buttonIconWidth: 16,
                  titleTextSize: 26,
                  title: 'RECOMMENDED',
                ),
                const SizedBox(
                  width: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CustomMovieTypeSelectionButton(
                      titleSize: 16,
                      buttonText: 'Movies',
                      isSelected: selectedMovieTypeIndex == 0,
                      onTap: () {
                        setState(() {
                          selectedMovieTypeIndex = 0;
                        });
                      },
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    CustomMovieTypeSelectionButton(
                      titleSize: 16,
                      buttonText: 'TV Shows',
                      isSelected: selectedMovieTypeIndex == 1,
                      onTap: () {
                        setState(() {
                          selectedMovieTypeIndex = 1;
                        });
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
          CustomGridViewBuilder(
            horizontalSpacing: 10,
            childHeight: MediaQuery.of(context).size.width / 4,
            chilAmountPerRow: 5,
            childAmount: widget.movieList.length,
            itemBuilder: (context, index) {
              final movie = widget.movieList[index];
              return CustomMovieCardInGrid(
                movieData: movie,
              );
            },
          ),
        ]);
  }
}
