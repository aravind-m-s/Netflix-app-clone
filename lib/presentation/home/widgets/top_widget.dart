import 'package:flutter/material.dart';
import 'package:netflix_application/core/imports/home_imports.dart';

class TopWidget extends StatelessWidget {
  final String image;
  const TopWidget({super.key, required this.image});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        imageWidget(image),
        bottomFunctions(),
      ],
    );
  }
}
