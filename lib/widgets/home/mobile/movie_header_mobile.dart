import 'package:cineflix/constants/app_color.dart';
import 'package:cineflix/constants/app_constants.dart';
import 'package:cineflix/modules/home/models/movie_model.dart';
import 'package:cineflix/widgets/global/custom_bookmark_button.dart';
import 'package:cineflix/widgets/global/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class MovieHeadMobile extends StatelessWidget {
  final MovieModel movieData;
  const MovieHeadMobile({
    required this.movieData,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: double.infinity,
          height: MediaQuery.of(context).size.height / 1.7,
          decoration: const BoxDecoration(),
          child: Image.network(
            "${AppConstant.baseUrl}/uploads/${movieData.image}",
            fit: BoxFit.cover,
          ),
        ),
        //dark graient color
        Positioned(
          top: 0,
          left: 0,
          child: Container(
            width: MediaQuery.of(context).size.width / 1,
            height: MediaQuery.of(context).size.height / 1.7,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Colors.black.withOpacity(1),
                  Colors.black.withOpacity(0.09),
                ],
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                stops: const [0, 0.6],
              ),
            ),
          ),
        ),
        Positioned(
          top: 0,
          left: 0,
          child: Container(
            width: MediaQuery.of(context).size.width / 1,
            height: MediaQuery.of(context).size.height / 1.7,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Colors.black.withOpacity(0.75),
                  Colors.black.withOpacity(0.09),
                ],
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
                stops: const [0, 0.6],
              ),
            ),
          ),
        ),
        Positioned.fill(
            bottom: 0,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  movieData.name!,
                  style: const TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      fontFamily: AppConstant.hanlyFont),
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 14, vertical: 3),
                      decoration: BoxDecoration(
                          color: AppColor.primaryColor,
                          borderRadius: BorderRadius.circular(12)),
                      child: const Center(
                        child: Text(
                          'HD',
                          style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 14, vertical: 3),
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.white, width: 1),
                          color: Colors.transparent,
                          borderRadius: BorderRadius.circular(12)),
                      child: Center(
                        child: Text(
                          movieData.ratingType!,
                          style: const TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Row(
                      children: const [
                        Icon(
                          Icons.star,
                          color: Colors.white,
                          size: 16,
                        ),
                        SizedBox(
                          width: 2,
                        ),
                        Text(
                          '4',
                          style: TextStyle(color: Colors.white, fontSize: 12),
                        )
                      ],
                    ),
                    const SizedBox(
                      width: 12,
                    ),
                    Text(
                      movieData.release!.split(",")[1].replaceAll(" ", ""),
                      style: const TextStyle(color: Colors.white, fontSize: 12),
                    ),
                    const SizedBox(
                      width: 12,
                    ),
                    Row(
                      children: [
                        Text(
                          '${movieData.duration} min',
                          style: const TextStyle(
                              color: Colors.white, fontSize: 12),
                        )
                      ],
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: movieData.genre!.map((e) {
                      return Padding(
                        padding: EdgeInsets.only(right: 10),
                        child: Text(
                          e.name.toString(),
                          style: TextStyle(fontSize: 14, color: Colors.white),
                        ),
                      );
                    }).toList()),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const SizedBox(
                      width: 15,
                    ),
                    CustomWatchNowButton(
                      onTap: () {
                        context.go('/movie_detail');
                      },
                    ),
                    const CustomBookmarkButton(),
                    const SizedBox(
                      width: 20,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
              ],
            ))
      ],
    );
  }
}
