import 'package:cineflix/constants/app_color.dart';
import 'package:cineflix/constants/app_constants.dart';
import 'package:flutter/material.dart';

class CustomSectionTitle extends StatelessWidget {
  final double buttonIconWidth;
  final double titleTextSize;
  final String title;
  const CustomSectionTitle({
    this.titleTextSize = 20,
    this.buttonIconWidth = 10,
    required this.title,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 2, vertical: 4),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(2),
            color: AppColor.primaryColor,
          ),
          child: Icon(
            Icons.play_arrow,
            color: Colors.black,
            size: buttonIconWidth,
          ),
        ),
        const SizedBox(
          width: 5,
        ),
        Text(
          title,
          style: TextStyle(
              fontFamily: AppConstant.hanlyFont,
              fontSize: titleTextSize,
              color: Colors.white),
        ),
      ],
    );
  }
}
