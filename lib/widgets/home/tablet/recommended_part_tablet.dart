import 'package:cineflix/widgets/global/custom_grid_view_builder.dart';
import 'package:cineflix/widgets/global/custom_movie_type_selection_button.dart';
import 'package:cineflix/widgets/global/custom_section_title.dart';
import 'package:cineflix/widgets/home/mobile/recommended_part_mobile.dart';
import 'package:flutter/material.dart';

class RecommendedPartTablet extends StatefulWidget {
  const RecommendedPartTablet({
    super.key,
  });

  @override
  State<RecommendedPartTablet> createState() => _RecommendedPartTabletState();
}

class _RecommendedPartTabletState extends State<RecommendedPartTablet> {
  @override
  Widget build(BuildContext context) {
    int selectedMovieTypeIndex = 0;
    double screenWidth = MediaQuery.of(context).size.width;
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
                buttonIconWidth: 14,
                titleTextSize: 24,
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
            ],
          ),
        ),
        CustomGridViewBuilder(
          horizontalSpacing: 10,
          childHeight: screenWidth >= 1080
              ? MediaQuery.of(context).size.width / 2.9
              : MediaQuery.of(context).size.width / 2.4,
          chilAmountPerRow: screenWidth >= 1080 ? 5 : 4,
          childAmount: 12,
          itemBuilder: (context, index) {
            return const CustomRecommMovieCardMobile(
              movieTitle: 'Blue Beetle',
              imageUrl: 'images/blue_beetle.jpg',
            );
          },
        ),
      ],
    );
  }
}
