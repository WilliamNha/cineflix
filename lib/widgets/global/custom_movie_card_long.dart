import 'package:cineflix/constants/app_color.dart';
import 'package:flutter/material.dart';

class CustomMovieCardLong extends StatefulWidget {
  final bool isHasCircleNumber;
  const CustomMovieCardLong({
    this.isHasCircleNumber = false,
    super.key,
  });

  @override
  State<CustomMovieCardLong> createState() => _CustomMovieCardLongState();
}

class _CustomMovieCardLongState extends State<CustomMovieCardLong> {
  bool isOnHovered = false;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      highlightColor: Colors.transparent,
      splashColor: Colors.transparent,
      onTap: () {},
      onHover: (isHovered) {
        setState(() {
          isOnHovered = isHovered;
        });
      },
      child: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(16),
                  topLeft: Radius.circular(16),
                  topRight: Radius.circular(8),
                  bottomRight: Radius.circular(8)),
              color: Colors.black,
            ),
            width: double.infinity,
            height: 75,
            margin: EdgeInsets.only(
                right: widget.isHasCircleNumber ? 20 : 15, left: 15),
            child: Row(children: [
              widget.isHasCircleNumber
                  ? Container(
                      color: AppColor.backgroundColor,
                      width: 10,
                      height: 75,
                    )
                  : const SizedBox(),
              Container(
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('images/elemental.jpeg'),
                        fit: BoxFit.fill),
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(8),
                        bottomLeft: Radius.circular(8)),
                    color: Colors.red),
                width: 55,
                height: 75,
              ),
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    color: isOnHovered ? AppColor.onHoveredColor : Colors.black,
                    borderRadius: const BorderRadius.only(
                        topRight: Radius.circular(8),
                        bottomRight: Radius.circular(8)),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'MOVIE  /  2023  /  127 min',
                          style: TextStyle(
                              color: isOnHovered ? Colors.black : Colors.grey,
                              fontSize: 10),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          'Elemental',
                          style: TextStyle(
                              color: isOnHovered ? Colors.black : Colors.white,
                              fontSize: 14),
                        )
                      ],
                    ),
                  ),
                ),
              )
            ]),
          ),
          widget.isHasCircleNumber
              ? Positioned(
                  left: 10,
                  top: 20,
                  child: Container(
                    width: 30,
                    height: 30,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color:
                            isOnHovered ? AppColor.primaryColor : Colors.black,
                        border:
                            Border.all(color: AppColor.primaryColor, width: 2)),
                    child: Center(
                      child: Text(
                        '1',
                        style: TextStyle(
                            color: isOnHovered
                                ? Colors.black
                                : AppColor.primaryColor,
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                )
              : const SizedBox()
        ],
      ),
    );
  }
}
