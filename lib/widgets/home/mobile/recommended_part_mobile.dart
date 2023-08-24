import 'package:cineflix/constants/app_color.dart';
import 'package:cineflix/widgets/global/custom_grid_view_builder.dart';
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
            return const CustomRecommMovieCardMobile(
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

class CustomRecommMovieCardMobile extends StatefulWidget {
  final String movieTitle;
  final String imageUrl;
  const CustomRecommMovieCardMobile({
    required this.movieTitle,
    required this.imageUrl,
    super.key,
  });

  @override
  State<CustomRecommMovieCardMobile> createState() =>
      _CustomRecommMovieCardMobileState();
}

class _CustomRecommMovieCardMobileState
    extends State<CustomRecommMovieCardMobile> {
  bool isOnHovered = false;
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return InkWell(
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onHover: (isHovered) {
        setState(() {
          isOnHovered = isHovered;
        });
      },
      onTap: () {},
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          AspectRatio(
            aspectRatio: screenWidth < 480 ? 9 / 12 : 9 / 13,
            child: Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(widget.imageUrl), fit: BoxFit.fill),
                      borderRadius: BorderRadius.circular(8)),
                  width: double.infinity,
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: const []),
                ),
                isOnHovered
                    ? Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            gradient: LinearGradient(
                                colors: [
                                  AppColor.onHoveredColor.withOpacity(0.7),
                                  AppColor.onHoveredColor.withOpacity(0.1)
                                ],
                                stops: const [
                                  0,
                                  0.6
                                ],
                                begin: Alignment.bottomCenter,
                                end: Alignment.topCenter)),
                        width: double.infinity,
                        child: Center(
                            child: Container(
                          width: 40,
                          height: 40,
                          decoration: const BoxDecoration(
                              color: Colors.black, shape: BoxShape.circle),
                          child: Icon(
                            Icons.play_arrow,
                            size: 25,
                            color: Colors.grey.withOpacity(0.7),
                          ),
                        )),
                      )
                    : const SizedBox()
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 14),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  '2023',
                  style: TextStyle(color: Colors.grey, fontSize: 12),
                ),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                          color: isOnHovered
                              ? AppColor.onHoveredColor
                              : Colors.grey,
                          width: 1)),
                  child: Text(
                    'Movie',
                    style: TextStyle(
                        color:
                            isOnHovered ? AppColor.onHoveredColor : Colors.grey,
                        fontSize: 12),
                  ),
                ),
                const Text(
                  '124 min',
                  style: TextStyle(color: Colors.grey, fontSize: 12),
                )
              ],
            ),
          ),
          Expanded(
            child: Text(
              widget.movieTitle,
              style: TextStyle(
                  color: isOnHovered ? AppColor.onHoveredColor : Colors.white,
                  fontSize: 14),
            ),
          )
        ],
      ),
    );
  }
}
