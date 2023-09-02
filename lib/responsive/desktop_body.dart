import 'package:cineflix/constants/app_color.dart';
import 'package:cineflix/widgets/global/custom_back_and_next_button_movie_slider.dart';
import 'package:cineflix/widgets/global/custom_back_and_next_button_trending_now.dart';
import 'package:cineflix/widgets/global/custom_trending_now_title.dart';
import 'package:cineflix/widgets/home/desktop/app_bar_row_desktop.dart';
import 'package:cineflix/widgets/home/desktop/custom_top_10_part_desktop.dart';
import 'package:cineflix/widgets/home/desktop/latest_movies_part_desktop.dart';
import 'package:cineflix/widgets/home/desktop/latest_tv_show_part_desktop.dart';
import 'package:cineflix/widgets/home/desktop/movie_header_desktop.dart';
import 'package:cineflix/widgets/home/desktop/recently_updated_desktop.dart';
import 'package:cineflix/widgets/home/desktop/recommended_part_desktop.dart';
import 'package:cineflix/widgets/home/mobile/custom_trending_movie_card_mobile.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';

class DesktopBody extends StatefulWidget {
  const DesktopBody({super.key});

  @override
  State<DesktopBody> createState() => _DesktopBodyState();
}

class _DesktopBodyState extends State<DesktopBody> {
  int pageCurrentIndex = 0;
  int trendingSlideIndex = 0;
  var trendingController = PageController(viewportFraction: 1 / 3);
  PageController movieHeaderController = PageController();
  ScrollController controller = ScrollController();

  @override
  Widget build(BuildContext context) {
    // final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
        backgroundColor: const Color(0xff181818),
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
                      height: 980,
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
                          MovieHeadDesktop(),
                          MovieHeadDesktop(),
                          MovieHeadDesktop(),
                          MovieHeadDesktop(),
                        ],
                      ),
                    ),
                    const Positioned.fill(
                      top: 20,
                      left: 20,
                      child: AppBarRowDesktop(),
                    ),
                    // forward and back button
                    Positioned(
                        right: 20,
                        top: 580,
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
                      top: 650,
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
                      top: 680,
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width,
                        child: const Center(child: CustomTrendingNowTitle()),
                      ),
                    ),
                    //trending image slider
                    Positioned(
                        right: 0,
                        left: 0,
                        top: 720,
                        child: Container(
                          // color: Colors.red,
                          margin: const EdgeInsets.only(left: 10, right: 50),
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
                                          MediaQuery.of(context).size.width / 3,
                                      height: 220,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10),
                                    child: CustomTrendingMovieCardMobile(
                                      width:
                                          MediaQuery.of(context).size.width / 3,
                                      height: 220,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10),
                                    child: CustomTrendingMovieCardMobile(
                                      width:
                                          MediaQuery.of(context).size.width / 3,
                                      height: 220,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10),
                                    child: CustomTrendingMovieCardMobile(
                                      width:
                                          MediaQuery.of(context).size.width / 3,
                                      height: 220,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10),
                                    child: CustomTrendingMovieCardMobile(
                                      width:
                                          MediaQuery.of(context).size.width / 3,
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
                      top: 950,
                      child: Padding(
                        padding:
                            const EdgeInsets.only(left: 15, right: 15, top: 10),
                        child: StepProgressIndicator(
                          totalSteps: 3,
                          currentStep: trendingSlideIndex + 1,
                          size: 4,
                          padding: 0,
                          selectedColor: AppColor.onHoveredColor,
                          unselectedColor: Colors.black,
                          roundedEdges: const Radius.circular(10),
                        ),
                      ),
                    ),
                    //forward and back button trending now
                    Positioned(
                        right: 20,
                        top: 725,
                        child: CustomBackAndNextButtonTrendingNow(
                          maxIndex: 2,
                          onNextButtonTapped: () {
                            setState(() {
                              trendingController.animateToPage(
                                  ++trendingSlideIndex,
                                  duration: const Duration(milliseconds: 300),
                                  curve: Curves.linear);
                            });
                          },
                          onBackButtonTapped: () {
                            setState(() {
                              trendingController.animateToPage(
                                  --trendingSlideIndex,
                                  duration: const Duration(milliseconds: 300),
                                  curve: Curves.linear);
                            });
                          },
                          currentIndex: trendingSlideIndex,
                        )),
                  ],
                ),

                const SizedBox(
                  height: 40,
                ),
                //recommended , top10, recently updated part
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  // height: 500,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // recommended part
                      Expanded(
                        flex: 5,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            RecommendedPartDesktop(),
                            // latest movies part
                            LatestMoviesPartDesktop(),
                            // latest tv show
                            LatestTvShowPartDesktop()
                          ],
                        ),
                      ),
                      //top10 part, recently upated
                      Expanded(
                        flex: 2,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Top10PartDesktop(),
                            RecentlyUpdatedDesktop()
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
              ],
            ),
          ),
        ));
  }
}
