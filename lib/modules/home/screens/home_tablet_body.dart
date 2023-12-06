import 'dart:ui';

import 'package:cineflix/constants/app_color.dart';
import 'package:cineflix/widgets/global/custom_back_and_next_button_movie_slider.dart';
import 'package:cineflix/widgets/global/custom_back_and_next_button_trending_now.dart';
import 'package:cineflix/widgets/global/custom_trending_now_title.dart';
import 'package:cineflix/widgets/home/tablet/app_bar_row_tablet.dart';
import 'package:cineflix/widgets/home/mobile/custom_trending_movie_card_mobile.dart';
import 'package:cineflix/widgets/home/tablet/lastest_tv_show_part.dart';
import 'package:cineflix/widgets/home/tablet/latest_movies_part_tablet.dart';
import 'package:cineflix/widgets/home/tablet/movie_header_tablet.dart';
import 'package:cineflix/widgets/home/tablet/recently_updated_part_tablet.dart';
import 'package:cineflix/widgets/home/tablet/recommended_part_tablet.dart';
import 'package:cineflix/widgets/home/tablet/top_9_part_tablet.dart';
import 'package:flutter/material.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';

class HomeTabletBody extends StatefulWidget {
  const HomeTabletBody({super.key});

  @override
  State<HomeTabletBody> createState() => _HomeTabletBodyState();
}

class _HomeTabletBodyState extends State<HomeTabletBody> {
  int pageCurrentIndex = 0;
  int trendingSlideIndex = 0;
  var trendingController = PageController(viewportFraction: 1 / 2);
  PageController movieHeaderController = PageController();
  ScrollController controller = ScrollController();

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    //1080 change layout

    // debugPrint('width: $screenWidth');
    return Scaffold(
        backgroundColor: AppColor.backgroundColor,
        body: RawScrollbar(
          controller: controller,
          thumbVisibility: true,
          thumbColor: AppColor.onHoveredColor,
          radius: const Radius.circular(4),
          thickness: 8,
          // controller: yourScrollController,
          trackVisibility: true,
          child: SingleChildScrollView(
            controller: controller,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  children: [
                    Container(
                      color: AppColor.backgroundColor,
                      width: double.infinity,
                      height: 850,
                      child: PageView(
                        onPageChanged: (index) {
                          setState(() {
                            pageCurrentIndex = index;
                          });
                        },
                        scrollBehavior:
                            ScrollConfiguration.of(context).copyWith(
                          dragDevices: {
                            PointerDeviceKind.touch,
                            PointerDeviceKind.mouse,
                            PointerDeviceKind.trackpad,
                          },
                        ),
                        controller: movieHeaderController,
                        scrollDirection: Axis.horizontal,
                        children: const [
                          MovieHeadTablet(),
                          MovieHeadTablet(),
                          MovieHeadTablet(),
                          MovieHeadTablet()
                        ],
                      ),
                    ),
                    const Positioned.fill(
                      top: 20,
                      left: 20,
                      child: AppBarRowTablet(),
                    ),
                    // forward and back button
                    Positioned(
                        right: 20,
                        top: 420,
                        child: CustomBackAndNextButtonsMovieSlider(
                          onBackButtonTapped: () {
                            setState(() {
                              movieHeaderController.animateToPage(
                                  --pageCurrentIndex,
                                  duration: const Duration(milliseconds: 300),
                                  curve: Curves.linear);
                            });
                          },
                          onNextButtonTapped: () {
                            setState(() {
                              movieHeaderController.animateToPage(
                                  ++pageCurrentIndex,
                                  duration: const Duration(milliseconds: 300),
                                  curve: Curves.linear);
                            });
                          },
                          currentIndex: pageCurrentIndex,
                        )),
                    //  progress bar movie slider
                    Positioned(
                      left: 0,
                      top: 490,
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width,
                        child: Padding(
                          padding: const EdgeInsets.only(
                            left: 15,
                            right: 15,
                          ),
                          child: StepProgressIndicator(
                            totalSteps: 4,
                            currentStep: pageCurrentIndex + 1,
                            size: 1.5,
                            padding: 0,
                            selectedColor: Colors.white.withOpacity(0.6),
                            unselectedColor: Colors.white.withOpacity(0.2),
                            roundedEdges: const Radius.circular(10),
                          ),
                        ),
                      ),
                    ),
                    //trending now title
                    Positioned(
                      left: 0,
                      top: 510,
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width,
                        child: const Center(child: CustomTrendingNowTitle()),
                      ),
                    ),
                    //trending image slider
                    Positioned(
                        right: 0,
                        left: 0,
                        top: 550,
                        child: Container(
                          // color: Colors.red,
                          margin: EdgeInsets.only(
                              left: 10, right: screenWidth >= 1080 ? 50 : 10),
                          width: MediaQuery.of(context).size.width,
                          height: 220,
                          // color: Colors.red,
                          child: LayoutBuilder(
                            builder: (context, constrains) {
                              return PageView(
                                padEnds: false,
                                controller: trendingController,
                                onPageChanged: (index) {
                                  setState(() {
                                    trendingSlideIndex = index;
                                  });
                                },
                                scrollBehavior:
                                    ScrollConfiguration.of(context).copyWith(
                                  dragDevices: {
                                    PointerDeviceKind.touch,
                                    PointerDeviceKind.mouse,
                                    PointerDeviceKind.trackpad,
                                  },
                                ),
                                scrollDirection: Axis.horizontal,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10),
                                    child: CustomTrendingMovieCardMobile(
                                      width:
                                          MediaQuery.of(context).size.width / 2,
                                      height: 220,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10),
                                    child: CustomTrendingMovieCardMobile(
                                      width:
                                          MediaQuery.of(context).size.width / 2,
                                      height: 220,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10),
                                    child: CustomTrendingMovieCardMobile(
                                      width:
                                          MediaQuery.of(context).size.width / 2,
                                      height: 220,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10),
                                    child: CustomTrendingMovieCardMobile(
                                      width:
                                          MediaQuery.of(context).size.width / 2,
                                      height: 220,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10),
                                    child: CustomTrendingMovieCardMobile(
                                      width:
                                          MediaQuery.of(context).size.width / 2,
                                      height: 220,
                                    ),
                                  ),
                                ],
                              );
                            },
                          ),
                        )),
                    //progress bar
                    Positioned(
                      left: 0,
                      right: 0,
                      top: 770,
                      child: Padding(
                        padding:
                            const EdgeInsets.only(left: 15, right: 15, top: 10),
                        child: StepProgressIndicator(
                          totalSteps: 4,
                          currentStep: trendingSlideIndex + 1,
                          size: 4,
                          padding: 0,
                          selectedColor: AppColor.onHoveredColor,
                          unselectedColor: Colors.black,
                          roundedEdges: const Radius.circular(10),
                        ),
                      ),
                    ),
                    //forward and back button
                    screenWidth >= 1080
                        ? Positioned(
                            right: 20,
                            top: 555,
                            child: CustomBackAndNextButtonTrendingNow(
                              onNextButtonTapped: () {
                                setState(() {
                                  trendingController.animateToPage(
                                      ++trendingSlideIndex,
                                      duration:
                                          const Duration(milliseconds: 300),
                                      curve: Curves.linear);
                                });
                              },
                              onBackButtonTapped: () {
                                setState(() {
                                  trendingController.animateToPage(
                                      --trendingSlideIndex,
                                      duration:
                                          const Duration(milliseconds: 300),
                                      curve: Curves.linear);
                                });
                              },
                              currentIndex: trendingSlideIndex,
                            ))
                        : const SizedBox(),
                  ],
                ),
                // recommended part
                const RecommendedPartTablet(),
                // lastest movies
                const LatestMoviesPartTablet(),
                // lastest movie show
                const LatestTvShowPartTablet(),
                // top 10
                const Top10PartTablet(),
                // recently updated
                const RecentlyUpdatedPartTablet(),
                const SizedBox(
                  height: 30,
                )
              ],
            ),
          ),
        ));
  }
}
