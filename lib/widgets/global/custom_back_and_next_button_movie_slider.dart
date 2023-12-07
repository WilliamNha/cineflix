import 'package:cineflix/constants/app_color.dart';
import 'package:flutter/material.dart';

class CustomBackAndNextButtonsMovieSlider extends StatefulWidget {
  final GestureTapCallback onBackButtonTapped;
  final GestureTapCallback onNextButtonTapped;
  final int currentIndex;
  const CustomBackAndNextButtonsMovieSlider({
    required this.onBackButtonTapped,
    required this.onNextButtonTapped,
    required this.currentIndex,
    super.key,
  });

  @override
  State<CustomBackAndNextButtonsMovieSlider> createState() =>
      _CustomBackAndNextButtonsMovieSliderState();
}

class _CustomBackAndNextButtonsMovieSliderState
    extends State<CustomBackAndNextButtonsMovieSlider> {
  bool isLeftButtonHovered = false;
  bool isRightButtonHovered = false;
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        InkWell(
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
          onTap: widget.currentIndex == 0 ? null : widget.onBackButtonTapped,
          onHover: (isHovered) {
            setState(() {
              isLeftButtonHovered = isHovered;
            });
          },
          child: Container(
            decoration: BoxDecoration(
                color: widget.currentIndex == 0
                    ? Colors.white.withOpacity(0.15)
                    : isLeftButtonHovered
                        ? AppColor.onHoveredColor
                        : Colors.grey.withOpacity(0.6),
                borderRadius: BorderRadius.circular(4)),
            // width: 500,
            padding: const EdgeInsets.all(2),

            child: const Center(
                child: Icon(
              Icons.keyboard_arrow_left,
              size: 30,
            )),
          ),
        ),
        const SizedBox(
          width: 8,
        ),
        InkWell(
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
          onTap: widget.currentIndex == 4 ? null : widget.onNextButtonTapped,
          onHover: (isHovered) {
            setState(() {
              isRightButtonHovered = isHovered;
            });
          },
          child: Container(
            // width: 500,
            padding: const EdgeInsets.all(2),
            decoration: BoxDecoration(
                color: widget.currentIndex == 4
                    ? Colors.white.withOpacity(0.15)
                    : isRightButtonHovered
                        ? AppColor.onHoveredColor
                        : Colors.grey.withOpacity(0.6),
                borderRadius: BorderRadius.circular(4)),
            child: const Center(
                child: Icon(
              Icons.keyboard_arrow_right,
              size: 30,
            )),
          ),
        ),
        const SizedBox(
          width: 15,
        ),
      ],
    );
  }
}
