import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomTrendingNowTitle extends StatelessWidget {
  const CustomTrendingNowTitle({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: const [
        FaIcon(
          // ignore: deprecated_member_use
          FontAwesomeIcons.fireAlt,
          color: Colors.white,
          size: 16,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Text(
            'Trending Now',
            style: TextStyle(
                fontSize: 16, color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
        FaIcon(
          // ignore: deprecated_member_use
          FontAwesomeIcons.fireAlt,
          color: Colors.white,
          size: 16,
        ),
      ],
    );
  }
}
