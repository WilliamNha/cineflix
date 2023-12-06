import 'package:cineflix/constants/app_color.dart';
import 'package:cineflix/widgets/global/custom_movie_title_detail_row.dart';
import 'package:cineflix/widgets/global/custom_select_server_button.dart';
import 'package:cineflix/widgets/home/desktop/app_bar_row_desktop.dart';
import 'package:flutter/material.dart';

class MovieDetailDesktopBody extends StatefulWidget {
  const MovieDetailDesktopBody({super.key});

  @override
  State<MovieDetailDesktopBody> createState() => _MovieDetailDesktopBodyState();
}

class _MovieDetailDesktopBodyState extends State<MovieDetailDesktopBody> {
  bool isPlayButtonHover = false;
  int serverSelectedIndex = 0;
  ScrollController controller = ScrollController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff181818),
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
                  //appbar part
                  _buildAppBarPart(),
                  //play movie part
                  _buildMoviePlayPart(),
                  //choose server part
                  _buildChooseServerPart(),
                  //movie detail part
                  _buildMovieDetailPart(),
                  const SizedBox(
                    height: 20,
                  )
                ],
              ))),
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

  _buildMoviePlayPart() {
    return Stack(
      children: [
        Container(
          decoration: const BoxDecoration(
            color: Colors.white,
          ),
          width: MediaQuery.of(context).size.width,
          height: 450,
          child: Image.asset(
            'assets/images/monarch2.jpeg',
            fit: BoxFit.cover,
          ),
        ),
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            gradient: LinearGradient(
              colors: [
                const Color(0xff181818),
                const Color(0xff181818).withOpacity(0.2),
              ],
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
              stops: const [0, 0.2],
            ),
          ),
          width: MediaQuery.of(context).size.width,
          height: 450,
        ),
        Positioned(
          top: 180,
          left: MediaQuery.of(context).size.width / 2.1,
          child: InkWell(
            onTap: () {},
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
    );
  }

  _buildChooseServerPart() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.only(top: 60, bottom: 10),
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

  _buildMovieDetailPart() {
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
                  image: const DecorationImage(
                      image: AssetImage('assets/images/monarch1.jpeg'),
                      fit: BoxFit.cover),
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8)),
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Freelance",
                    style: TextStyle(
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
                          child: const Center(
                            child: Text(
                              'PG-13',
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
                              style:
                                  TextStyle(color: Colors.white, fontSize: 14),
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
                          children: const [
                            Text(
                              '116 min',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 14),
                            )
                          ],
                        ),
                        const SizedBox(
                          width: 12,
                        ),
                      ],
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(bottom: 20),
                    child: Text(
                      "An ex-special forces operative takes a job to provide security for a journalist as she interviews a dictator, but when a military coup breaks out in the middle of the interview, they are forced to escape into the jungle.",
                      style: TextStyle(
                          color: Colors.grey, fontSize: 14, height: 1.5),
                    ),
                  ),
                  const CustomMovieTitleDetailRow(
                    leftTitle: "Type: ",
                    rightDetail: "Movie",
                  ),
                  const CustomMovieTitleDetailRow(
                    leftTitle: "Country: ",
                    rightDetail: "United States",
                  ),
                  const CustomMovieTitleDetailRow(
                    leftTitle: "Genre: ",
                    rightDetail: "Comedy, Action",
                  ),
                  const CustomMovieTitleDetailRow(
                    leftTitle: "Release: ",
                    rightDetail: "Oct 27, 2023",
                  ),
                  const CustomMovieTitleDetailRow(
                    leftTitle: "Director: ",
                    rightDetail: "Pierre Morel",
                  ),
                  const CustomMovieTitleDetailRow(
                    leftTitle: "Production: ",
                    rightDetail:
                        "AGC Studios, Endurance Media, Sentient Entertainment",
                  ),
                  const CustomMovieTitleDetailRow(
                    leftTitle: "Cast: ",
                    rightDetail: "John Cena, Alison Brie, Juan Pablo Raba",
                  )
                ],
              ),
            ),
            Container(
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
                        style: TextStyle(color: Colors.grey, fontSize: 14),
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
          ]),
    );
  }
}
