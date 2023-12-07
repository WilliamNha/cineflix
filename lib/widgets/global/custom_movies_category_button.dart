import 'package:cineflix/constants/app_color.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
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
  final List<String> items = [
    'Action',
    'Adventure',
    'Horror',
    'Sci-fi',
  ];
  String? selectedValue;
  @override
  Widget build(BuildContext context) {
    return DropdownButtonHideUnderline(
      child: InkWell(
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        onTap: () {},
        onHover: (isHovered) {
          setState(() {
            isOnHovered = isHovered;
          });
        },
        child: DropdownButton2(
          customButton: Icon(
            Icons.filter_list,
            size: 40,
            color: isOnHovered
                ? AppColor.onHoveredColor
                : Colors.white.withOpacity(0.7),
          ),
          items: items
              .map((String item) => DropdownMenuItem<String>(
                    value: item,
                    child: Text(
                      item,
                      style: const TextStyle(
                        fontSize: 14,
                      ),
                    ),
                  ))
              .toList(),
          onChanged: (value) {},
          dropdownStyleData: DropdownStyleData(
            width: 120,
            padding: const EdgeInsets.symmetric(vertical: 6),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4), color: Colors.white),
            // offset: const Offset(40, -4),
          ),
        ),
      ),
    );
    //  InkWell(
    //   splashColor: Colors.transparent,
    //   highlightColor: Colors.transparent,
    //   onHover: (isHovered) {
    //     setState(() {
    //       isOnHovered = isHovered;
    //     });
    //   },
    //   onTap: () {},
    //   child: Icon(
    //     Icons.filter_list,
    //     size: 40,
    //     color: isOnHovered ? AppColor.onHoveredColor : Colors.white,
    //   ),
    // );
  }
}
