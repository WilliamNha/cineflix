import 'package:flutter/material.dart';

class TabletBody extends StatelessWidget {
  const TabletBody({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.orange,
      body: Center(
        child: Text('$width'),
      ),
    );
  }
}
