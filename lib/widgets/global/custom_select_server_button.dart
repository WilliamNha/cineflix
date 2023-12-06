import 'package:cineflix/constants/app_color.dart';
import 'package:flutter/material.dart';

class CustomSelectServerButton extends StatefulWidget {
  final GestureTapCallback? onTap;
  final bool isSelected;
  final String title;
  const CustomSelectServerButton({
    this.onTap,
    required this.title,
    this.isSelected = false,
    super.key,
  });

  @override
  State<CustomSelectServerButton> createState() =>
      _CustomSelectServerButtonState();
}

class _CustomSelectServerButtonState extends State<CustomSelectServerButton> {
  bool isOnHovered = false;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onHover: (value) {
        setState(() {
          isOnHovered = value;
        });
      },
      onTap: widget.onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 8,
        ),
        decoration: BoxDecoration(
            color: widget.isSelected
                ? AppColor.primaryColor
                : isOnHovered
                    ? AppColor.onHoveredColor
                    : Colors.black,
            borderRadius: BorderRadius.circular(20)),
        child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                widget.title,
                style: TextStyle(
                    color: widget.isSelected
                        ? Colors.black
                        : isOnHovered
                            ? Colors.black54
                            : Colors.white,
                    fontSize: 12,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                width: 5,
              ),
              Icon(
                Icons.format_list_bulleted_outlined,
                size: 20,
                color: widget.isSelected
                    ? Colors.black
                    : isOnHovered
                        ? Colors.black54
                        : Colors.white,
              )
            ]),
      ),
    );
  }
}
