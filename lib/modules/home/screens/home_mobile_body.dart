import 'package:cineflix/constants/app_color.dart';
import 'package:cineflix/modules/home/bloc/home_bloc.dart';
import 'package:cineflix/widgets/home/mobile/app_bar_row_mobile.dart';
import 'package:cineflix/widgets/home/mobile/latest_movies_part_mobile.dart';
import 'package:cineflix/widgets/home/mobile/movie_header_mobile.dart';
import 'package:cineflix/widgets/home/mobile/recommended_part_mobile.dart';
import 'package:cineflix/widgets/home/mobile/top_10_part_mobile.dart';
import 'package:cineflix/widgets/home/mobile/trending_now_part_mobile.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeMobileBody extends StatefulWidget {
  const HomeMobileBody({super.key});

  @override
  State<HomeMobileBody> createState() => _HomeMobileBodyState();
}

class _HomeMobileBodyState extends State<HomeMobileBody> {
  final PageController movieHeaderController = PageController();
  final ScrollController _controller = ScrollController();
  final homeBloc = HomeBloc();

  @override
  void initState() {
    homeBloc.add(HomeInitialFetchMovieEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColor.backgroundColor,
        body: BlocConsumer<HomeBloc, HomeState>(
          bloc: homeBloc,
          listenWhen: (previous, current) => current is HomeActionState,
          buildWhen: (previous, current) => current is! HomeActionState,
          listener: (context, state) {},
          builder: (context, state) {
            if (state is HomeLoadingState) {
              return Container(
                width: double.infinity,
                height: double.infinity,
                color: Colors.black,
              );
            } else if (state is HomeMovieLoadedSuccessState) {
              final successState = state;
              final movieList = successState.movieList;
              return RawScrollbar(
                controller: _controller,
                thumbVisibility: true,
                thumbColor: AppColor.onHoveredColor,
                radius: const Radius.circular(4),
                thickness: 8,
                // controller: yourScrollController,
                trackVisibility: true,
                child: SingleChildScrollView(
                  controller: _controller,
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        // movie slider part
                        Stack(
                          children: [
                            SizedBox(
                              width: double.infinity,
                              height: MediaQuery.of(context).size.height / 1.7,
                              child: PageView(
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
                                children: [
                                  for (var index = 0; index < 5; index++)
                                    MovieHeadMobile(
                                      movieData: movieList[index],
                                    ),
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
                        TrendingNowPartMobile(
                          movieList: movieList.reversed.toList(),
                        ),
                        // recommended part
                        RecommendedPartMobile(
                          movieList: movieList,
                        ),
                        // latest movie
                        LatestMoviesPartMobile(
                          movieList: movieList.reversed.toList(),
                        ),
                        // top 10
                        Top10PartMobile(
                          movieList: movieList,
                        ),
                        // recently updated
                        // const RecentlyUpdatedPartMobile(),
                        const SizedBox(
                          height: 30,
                        )
                      ]),
                ),
              );
            } else {
              return Container();
            }
          },
        ));
  }
}
