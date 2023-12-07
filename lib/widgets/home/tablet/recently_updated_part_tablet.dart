import 'package:cineflix/widgets/global/custom_section_title.dart';
import 'package:flutter/material.dart';

class RecentlyUpdatedPartTablet extends StatefulWidget {
  const RecentlyUpdatedPartTablet({
    super.key,
  });

  @override
  State<RecentlyUpdatedPartTablet> createState() =>
      _RecentlyUpdatedPartTabletState();
}

class _RecentlyUpdatedPartTabletState extends State<RecentlyUpdatedPartTablet> {
  int selectedMovieTypeIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 15, top: 40, bottom: 20),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: const [
              CustomSectionTitle(
                buttonIconWidth: 14,
                titleTextSize: 24,
                title: 'RECENTLY UPDATED',
              ),
              SizedBox(
                width: 15,
              ),
            ],
          ),
        ),
        // const Padding(
        //   padding: EdgeInsets.only(bottom: 10),
        //   child: CustomMovieCardLong(
        //     isHasCircleNumber: false,
        //   ),
        // ),
        // const Padding(
        //   padding: EdgeInsets.only(bottom: 10),
        //   child: CustomMovieCardLong(
        //     isHasCircleNumber: false,
        //   ),
        // ),
        // const Padding(
        //   padding: EdgeInsets.only(bottom: 10),
        //   child: CustomMovieCardLong(
        //     isHasCircleNumber: false,
        //   ),
        // ),
        const SizedBox(
          height: 20,
        ),
      ],
    );
  }
}
