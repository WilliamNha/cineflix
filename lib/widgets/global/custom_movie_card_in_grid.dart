import 'package:cineflix/constants/app_color.dart';
import 'package:cineflix/widgets/global/custom_button.dart';
import 'package:dotted_border/dotted_border.dart';

import 'package:flutter/material.dart';

class CustomMovieCardInGrid extends StatefulWidget {
  final String movieTitle;
  final String imageUrl;
  const CustomMovieCardInGrid({
    required this.movieTitle,
    required this.imageUrl,
    super.key,
  });

  @override
  State<CustomMovieCardInGrid> createState() => _CustomMovieCardInGridState();
}

class _CustomMovieCardInGridState extends State<CustomMovieCardInGrid> {
  final layerLink = LayerLink();
  bool isDetailBannerOnHovered = false;
  bool isOnHovered = false;
  OverlayEntry? entry;
  GlobalKey key = GlobalKey();
  @override
  void initState() {
    super.initState();
  }

  void showOverlay() {
    final overlay = Overlay.of(context);
    final renderBox = key.currentContext!.findRenderObject() as RenderBox;
    final size = renderBox.size;
    Offset offset = renderBox.localToGlobal(Offset.zero);

    entry = OverlayEntry(
        builder: (context) => Positioned(
            //update
            // top: offset.dy + (size.height / 3),
            // left: offset.dx + size.width + 20,
            child: CompositedTransformFollower(
                offset: Offset(size.width + 8, size.height - size.height / 1.4),
                showWhenUnlinked: false,
                link: layerLink,
                child: buildOverlay())));
    overlay.insert(entry!);
  }

  Widget buildOverlay() => Material(
        type: MaterialType.transparency,
        // child:
        // InkWell(
        //   splashColor: Colors.transparent,
        //   highlightColor: Colors.transparent,
        //   onTap: () {},
        //   onHover: (isHovered) {
        //     if (isHovered) {
        //       setState(() {
        //         isDetailBannerOnHovered = true;
        //       });
        //     } else {
        //       setState(() {
        //         isDetailBannerOnHovered = false;
        //       });
        //       Future.delayed(const Duration(milliseconds: 100), () {
        //         setState(() {
        //           entry!.remove();
        //         });
        //       });
        //     }
        //   },
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: const Color(0xff292929),
                ),
                width: 320,
                height: 320,
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding:
                            const EdgeInsets.only(left: 20, top: 20, right: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const Expanded(
                              child: Text(
                                'Blue Beetle',
                                style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            const SizedBox(
                              width: 15,
                            ),
                            DottedBorder(
                                borderType: BorderType.Circle,
                                color: Colors.white,
                                strokeWidth: 0.5,
                                child: Container(
                                  width: 20,
                                  height: 20,
                                  decoration: const BoxDecoration(
                                      shape: BoxShape.circle),
                                  child: const Center(
                                    child: Icon(
                                      Icons.add,
                                      color: Colors.white,
                                      size: 18,
                                    ),
                                  ),
                                ))
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 20, right: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 2),
                              decoration: BoxDecoration(
                                  color: AppColor.primaryColor,
                                  borderRadius: BorderRadius.circular(12)),
                              child: const Center(
                                child: Text(
                                  'HD',
                                  style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black),
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 2),
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      color: AppColor.primaryColor, width: 2),
                                  color: Colors.transparent,
                                  borderRadius: BorderRadius.circular(12)),
                              child: Center(
                                child: Text(
                                  'PG-13',
                                  style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold,
                                      color: AppColor.primaryColor),
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Text(
                              '2023',
                              style: TextStyle(
                                  color: AppColor.primaryColor, fontSize: 12),
                            ),
                            const SizedBox(
                              width: 6,
                            ),
                            Row(
                              children: [
                                Icon(
                                  Icons.star,
                                  color: AppColor.primaryColor,
                                  size: 16,
                                ),
                                const SizedBox(
                                  width: 2,
                                ),
                                Text(
                                  '4',
                                  style: TextStyle(
                                      color: AppColor.primaryColor,
                                      fontSize: 12),
                                )
                              ],
                            ),
                            const SizedBox(
                              width: 6,
                            ),
                            Row(
                              children: [
                                Text(
                                  '116 min',
                                  style: TextStyle(
                                      color: AppColor.primaryColor,
                                      fontSize: 12),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 15, bottom: 15),
                        child: Divider(
                          color: Colors.grey.withOpacity(0.4),
                          height: 1,
                        ),
                      ),
                      //country
                      Padding(
                        padding: const EdgeInsets.only(left: 20, bottom: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text(
                              'Country: ',
                              style: TextStyle(color: Colors.grey),
                            ),
                            Text(
                              'United States',
                              style: TextStyle(color: Colors.white),
                            )
                          ],
                        ),
                      ),
                      //genre
                      Padding(
                        padding: const EdgeInsets.only(left: 20, bottom: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text(
                              'Genre: ',
                              style: TextStyle(color: Colors.grey),
                            ),
                            Text(
                              'Action, Adventure, Sci-Fi',
                              style: TextStyle(color: Colors.white),
                            )
                          ],
                        ),
                      ),
                      //score
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 20,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text(
                              'Scores: ',
                              style: TextStyle(color: Colors.grey),
                            ),
                            Text(
                              '7.23 by 342 reviews',
                              style: TextStyle(color: Colors.grey),
                            )
                          ],
                        ),
                      ),
                      //description
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 20, bottom: 20, left: 20, right: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Expanded(
                              child: Text(
                                'An alien scarab chooses college graduate Jaime Reyes to be its symbiotic host, bestowing the teenager with a suit of armor that',
                                maxLines: 3,
                                style: TextStyle(
                                    color: Colors.grey,
                                    overflow: TextOverflow.ellipsis),
                              ),
                            ),
                          ],
                        ),
                      ),
                      //watch now button
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: const [
                            CustomWatchNowButton(
                              buttonHeight: 45,
                              borderRadius: 10,
                            ),
                          ],
                        ),
                      )
                    ]),
              ),
            ]),
        // ),
      );

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return InkWell(
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onHover: (isHovered) {
        if (isHovered) {
          setState(() {
            isOnHovered = true;
          });
          showOverlay();
        } else if (isHovered == false) {
          setState(() {
            isOnHovered = false;
          });
          entry!.remove();
        }
      },
      onTap: () {},
      child: CompositedTransformTarget(
        link: layerLink,
        child: Column(
          key: key,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            AspectRatio(
              aspectRatio: screenWidth < 480 ? 9 / 12 : 9 / 13,
              child: Stack(
                children: [
                  Container(
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage(widget.imageUrl),
                            fit: BoxFit.fill),
                        borderRadius: BorderRadius.circular(8)),
                    width: double.infinity,
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: const []),
                  ),
                  isOnHovered
                      ? Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              gradient: LinearGradient(
                                  colors: [
                                    AppColor.onHoveredColor.withOpacity(0.7),
                                    AppColor.onHoveredColor.withOpacity(0.1)
                                  ],
                                  stops: const [
                                    0,
                                    0.6
                                  ],
                                  begin: Alignment.bottomCenter,
                                  end: Alignment.topCenter)),
                          width: double.infinity,
                          child: Center(
                              child: Container(
                            width: 40,
                            height: 40,
                            decoration: const BoxDecoration(
                                color: Colors.black, shape: BoxShape.circle),
                            child: Icon(
                              Icons.play_arrow,
                              size: 25,
                              color: Colors.grey.withOpacity(0.7),
                            ),
                          )),
                        )
                      : const SizedBox()
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 14),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    '2023',
                    style: TextStyle(color: Colors.grey, fontSize: 12),
                  ),
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                            color: isOnHovered
                                ? AppColor.onHoveredColor
                                : Colors.grey,
                            width: 1)),
                    child: Text(
                      'Movie',
                      style: TextStyle(
                          color: isOnHovered
                              ? AppColor.onHoveredColor
                              : Colors.grey,
                          fontSize: 12),
                    ),
                  ),
                  const Text(
                    '124 min',
                    style: TextStyle(color: Colors.grey, fontSize: 12),
                  )
                ],
              ),
            ),
            Expanded(
              child: Text(
                widget.movieTitle,
                style: TextStyle(
                    color: isOnHovered ? AppColor.onHoveredColor : Colors.white,
                    fontSize: 14),
              ),
            )
          ],
        ),
      ),
    );
  }
}
