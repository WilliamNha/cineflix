import 'package:cineflix/constants/app_color.dart';
import 'package:cineflix/widgets/global/custom_movie_card_long.dart';
import 'package:cineflix/widgets/global/custom_section_title.dart';
import 'package:cineflix/widgets/home/mobile/app_bar_row_mobile.dart';
import 'package:cineflix/widgets/home/mobile/latest_movies_part_mobile.dart';
import 'package:cineflix/widgets/home/mobile/movie_header_mobile.dart';
import 'package:cineflix/widgets/home/mobile/recently_updated_part_mobile.dart';
import 'package:cineflix/widgets/home/mobile/recommended_part_mobile.dart';
import 'package:cineflix/widgets/home/mobile/top_10_part_mobile.dart';
import 'package:cineflix/widgets/home/mobile/trending_now_part_mobile.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class MobileBody extends StatefulWidget {
  const MobileBody({super.key});

  @override
  State<MobileBody> createState() => _MobileBodyState();
}

class _MobileBodyState extends State<MobileBody> {
  final PageController movieHeaderController = PageController();
  final ScrollController _controller = ScrollController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColor.backgroundColor,
        body: RawScrollbar(
          controller: _controller,
          thumbVisibility: true,
          thumbColor: AppColor.onHoveredColor,
          radius: const Radius.circular(4),
          thickness: 8,
          // controller: yourScrollController,
          trackVisibility: true,
          child: SingleChildScrollView(
            controller: _controller,
            child:
                Column(mainAxisAlignment: MainAxisAlignment.start, children: [
              // movie slider part
              Stack(
                children: [
                  SizedBox(
                    width: double.infinity,
                    height: MediaQuery.of(context).size.height / 1.7,
                    child: PageView(
                      scrollBehavior: ScrollConfiguration.of(context).copyWith(
                        dragDevices: {
                          PointerDeviceKind.touch,
                          PointerDeviceKind.mouse,
                          PointerDeviceKind.trackpad,
                        },
                      ),
                      controller: movieHeaderController,
                      scrollDirection: Axis.horizontal,
                      children: const [
                        MovieHeadMobile(),
                        MovieHeadMobile(),
                        MovieHeadMobile(),
                      ],
                    ),
                  ),
                  const Positioned.fill(
                    top: 20,
                    left: 20,
                    child: AppBarRowMobile(),
                  )
                ],
              ),
              // trending now part
              const TrendingNowPartMobile(),
              // recommended part
              const RecommendedPartMobile(),
              // latest movie
              const LatestMoviesPartMobile(),
              // top 10
              const Top10PartMobile(),
              // recently updated
              const RecentlyUpdatedPartMobile(),
              const SizedBox(
                height: 30,
              )
            ]),
          ),
        ));
  }
}
