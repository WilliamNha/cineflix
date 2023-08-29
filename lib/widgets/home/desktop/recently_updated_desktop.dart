import 'package:cineflix/widgets/global/custom_movie_card_long.dart';
import 'package:cineflix/widgets/global/custom_section_title.dart';
import 'package:flutter/material.dart';

class RecentlyUpdatedDesktop extends StatelessWidget {
  const RecentlyUpdatedDesktop({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 15, top: 30, bottom: 20),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: const [
              CustomSectionTitle(
                buttonIconWidth: 16,
                titleTextSize: 26,
                title: 'RECENTLY UPDATED',
              ),
              SizedBox(
                width: 15,
              ),
            ],
          ),
        ),
        for (var i = 0; i < 6; i++)
          const Padding(
            padding: EdgeInsets.only(bottom: 10),
            child: CustomMovieCardLong(
              isHasCircleNumber: false,
            ),
          ),
      ],
    );
  }
}
