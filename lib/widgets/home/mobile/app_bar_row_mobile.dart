import 'package:cineflix/constants/app_color.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AppBarRowMobile extends StatelessWidget {
  const AppBarRowMobile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
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
    );
  }
}
