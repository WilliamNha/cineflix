import 'package:cineflix/widgets/global/custom_grid_view_builder.dart';
import 'package:cineflix/widgets/global/custom_movie_card_in_grid.dart';
import 'package:cineflix/widgets/global/custom_movie_type_selection_button.dart';
import 'package:cineflix/widgets/global/custom_section_title.dart';
import 'package:flutter/material.dart';

class RecommendedPartMobile extends StatefulWidget {
  const RecommendedPartMobile({
    super.key,
  });

  @override
  State<RecommendedPartMobile> createState() => _RecommendedPartMobileState();
}

class _RecommendedPartMobileState extends State<RecommendedPartMobile> {
  int selectedMovieTypeIndex = 0;
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.only(top: 40, bottom: 10),
          child: CustomSectionTitle(
            title: 'RECOMMENDED',
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CustomMovieTypeSelectionButton(
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
        const SizedBox(
          height: 20,
        ),
        CustomGridViewBuilder(
          childHeight: screenWidth < 480
              ? MediaQuery.of(context).size.width / 1.3
              : MediaQuery.of(context).size.width / 1.65,
          chilAmountPerRow: screenWidth < 480 ? 2 : 3,
          childAmount: 6,
          itemBuilder: (context, index) {
            return const CustomMovieCardInGrid(
              movieTitle: 'Blue Beetle',
              imageUrl: 'images/blue_beetle.jpg',
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
