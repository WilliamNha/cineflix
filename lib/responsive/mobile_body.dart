import 'package:flutter/material.dart';
import 'package:cineflix/constants/app_color.dart';
import 'package:cineflix/constants/app_constants.dart';
import 'package:cineflix/widgets/global/custom_bookmark_button.dart';
import 'package:cineflix/widgets/global/custom_button.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MobileBody extends StatelessWidget {
  const MobileBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.yellow,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Stack(
              children: [
                Stack(
                  children: [
                    Container(
                      width: double.infinity,
                      height: MediaQuery.of(context).size.height / 1.7,
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
                        height: MediaQuery.of(context).size.height / 1.7,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              Colors.black.withOpacity(1),
                              Colors.black.withOpacity(0.09),
                            ],
                            begin: Alignment.centerLeft,
                            end: Alignment.centerRight,
                            stops: const [0, 0.7],
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
                            const Text(
                              'MEG 2: THE TRENCH',
                              style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.white,
                                  fontFamily: hanlyFont),
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
                                      border: Border.all(
                                          color: Colors.white, width: 1),
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
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 12),
                                    )
                                  ],
                                ),
                                const SizedBox(
                                  width: 12,
                                ),
                                const Text(
                                  '2023',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 12),
                                ),
                                const SizedBox(
                                  width: 12,
                                ),
                                Row(
                                  children: const [
                                    Text(
                                      '116 min',
                                      style: TextStyle(
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
                              children: const [
                                Text(
                                  'Adventure',
                                  style: TextStyle(
                                      fontSize: 14, color: Colors.white),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  'Action',
                                  style: TextStyle(
                                      fontSize: 14, color: Colors.white),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  'Horror',
                                  style: TextStyle(
                                      fontSize: 14, color: Colors.white),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: const [
                                SizedBox(
                                  width: 15,
                                ),
                                CustomWatchNowButton(),
                                CustomBookmarkButton(),
                                SizedBox(
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
                ),
                Positioned.fill(
                    top: 20,
                    left: 20,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Icon(
                          Icons.filter_list,
                          size: 40,
                          color: Colors.white,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 3, vertical: 0),
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
                        const Spacer(),
                        const FaIcon(
                          FontAwesomeIcons.search,
                          color: Colors.white,
                          size: 22,
                        ),
                        const SizedBox(
                          width: 50,
                        ),
                        const FaIcon(
                          FontAwesomeIcons.arrowRight,
                          color: Colors.white,
                          size: 22,
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                      ],
                    )),
                // Positioned(
                //     top: 0,
                //     right: 20,
                //     child: SizedBox(
                //       height: 40,
                //       child: Row(
                //         crossAxisAlignment: CrossAxisAlignment.center,
                //         children: const [
                //           FaIcon(
                //             FontAwesomeIcons.search,
                //             color: Colors.white,
                //             size: 22,
                //           ),
                //           SizedBox(
                //             width: 50,
                //           ),
                //           FaIcon(
                //             FontAwesomeIcons.arrowRight,
                //             color: Colors.white,
                //             size: 22,
                //           )
                //         ],
                //       ),
                //     )),
              ],
            ),
          ],
        ));
  }
}
