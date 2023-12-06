import 'package:cineflix/constants/app_color.dart';
import 'package:cineflix/constants/app_constants.dart';
import 'package:cineflix/widgets/global/custom_bookmark_button.dart';
import 'package:cineflix/widgets/global/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class MovieHeadDesktop extends StatelessWidget {
  const MovieHeadDesktop({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Stack(
      children: [
        Container(
          width: double.infinity,
          height: 820,
          decoration: const BoxDecoration(),
          child: Image.asset(
            'images/meg2.jpeg',
            fit: BoxFit.cover,
          ),
        ),
        //dark graient color
        Positioned(
          top: 0,
          left: 0,
          child: Container(
            width: MediaQuery.of(context).size.width / 1,
            height: 820,
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
            bottom: 340,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.only(left: 20),
                  child: Text(
                    'MEG 2: THE TRENCH',
                    style: TextStyle(
                        fontSize: 34,
                        color: Colors.white,
                        fontFamily: hanlyFont),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20),
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
                            style: TextStyle(color: Colors.white, fontSize: 14),
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
                            style: TextStyle(color: Colors.white, fontSize: 14),
                          )
                        ],
                      ),
                      const SizedBox(
                        width: 12,
                      ),
                      const Text(
                        'Adventure',
                        style: TextStyle(fontSize: 14, color: Colors.white),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      const Text(
                        'Action',
                        style: TextStyle(fontSize: 14, color: Colors.white),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      const Text(
                        'Horror',
                        style: TextStyle(fontSize: 14, color: Colors.white),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: Padding(
                    padding: EdgeInsets.only(
                        left: 20,
                        top: 15,
                        right: MediaQuery.of(context).size.width / 3),
                    child: const Text(
                      'Meg 2: The Trench is a 2023 science fiction action film directed by Ben Wheatley from a screenplay by Jon Hoeber, Erich Hoeber, and Dean Georgaris.',
                      style: TextStyle(
                          height: 1.5,
                          color: Colors.grey,
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                SizedBox(
                  width: 400,
                  child: Row(
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
