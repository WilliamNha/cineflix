import 'package:cineflix/constants/app_color.dart';
import 'package:flutter/material.dart';

class CustomLoginButton extends StatefulWidget {
  const CustomLoginButton({
    super.key,
  });

  @override
  State<CustomLoginButton> createState() => _CustomLoginButtonState();
}

class _CustomLoginButtonState extends State<CustomLoginButton> {
  bool isOnHovered = false;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: () {},
      onHover: (isHovered) {
        setState(() {
          isOnHovered = isHovered;
        });
      },
      child: Container(
        margin: const EdgeInsets.only(left: 10),
        decoration: BoxDecoration(
            border: Border.all(
                width: 2,
                color: isOnHovered
                    ? AppColor.onHoveredColor
                    : Colors.white.withOpacity(0.7)),
            color: isOnHovered ? AppColor.onHoveredColor : Colors.black38,
            borderRadius: BorderRadius.circular(20)),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Login',
              style: TextStyle(
                  color: isOnHovered
                      ? Colors.black54
                      : Colors.white.withOpacity(0.7),
                  fontSize: 16,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              width: 15,
            ),
            Icon(
              Icons.arrow_forward,
              color:
                  isOnHovered ? Colors.black54 : Colors.white.withOpacity(0.7),
              size: 16,
            )
          ],
        ),
      ),
    );
  }
}
