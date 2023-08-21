import 'package:cineflix/constants/app_color.dart';
import 'package:cineflix/widgets/home/mobile/custom_trending_movie_card_mobile.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';

class TrendingNowPartMobile extends StatefulWidget {
  const TrendingNowPartMobile({
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
          color: Colors.black,
          width: double.infinity,
          child: Center(
              child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              FaIcon(
                // ignore: deprecated_member_use
                FontAwesomeIcons.fireAlt,
                color: Colors.white,
                size: 16,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Text(
                  'Trending Now',
                  style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
              ),
              FaIcon(
                // ignore: deprecated_member_use
                FontAwesomeIcons.fireAlt,
                color: Colors.white,
                size: 16,
              ),
            ],
          )),
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
            children: const [
              CustomTrendingMovieCardMobile(),
              CustomTrendingMovieCardMobile(),
              CustomTrendingMovieCardMobile(),
              CustomTrendingMovieCardMobile(),
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
            unselectedColor: const Color(0xff181818),
            roundedEdges: const Radius.circular(10),
          ),
        ),
      ],
    );
  }
}
