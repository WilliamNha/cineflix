import 'package:cineflix/constants/app_color.dart';
import 'package:cineflix/modules/home/models/movie_model.dart';
import 'package:cineflix/widgets/global/custom_trending_now_title.dart';
import 'package:cineflix/widgets/home/mobile/custom_trending_movie_card_mobile.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';

class TrendingNowPartMobile extends StatefulWidget {
  final List<MovieModel> movieList;
  const TrendingNowPartMobile({
    required this.movieList,
    super.key,
  });

  @override
  State<TrendingNowPartMobile> createState() => _TrendingNowPartMobileState();
}

class _TrendingNowPartMobileState extends State<TrendingNowPartMobile> {
  final PageController trendingController = PageController();
  int trendingSlideIndex = 1;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(vertical: 25),
          decoration: BoxDecoration(
            color: const Color(0xff181818),
            gradient: LinearGradient(
              colors: [
                Colors.black.withOpacity(1),
                Colors.black.withOpacity(0.09),
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              stops: const [0, 0.6],
            ),
          ),
          width: double.infinity,
          child: const Center(child: CustomTrendingNowTitle()),
        ),
        // trending now image slider
        SizedBox(
          height: 170,
          width: double.infinity,
          child: PageView(
            controller: trendingController,
            onPageChanged: (index) {
              setState(() {
                trendingSlideIndex = index + 1;
              });
            },
            scrollBehavior: ScrollConfiguration.of(context).copyWith(
              dragDevices: {
                PointerDeviceKind.touch,
                PointerDeviceKind.mouse,
                PointerDeviceKind.trackpad,
              },
            ),
            scrollDirection: Axis.horizontal,
            children: [
              for (var index = 0; index < 5; index++)
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: CustomTrendingMovieCardMobile(
                    movieData: widget.movieList[index],
                  ),
                ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 15, right: 15, top: 10),
          child: StepProgressIndicator(
            totalSteps: 4,
            currentStep: trendingSlideIndex,
            size: 4,
            padding: 0,
            selectedColor: AppColor.onHoveredColor,
            unselectedColor: Colors.black,
            roundedEdges: const Radius.circular(10),
          ),
        ),
      ],
    );
  }
}
