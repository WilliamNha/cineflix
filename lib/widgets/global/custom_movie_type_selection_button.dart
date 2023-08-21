import 'package:cineflix/constants/app_color.dart';
import 'package:flutter/material.dart';

class CustomMovieTypeSelectionButton extends StatefulWidget {
  final GestureTapCallback onTap;
  final String buttonText;
  final bool isSelected;
  const CustomMovieTypeSelectionButton({
    required this.onTap,
    required this.buttonText,
    super.key,
    this.isSelected = false,
  });

  @override
  State<CustomMovieTypeSelectionButton> createState() =>
      _CustomMovieTypeSelectionButtonState();
}

class _CustomMovieTypeSelectionButtonState
    extends State<CustomMovieTypeSelectionButton> {
  bool isOnHovered = false;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      highlightColor: Colors.transparent,
      splashColor: Colors.transparent,
      onHover: (isHovered) {
        setState(() {
          isOnHovered = isHovered;
        });
      },
      onTap: widget.onTap,
      child: Container(
        decoration: BoxDecoration(
            border: Border.all(
                color: widget.isSelected || isOnHovered
                    ? AppColor.primaryColor
                    : Colors.white.withOpacity(0.2),
                width: 1),
            borderRadius: BorderRadius.circular(6)),
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        child: Text(
          widget.buttonText,
          style: TextStyle(
              color: widget.isSelected || isOnHovered
                  ? AppColor.primaryColor
                  : Colors.white.withOpacity(0.5),
              fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
