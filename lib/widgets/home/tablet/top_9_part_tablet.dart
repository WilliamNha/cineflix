import 'package:cineflix/widgets/global/custom_movie_card_long.dart';
import 'package:cineflix/widgets/global/custom_movie_type_selection_button.dart';
import 'package:cineflix/widgets/global/custom_section_title.dart';
import 'package:flutter/material.dart';

class Top10PartTablet extends StatefulWidget {
  const Top10PartTablet({
    super.key,
  });

  @override
  State<Top10PartTablet> createState() => _Top10PartTabletState();
}

class _Top10PartTabletState extends State<Top10PartTablet> {
  int selectedMovieTypeIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 15, top: 40, bottom: 20),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const CustomSectionTitle(
                buttonIconWidth: 14,
                titleTextSize: 24,
                title: 'TOP10',
              ),
              const Spacer(),
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
                width: 15,
              ),
            ],
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
