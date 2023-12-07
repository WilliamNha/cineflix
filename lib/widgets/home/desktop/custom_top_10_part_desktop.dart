import 'package:cineflix/constants/app_constants.dart';
import 'package:cineflix/modules/home/models/movie_model.dart';
import 'package:cineflix/widgets/global/custom_movie_card_long.dart';
import 'package:cineflix/widgets/global/custom_movie_type_selection_button.dart';
import 'package:cineflix/widgets/global/custom_section_title.dart';
import 'package:flutter/material.dart';

class Top10PartDesktop extends StatefulWidget {
  final List<MovieModel> movieList;
  const Top10PartDesktop({
    required this.movieList,
    super.key,
  });

  @override
  State<Top10PartDesktop> createState() => _Top10PartDesktopState();
}

class _Top10PartDesktopState extends State<Top10PartDesktop> {
  int selectedMovieTypeIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 15, top: 20, bottom: 20),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const CustomSectionTitle(
                buttonIconWidth: 16,
                titleTextSize: 26,
                title: 'TOP10',
              ),
              const Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CustomMovieTypeSelectionButton(
                    titleSize: 16,
                    buttonText: 'Day',
                    isSelected: selectedMovieTypeIndex == 0,
                    onTap: () {
                      setState(() {
                        selectedMovieTypeIndex = 0;
                      });
                    },
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  CustomMovieTypeSelectionButton(
                    titleSize: 16,
                    buttonText: 'Week',
                    isSelected: selectedMovieTypeIndex == 1,
                    onTap: () {
                      setState(() {
                        selectedMovieTypeIndex = 1;
                      });
                    },
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  CustomMovieTypeSelectionButton(
                    titleSize: 16,
                    buttonText: 'Month',
                    isSelected: selectedMovieTypeIndex == 2,
                    onTap: () {
                      setState(() {
                        selectedMovieTypeIndex = 2;
                      });
                    },
                  ),
                ],
              ),
              const SizedBox(
                width: 15,
              ),
            ],
          ),
        ),
        for (var index = 0; index < widget.movieList.length; index++)
          Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: CustomMovieCardLong(
              number: index + 1,
              duration: widget.movieList[index].duration!,
              year: "2023",
              type: widget.movieList[index].type!,
              name: widget.movieList[index].name!,
              image:
                  "${AppConstant.baseUrl}/uploads/${widget.movieList[index].image}",
              isHasCircleNumber: true,
            ),
          ),
      ],
    );
  }
}
