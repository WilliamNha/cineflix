import 'package:cineflix/constants/app_color.dart';
import 'package:flutter/material.dart';

class CustomMoviesCategoryButton extends StatefulWidget {
  const CustomMoviesCategoryButton({
    super.key,
  });

  @override
  State<CustomMoviesCategoryButton> createState() =>
      _CustomMoviesCategoryButtonState();
}

class _CustomMoviesCategoryButtonState
    extends State<CustomMoviesCategoryButton> {
  bool isOnHovered = false;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onHover: (isHovered) {
        setState(() {
          isOnHovered = isHovered;
        });
      },
      onTap: () {},
      child: Icon(
        Icons.filter_list,
        size: 40,
        color: isOnHovered ? AppColor.onHoveredColor : Colors.white,
      ),
    );
  }
}
