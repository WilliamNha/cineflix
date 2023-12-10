import 'package:cineflix/constants/app_constants.dart';
import 'package:cineflix/modules/home/models/movie_model.dart';
import 'package:cineflix/widgets/global/custom_movie_card_long.dart';
import 'package:cineflix/widgets/global/custom_section_title.dart';
import 'package:flutter/material.dart';

class RecentlyUpdatedDesktop extends StatelessWidget {
  final List<MovieModel> movieList;
  const RecentlyUpdatedDesktop({
    required this.movieList,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 15, top: 30, bottom: 20),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: const [
              CustomSectionTitle(
                buttonIconWidth: 16,
                titleTextSize: 26,
                title: 'RECENTLY UPDATED',
              ),
              SizedBox(
                width: 15,
              ),
            ],
          ),
        ),
        for (var i = 0; i < 6; i++)
          Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: CustomMovieCardLong(
              movieID: movieList[i].sId!,
              number: i + 1,
              duration: movieList[i].duration!,
              year: movieList[i].release!.split(",")[1].replaceAll(" ", ''),
              type: movieList[i].type!,
              name: movieList[i].name!,
              image: "${AppConstant.baseUrl}/uploads/${movieList[i].image}",
              isHasCircleNumber: true,
            ),
          ),

        //   for (var i = 0; i < movieList.length; i++)
        // Padding(
        //   padding: const EdgeInsets.only(bottom: 10),
        //   child: CustomMovieCardLong(
        //     number: i + 1,
        //     duration: movieList[i].duration!,
        //     year: movieList[i].release!.split(",")[1].replaceAll(" ", ''),
        //     type: movieList[i].type!,
        //     name: movieList[i].name!,
        //     image: "${AppConstant.baseUrl}/uploads/${movieList[i].image}",
        //     isHasCircleNumber: true,
        //   ),
        // ),
      ],
    );
  }
}
