import 'package:cineflix/constants/app_color.dart';
import 'package:cineflix/constants/app_constants.dart';
import 'package:flutter/material.dart';

class CustomSectionTitle extends StatelessWidget {
  final String title;
  const CustomSectionTitle({
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
          width: 12,
          height: 18,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(2),
            color: AppColor.primaryColor,
          ),
          child: const Icon(
            Icons.play_arrow,
            color: Colors.black,
            size: 10,
          ),
        ),
        const SizedBox(
          width: 5,
        ),
        Text(
          title,
          style: const TextStyle(
              fontFamily: hanlyFont, fontSize: 20, color: Colors.white),
        ),
      ],
    );
  }
}
