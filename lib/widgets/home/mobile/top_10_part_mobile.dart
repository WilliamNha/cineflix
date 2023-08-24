import 'package:cineflix/widgets/global/custom_movie_card_long.dart';
import 'package:cineflix/widgets/global/custom_movie_type_selection_button.dart';
import 'package:cineflix/widgets/global/custom_section_title.dart';
import 'package:flutter/material.dart';

class Top10PartMobile extends StatefulWidget {
  const Top10PartMobile({
    super.key,
  });

  @override
  State<Top10PartMobile> createState() => _Top10PartMobileState();
}

class _Top10PartMobileState extends State<Top10PartMobile> {
  int selectedMovieTypeIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.only(top: 20, bottom: 10),
          child: CustomSectionTitle(
            title: 'TOP10',
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CustomMovieTypeSelectionButton(
              buttonText: 'Day',
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
              buttonText: 'Week',
              isSelected: selectedMovieTypeIndex == 1,
              onTap: () {
                setState(() {
                  selectedMovieTypeIndex = 1;
                });
              },
            ),
            const SizedBox(
              width: 10,
            ),
            CustomMovieTypeSelectionButton(
              buttonText: 'Month',
              isSelected: selectedMovieTypeIndex == 2,
              onTap: () {
                setState(() {
                  selectedMovieTypeIndex = 2;
                });
              },
            ),
          ],
        ),
        const SizedBox(
          height: 20,
        ),
        const Padding(
          padding: EdgeInsets.only(bottom: 10),
          child: CustomMovieCardLong(
            isHasCircleNumber: true,
          ),
        ),
        const Padding(
          padding: EdgeInsets.only(bottom: 10),
          child: CustomMovieCardLong(
            isHasCircleNumber: true,
          ),
        ),
        const Padding(
          padding: EdgeInsets.only(bottom: 10),
          child: CustomMovieCardLong(
            isHasCircleNumber: true,
          ),
        ),
        const SizedBox(
          height: 20,
        ),
      ],
    );
  }
}
