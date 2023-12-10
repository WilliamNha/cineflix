import 'package:chewie/chewie.dart';
import 'package:cineflix/constants/app_color.dart';
import 'package:cineflix/constants/app_constants.dart';
import 'package:cineflix/modules/home/models/movie_model.dart';
import 'package:cineflix/modules/movie_detail/bloc/movie_detail_bloc.dart';
import 'package:cineflix/widgets/global/custom_movie_title_detail_row.dart';
import 'package:cineflix/widgets/global/custom_select_server_button.dart';
import 'package:cineflix/widgets/home/desktop/app_bar_row_desktop.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:video_player/video_player.dart';

class MovieDetailTabletBody extends StatefulWidget {
  final String movieID;
  const MovieDetailTabletBody({super.key, required this.movieID});

  @override
  State<MovieDetailTabletBody> createState() => _MovieDetailTabletBodyState();
}

class _MovieDetailTabletBodyState extends State<MovieDetailTabletBody> {
  bool playButtonClicked = false;
  final movieDetailBloc = MovieDetailBloc();
  bool isPlayButtonHover = false;
  int serverSelectedIndex = 0;
  ScrollController controller = ScrollController();
  VideoPlayerController? videoController;
  ChewieController? chewieController;

  @override
  void initState() {
    movieDetailBloc.add(MovieDetailFetchMovieEvent(movieID: widget.movieID));
    super.initState();
  }

  @override
  void dispose() {
    if (videoController!.value.isPlaying) videoController!.pause();

    if (chewieController!.videoPlayerController.value.isPlaying) {
      chewieController!.videoPlayerController.pause();
    }
    videoController = null;
    chewieController = null;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: const Color(0xff181818),
      body: BlocConsumer<MovieDetailBloc, MovieDetailState>(
        bloc: movieDetailBloc,
        listener: (context, state) {},
        builder: (context, state) {
          if (state is MovieDetailLoadingState) {
            return Container(
              color: Colors.black,
              width: double.infinity,
              height: double.infinity,
            );
          } else if (state is MovieDetailLoadedSuccessState) {
            final movieData = state.movieData;
            // ignore: deprecated_member_use

            videoController = VideoPlayerController.network(
                "${AppConstant.baseUrl}/uploads/${movieData.video}");
            videoController!.initialize();
            chewieController = ChewieController(
              videoPlayerController: videoController!,
              autoPlay: false,
              looping: false,
              aspectRatio: 16 / 9,
            );

            return RawScrollbar(
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
                        //appbar part
                        _buildAppBarPart(),
                        //play movie part
                        Stack(
                          children: [
                            playButtonClicked == true
                                ? AspectRatio(
                                    aspectRatio: 16 / 9,
                                    child:
                                        Chewie(controller: chewieController!))
                                : Container(
                                    decoration: const BoxDecoration(
                                      color: Colors.white,
                                    ),
                                    width: MediaQuery.of(context).size.width,
                                    height: 350,
                                    child: Image.network(
                                      "${AppConstant.baseUrl}/uploads/${movieData.imageBanner}",
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                            playButtonClicked == true
                                ? const SizedBox()
                                : Container(
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      gradient: LinearGradient(
                                        colors: [
                                          const Color(0xff181818),
                                          const Color(0xff181818)
                                              .withOpacity(0.2),
                                        ],
                                        begin: Alignment.bottomCenter,
                                        end: Alignment.topCenter,
                                        stops: const [0, 0.2],
                                      ),
                                    ),
                                    width: MediaQuery.of(context).size.width,
                                    height: 350,
                                  ),
                            playButtonClicked == true
                                ? const SizedBox()
                                : Positioned(
                                    top: 150,
                                    left:
                                        MediaQuery.of(context).size.width / 2.1,
                                    child: InkWell(
                                      onTap: () {
                                        setState(() {
                                          playButtonClicked = true;
                                        });
                                        Future.delayed(
                                            const Duration(milliseconds: 500),
                                            () {
                                          chewieController!.play();
                                        });
                                      },
                                      onHover: (value) {
                                        setState(() {
                                          isPlayButtonHover = value;
                                        });
                                      },
                                      child: Container(
                                        width: 60,
                                        height: 60,
                                        decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: isPlayButtonHover
                                                ? AppColor.onHoveredColor
                                                : AppColor.primaryColor),
                                        child: const Center(
                                          child: Icon(
                                            Icons.play_arrow_rounded,
                                            color: Colors.black,
                                            size: 45,
                                          ),
                                        ),
                                      ),
                                    ),
                                  )
                          ],
                        ),
                        //choose server part
                        _buildChooseServerPart(),
                        //movie file part if screenwith>1200
                        screenWidth > 1200
                            ? const SizedBox()
                            : Container(
                                margin: const EdgeInsets.only(
                                    right: 20, left: 20, bottom: 40),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      color: Colors.black,
                                      width: MediaQuery.of(context).size.width,
                                      height: 40,
                                      child: const Center(
                                        child: Text(
                                          "Movie Files",
                                          style: TextStyle(
                                              color: Colors.grey, fontSize: 14),
                                        ),
                                      ),
                                    ),
                                    Container(
                                      width: MediaQuery.of(context).size.width,
                                      height: 30,
                                      color: AppColor.primaryColor,
                                      child: const Align(
                                          alignment: Alignment.centerLeft,
                                          child: Padding(
                                            padding: EdgeInsets.only(left: 20),
                                            child: Text(
                                              "Movie 1",
                                              style: TextStyle(
                                                fontSize: 12,
                                              ),
                                            ),
                                          )),
                                    )
                                  ],
                                ),
                              ),
                        //movie detail part
                        _buildMovieDetailPart(screenWidth, movieData),
                        const SizedBox(
                          height: 20,
                        )
                      ],
                    )));
          } else {
            return Container(
              color: Colors.black,
              width: double.infinity,
              height: double.infinity,
              child: const Center(
                  child: Text(
                "Something went wrong...",
                style: TextStyle(fontSize: 24, color: Colors.white),
              )),
            );
          }
        },
      ),
    );
  }

  _buildAppBarPart() {
    return Container(
      color: Colors.black,
      child: const Padding(
        padding: EdgeInsets.only(left: 20, top: 20, bottom: 20),
        child: AppBarRowDesktop(
          isInMovieDetail: true,
        ),
      ),
    );
  }

  _buildChooseServerPart() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.only(top: 40, bottom: 10),
          child: Center(
              child: Text(
            "If current server doesn't work please try other server below.",
            style: TextStyle(color: Color(0xff888888)),
          )),
        ),
        Center(
          child: Container(
              decoration: BoxDecoration(
                  color: Colors.black, borderRadius: BorderRadius.circular(20)),
              child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CustomSelectServerButton(
                      onTap: () {
                        setState(() {
                          serverSelectedIndex = 0;
                        });
                      },
                      isSelected: serverSelectedIndex == 0,
                      title: "Vidplay",
                    ),
                    CustomSelectServerButton(
                      onTap: () {
                        setState(() {
                          serverSelectedIndex = 1;
                        });
                      },
                      isSelected: serverSelectedIndex == 1,
                      title: "MyCloud",
                    ),
                    CustomSelectServerButton(
                      onTap: () {
                        setState(() {
                          serverSelectedIndex = 2;
                        });
                      },
                      isSelected: serverSelectedIndex == 2,
                      title: "Filemoon",
                    )
                  ])),
        ),
        const SizedBox(
          height: 50,
        )
      ],
    );
  }

  _buildMovieDetailPart(double screenWidth, MovieModel movieData) {
    return SizedBox(
      width: double.infinity,
      child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: const EdgeInsets.only(left: 20, right: 20),
              width: 200,
              height: 280,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(
                          '${AppConstant.baseUrl}/uploads/${movieData.image}'),
                      fit: BoxFit.cover),
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8)),
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    movieData.name!,
                    style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 34),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 15, bottom: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
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
                          children: [
                            const Icon(
                              Icons.star,
                              color: Colors.white,
                              size: 16,
                            ),
                            const SizedBox(
                              width: 2,
                            ),
                            Text(
                              movieData.rating!,
                              style: const TextStyle(
                                  color: Colors.white, fontSize: 14),
                            )
                          ],
                        ),
                        const SizedBox(
                          width: 12,
                        ),
                        const Text(
                          '2023',
                          style: TextStyle(color: Colors.white, fontSize: 14),
                        ),
                        const SizedBox(
                          width: 12,
                        ),
                        Row(
                          children: [
                            Text(
                              '${movieData.duration} min',
                              style: const TextStyle(
                                  color: Colors.white, fontSize: 14),
                            )
                          ],
                        ),
                        const SizedBox(
                          width: 12,
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 20, right: 20),
                    child: Text(
                      movieData.description!,
                      style: const TextStyle(
                          color: Colors.grey, fontSize: 14, height: 1.5),
                    ),
                  ),
                  CustomMovieTitleDetailRow(
                    leftTitle: "Type: ",
                    rightDetail: movieData.type!,
                  ),
                  CustomMovieTitleDetailRow(
                    leftTitle: "Country: ",
                    rightDetail: movieData.country!,
                  ),
                  CustomMovieTitleDetailRow(
                    leftTitle: "Genre: ",
                    rightDetail: movieData.genre![0].name!,
                  ),
                  CustomMovieTitleDetailRow(
                    leftTitle: "Release: ",
                    rightDetail: movieData.release!,
                  ),
                  CustomMovieTitleDetailRow(
                    leftTitle: "Director: ",
                    rightDetail: movieData.director!,
                  ),
                  CustomMovieTitleDetailRow(
                    leftTitle: "Production: ",
                    rightDetail: movieData.production!,
                  ),
                  CustomMovieTitleDetailRow(
                    leftTitle: "Cast: ",
                    rightDetail: movieData.cast!,
                  )
                ],
              ),
            ),
            screenWidth > 1200
                ? Container(
                    margin: const EdgeInsets.only(right: 20, left: 40),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          color: Colors.black,
                          width: 300,
                          height: 40,
                          child: const Center(
                            child: Text(
                              "Movie Files",
                              style:
                                  TextStyle(color: Colors.grey, fontSize: 14),
                            ),
                          ),
                        ),
                        Container(
                          width: 300,
                          height: 30,
                          color: AppColor.primaryColor,
                          child: const Align(
                              alignment: Alignment.centerLeft,
                              child: Padding(
                                padding: EdgeInsets.only(left: 20),
                                child: Text(
                                  "Movie 1",
                                  style: TextStyle(
                                    fontSize: 12,
                                  ),
                                ),
                              )),
                        )
                      ],
                    ),
                  )
                : const SizedBox(
                    width: 20,
                  )
          ]),
    );
  }
}
