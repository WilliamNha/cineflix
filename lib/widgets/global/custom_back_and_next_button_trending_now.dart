import 'package:cineflix/constants/app_color.dart';
import 'package:flutter/material.dart';

class CustomBackAndNextButtonTrendingNow extends StatefulWidget {
  final int maxIndex;
  final int currentIndex;
  final GestureTapCallback onBackButtonTapped;
  final GestureTapCallback onNextButtonTapped;
  const CustomBackAndNextButtonTrendingNow({
    this.maxIndex = 3,
    required this.currentIndex,
    required this.onBackButtonTapped,
    required this.onNextButtonTapped,
    super.key,
  });

  @override
  State<CustomBackAndNextButtonTrendingNow> createState() =>
      _CustomBackAndNextButtonTrendingNowState();
}

class _CustomBackAndNextButtonTrendingNowState
    extends State<CustomBackAndNextButtonTrendingNow> {
  bool isNextButtonHovered = false;
  bool isBackButtonHovered = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: widget.currentIndex == widget.maxIndex
              ? null
              : widget.onNextButtonTapped,
          onHover: (isHovered) {
            setState(() {
              isNextButtonHovered = isHovered;
            });
          },
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: widget.currentIndex == widget.maxIndex
                  ? Colors.white.withOpacity(0.15)
                  : isNextButtonHovered
                      ? AppColor.onHoveredColor
                      : Colors.grey.withOpacity(0.6),
            ),
            width: 25,
            height: 100,
            child: const Center(
                child: Icon(
              Icons.keyboard_arrow_right,
              size: 25,
            )),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        InkWell(
          onTap: widget.currentIndex == 0 ? null : widget.onBackButtonTapped,
          onHover: (isHovered) {
            setState(() {
              isBackButtonHovered = isHovered;
            });
          },
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: widget.currentIndex == 0
                  ? Colors.white.withOpacity(0.15)
                  : isBackButtonHovered
                      ? AppColor.onHoveredColor
                      : Colors.grey.withOpacity(0.6),
            ),
            width: 25,
            height: 100,
            child: const Center(
                child: Icon(
              Icons.keyboard_arrow_left,
              size: 25,
            )),
          ),
        ),
      ],
    );
  }
}
