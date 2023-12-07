import 'package:cineflix/constants/app_color.dart';
import 'package:cineflix/constants/app_constants.dart';
import 'package:cineflix/modules/home/models/movie_model.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CustomTrendingMovieCardMobile extends StatefulWidget {
  final MovieModel movieData;
  final double height;
  final double width;
  const CustomTrendingMovieCardMobile({
    required this.movieData,
    this.width = double.infinity,
    super.key,
    this.height = 170,
  });

  @override
  State<CustomTrendingMovieCardMobile> createState() =>
      _CustomTrendingMovieCardMobileState();
}

class _CustomTrendingMovieCardMobileState
    extends State<CustomTrendingMovieCardMobile> {
  bool isOnHovered = false;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      highlightColor: Colors.transparent,
      splashColor: Colors.transparent,
      onHover: (isHovered) {
        setState(() {
          isOnHovered = isHovered;
        });
      },
      onTap: () {
        context.go('/movie_detail');
      },
      child: Stack(
        children: [
          Container(
            height: widget.height,
            width: widget.width,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                image: DecorationImage(
                    image: NetworkImage(
                        '${AppConstant.baseUrl}/uploads/${widget.movieData.imageBanner}'),
                    fit: BoxFit.cover)),
            margin: const EdgeInsets.symmetric(vertical: 5),
          ),
          Positioned(
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: Colors.black26),
              height: widget.height,
              width: widget.width,
              margin: const EdgeInsets.symmetric(vertical: 5),
            ),
          ),
          Positioned(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                gradient: LinearGradient(
                  colors: [
                    Colors.black.withOpacity(0.8),
                    Colors.black.withOpacity(0.09),
                  ],
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  stops: const [0, 0.9],
                ),
              ),
              height: widget.height,
              width: widget.width,
              margin: const EdgeInsets.symmetric(vertical: 5),
            ),
          ),
          Positioned.fill(
            child: Container(
              height: widget.height,
              width: widget.width,
              margin: const EdgeInsets.symmetric(vertical: 10),
              child: Padding(
                padding: const EdgeInsets.only(left: 20, bottom: 10),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        widget.movieData.name!,
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            fontFamily: AppConstant.hanlyFont),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: widget.movieData.genre!
                            .map(
                              (e) => Padding(
                                padding: const EdgeInsets.only(right: 15),
                                child: Text(
                                  '${e.name}',
                                  style: TextStyle(
                                      color: AppColor.onHoveredColor,
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            )
                            .toList(),
                      ),
                    ]),
              ),
            ),
          ),
          isOnHovered
              ? Positioned.fill(
                  child: Container(
                  margin: const EdgeInsets.symmetric(vertical: 5),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      gradient: LinearGradient(
                        colors: [
                          AppColor.onHoveredColor.withOpacity(0.15),
                          AppColor.onHoveredColor.withOpacity(0.05),
                        ],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        stops: const [0, 0.7],
                      )),
                ))
              : const SizedBox()
        ],
      ),
    );
  }
}
