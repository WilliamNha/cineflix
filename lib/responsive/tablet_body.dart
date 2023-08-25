import 'package:cineflix/constants/app_color.dart';
import 'package:cineflix/widgets/global/custom_trending_now_title.dart';
import 'package:cineflix/widgets/home/desktop/app_bar_row_tablet.dart';
import 'package:cineflix/widgets/home/tablet/movie_header_tablet.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';

class TabletBody extends StatefulWidget {
  const TabletBody({super.key});

  @override
  State<TabletBody> createState() => _TabletBodyState();
}

class _TabletBodyState extends State<TabletBody> {
  bool isLeftButtonHovered = false;
  bool isRightButtonHovered = false;
  int pageCurrentIndex = 0;
  int trendingSlideIndex = 1;
  @override
  Widget build(BuildContext context) {
    //850 change layout
    final PageController movieHeaderController = PageController();
    ScrollController controller = ScrollController();

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
                      color: Colors.yellow,
                      width: double.infinity,
                      height: 760,
                      child: PageView(
                        onPageChanged: (index) {
                          setState(() {
                            trendingSlideIndex = index + 1;
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
                        top: 440,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            InkWell(
                              splashColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: pageCurrentIndex == 0
                                  ? null
                                  : () {
                                      movieHeaderController.animateToPage(
                                          --pageCurrentIndex,
                                          duration:
                                              const Duration(milliseconds: 300),
                                          curve: Curves.linear);
                                    },
                              onHover: (isHovered) {
                                setState(() {
                                  isLeftButtonHovered = isHovered;
                                });
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                    color: isLeftButtonHovered
                                        ? AppColor.onHoveredColor
                                        : Colors.white.withOpacity(0.2),
                                    borderRadius: BorderRadius.circular(4)),
                                // width: 500,
                                padding: const EdgeInsets.all(2),

                                child: const Center(
                                    child: Icon(
                                  Icons.keyboard_arrow_left,
                                  size: 30,
                                )),
                              ),
                            ),
                            const SizedBox(
                              width: 8,
                            ),
                            InkWell(
                              splashColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: pageCurrentIndex == 3
                                  ? null
                                  : () {
                                      movieHeaderController.animateToPage(
                                          ++pageCurrentIndex,
                                          duration:
                                              const Duration(milliseconds: 300),
                                          curve: Curves.linear);
                                    },
                              onHover: (isHovered) {
                                setState(() {
                                  isRightButtonHovered = isHovered;
                                });
                              },
                              child: Container(
                                // width: 500,
                                padding: const EdgeInsets.all(2),
                                decoration: BoxDecoration(
                                    color: isRightButtonHovered
                                        ? AppColor.onHoveredColor
                                        : Colors.white.withOpacity(0.2),
                                    borderRadius: BorderRadius.circular(4)),
                                child: const Center(
                                    child: Icon(
                                  Icons.keyboard_arrow_right,
                                  size: 30,
                                )),
                              ),
                            ),
                            const SizedBox(
                              width: 15,
                            ),
                          ],
                        )),
                    //  progress bar
                    Positioned(
                      left: 0,
                      top: 500,
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width,
                        child: Padding(
                          padding: const EdgeInsets.only(
                            left: 15,
                            right: 15,
                          ),
                          child: StepProgressIndicator(
                            totalSteps: 4,
                            currentStep: trendingSlideIndex,
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
                      top: 520,
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width,
                        child: const Center(child: CustomTrendingNowTitle()),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ));
  }
}
