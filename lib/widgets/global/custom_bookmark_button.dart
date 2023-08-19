import 'package:flutter/material.dart';
import 'package:cineflix/constants/app_color.dart';

class CustomBookmarkButton extends StatefulWidget {
  const CustomBookmarkButton({
    super.key,
  });

  @override
  State<CustomBookmarkButton> createState() => _CustomBookmarkButtonState();
}

class _CustomBookmarkButtonState extends State<CustomBookmarkButton> {
  bool isOnHovered = false;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: () {},
        onHover: (onHovered) {
          setState(() {
            isOnHovered = onHovered;
          });
        },
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          height: 50,
          decoration: BoxDecoration(
              color: Colors.transparent,
              borderRadius: BorderRadius.circular(25)),
          child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            Icon(
              Icons.bookmark_outline,
              color: isOnHovered ? AppColor.onHoveredColor : Colors.white,
              size: 25,
            ),
            const SizedBox(
              width: 5,
            ),
            Text(
              'Bookmark',
              style: TextStyle(
                  color: isOnHovered ? AppColor.onHoveredColor : Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold),
            )
          ]),
        ),
      ),
    );
  }
}
