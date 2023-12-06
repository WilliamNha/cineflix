import 'package:cineflix/constants/app_color.dart';
import 'package:cineflix/widgets/global/custom_login_button.dart';
import 'package:cineflix/widgets/global/custom_movies_category_button.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AppBarRowDesktop extends StatelessWidget {
  final bool isInMovieDetail;
  const AppBarRowDesktop({
    this.isInMovieDetail = false,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const CustomMoviesCategoryButton(),
        const SizedBox(
          width: 10,
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 3, vertical: 0),
          decoration: BoxDecoration(
              color: AppColor.primaryColor,
              borderRadius: BorderRadius.circular(4)),
          child: const Text(
            'CINEFLIX',
            style: TextStyle(
                fontSize: 25,
                fontFamily: 'HanleyPro-Sans',
                color: Colors.white),
          ),
        ),
        Expanded(
            child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
          decoration: BoxDecoration(
              color: isInMovieDetail
                  ? const Color(0xff2A2A2A)
                  : Colors.black.withOpacity(0.6),
              borderRadius: BorderRadius.circular(20)),
          margin: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width / 6),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: isInMovieDetail
                        ? Colors.black
                        : const Color(0xff353535)),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: const [
                      FaIcon(
                        FontAwesomeIcons.filter,
                        color: Colors.grey,
                        size: 10,
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      Text(
                        'Filter',
                        style: TextStyle(color: Colors.grey, fontSize: 10),
                      ),
                    ]),
              ),
              Expanded(
                  child: SizedBox(
                      height: 30,
                      child: Padding(
                        padding: const EdgeInsets.only(
                          left: 16,
                          right: 16,
                        ),
                        child: TextField(
                          onTap: () {},
                          style: const TextStyle(
                              color: Colors.white, fontSize: 14),
                          textAlign: TextAlign.center,
                          cursorColor: AppColor.primaryColor,
                          decoration: const InputDecoration(
                              contentPadding: EdgeInsets.only(bottom: 15),
                              fillColor: Colors.white,
                              border: InputBorder.none,
                              hintText: 'Search movies...',
                              hintStyle:
                                  TextStyle(color: Colors.grey, fontSize: 14)),
                        ),
                      ))),
              Icon(
                Icons.search_outlined,
                color: AppColor.primaryColor,
                size: 20,
              ),
              const SizedBox(
                width: 10,
              )
            ],
          ),
        )),
        const Padding(
          padding: EdgeInsets.only(right: 20),
          child: CustomLoginButton(),
        ),
      ],
    );
  }
}
