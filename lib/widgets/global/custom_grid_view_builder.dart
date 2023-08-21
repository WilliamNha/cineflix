import 'package:flutter/material.dart';

class CustomGridViewBuilder extends StatelessWidget {
  final double childHeight;
  final int chilAmountPerRow;
  final double horizontalSpacing;
  final double verticalSpacing;
  final int childAmount;
  final Widget Function(BuildContext, int) itemBuilder;

  const CustomGridViewBuilder({
    required this.itemBuilder,
    required this.childAmount,
    this.horizontalSpacing = 16,
    this.verticalSpacing = 16,
    this.chilAmountPerRow = 2,
    this.childHeight = 200,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(
          left: 15,
          right: 15,
        ),
        child: GridView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: childAmount,
            padding: EdgeInsets.zero,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                mainAxisExtent: childHeight,
                crossAxisCount: chilAmountPerRow,
                crossAxisSpacing: horizontalSpacing,
                mainAxisSpacing: verticalSpacing),
            itemBuilder: itemBuilder));
  }
}
