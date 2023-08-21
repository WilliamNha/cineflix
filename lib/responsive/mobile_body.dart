import 'package:cineflix/widgets/home/mobile/app_bar_row_mobile.dart';
import 'package:cineflix/widgets/home/mobile/movie_header_mobile.dart';
import 'package:cineflix/widgets/home/mobile/recommended_part_mobile.dart';
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: SingleChildScrollView(
          child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
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
            const RecommendedPartMobile()
          ]),
        ));
  }
}
