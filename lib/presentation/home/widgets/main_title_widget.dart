import 'package:flutter/material.dart';
import 'package:netflix_application/core/imports/const_screens.dart';
import 'package:netflix_application/core/imports/home_imports.dart';

class MainTitleWidget extends StatelessWidget {
  final List<String> imageUrl;
  const MainTitleWidget({
    Key? key,
    required this.title,
    required this.imageUrl,
  }) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        headingTitle(text: title),
        kHeigth10,
        imagesWidget(imageUrl),
      ],
    );
  }
}
