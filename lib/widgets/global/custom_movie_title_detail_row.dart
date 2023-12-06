import 'package:flutter/material.dart';

class CustomMovieTitleDetailRow extends StatelessWidget {
  final String leftTitle;
  final String rightDetail;
  const CustomMovieTitleDetailRow({
    required this.leftTitle,
    required this.rightDetail,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 100,
            child: Text(
              leftTitle,
              style: const TextStyle(
                color: Colors.grey,
              ),
            ),
          ),
          Text(
            rightDetail,
            style: const TextStyle(
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
