import 'package:cineflix/widgets/global/custom_movie_card_long.dart';
import 'package:cineflix/widgets/global/custom_section_title.dart';
import 'package:flutter/material.dart';

class RecentlyUpdatedPartMobile extends StatelessWidget {
  const RecentlyUpdatedPartMobile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.only(top: 20, bottom: 10),
          child: CustomSectionTitle(
            title: 'RECENTLY UPDATED',
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        for (var i = 0; i < 4; i++)
          const Padding(
            padding: EdgeInsets.only(bottom: 10),
            child: CustomMovieCardLong(),
          ),
      ],
    );
  }
}
