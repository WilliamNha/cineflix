import 'package:cineflix/constants/app_color.dart';
import 'package:cineflix/constants/app_constants.dart';
import 'package:flutter/material.dart';

class CustomTrendingMovieCardMobile extends StatefulWidget {
  const CustomTrendingMovieCardMobile({
    super.key,
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
      onTap: () {},
      child: Stack(
        children: [
          Container(
            height: 170,
            width: double.infinity,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: Colors.red,
                image: const DecorationImage(
                    image: AssetImage('images/spider-man.png'),
                    fit: BoxFit.cover)),
            margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
          ),
          Positioned(
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: Colors.black26),
              height: 170,
              width: double.infinity,
              margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
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
              height: 170,
              width: double.infinity,
              margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
            ),
          ),
          Positioned.fill(
            child: Container(
              height: 170,
              width: double.infinity,
              margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              child: Padding(
                padding: const EdgeInsets.only(left: 20, bottom: 10),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      const Text(
                        'SPIDER-MAN: ACCROSS THE SPIDER-VERSE',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            fontFamily: hanlyFont),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 15),
                            child: Text(
                              'Animation',
                              style: TextStyle(
                                  color: AppColor.onHoveredColor,
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 15),
                            child: Text(
                              'Comedy',
                              style: TextStyle(
                                  color: AppColor.onHoveredColor,
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 15),
                            child: Text(
                              'Adventure',
                              style: TextStyle(
                                  color: AppColor.onHoveredColor,
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                    ]),
              ),
            ),
          ),
          isOnHovered
              ? Positioned.fill(
                  child: Container(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
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
