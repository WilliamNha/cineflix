import 'package:flutter/material.dart';
import 'package:cineflix/constants/app_color.dart';

class CustomWatchNowButton extends StatefulWidget {
  final double buttonHeight;
  final double borderRadius;
  const CustomWatchNowButton({
    this.buttonHeight = 50,
    this.borderRadius = 25,
    super.key,
  });

  @override
  State<CustomWatchNowButton> createState() => _CustomWatchNowButtonState();
}

class _CustomWatchNowButtonState extends State<CustomWatchNowButton> {
  bool isHovered = false;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onHover: (onHover) {
          setState(() {
            isHovered = onHover;
          });
        },
        onTap: () {},
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          height: widget.buttonHeight,
          decoration: BoxDecoration(
              color:
                  isHovered ? AppColor.onHoveredColor : AppColor.primaryColor,
              borderRadius: BorderRadius.circular(widget.borderRadius)),
          child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            Container(
              width: 20,
              height: 20,
              decoration: const BoxDecoration(
                color: Colors.black,
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.play_arrow,
                color: Colors.blue,
                size: 12,
              ),
            ),
            const SizedBox(
              width: 5,
            ),
            const Text(
              'Watch Now',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.bold),
            )
          ]),
        ),
      ),
    );
  }
}
