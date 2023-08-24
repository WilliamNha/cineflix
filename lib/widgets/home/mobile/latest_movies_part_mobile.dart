import 'package:cineflix/widgets/global/custom_grid_view_builder.dart';
import 'package:cineflix/widgets/global/custom_section_title.dart';
import 'package:cineflix/widgets/home/mobile/recommended_part_mobile.dart';
import 'package:flutter/material.dart';

class LatestMoviesPartMobile extends StatelessWidget {
  const LatestMoviesPartMobile({
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
            return const CustomRecommMovieCardMobile(
              movieTitle: 'Elemental',
              imageUrl: 'images/elemental.jpeg',
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
