import 'package:flutter/material.dart';

class DesktopBody extends StatelessWidget {
  const DesktopBody({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
        backgroundColor: Colors.red,
        body: Column(
          children: const [],
        ));
  }
}
