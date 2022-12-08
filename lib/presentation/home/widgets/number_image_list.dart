import 'package:flutter/material.dart';
import 'package:netflix_application/core/constants.dart';
import 'package:netflix_application/core/imports/home_imports.dart';

class NumberWidget extends StatelessWidget {
  final List<String> imageList;
  const NumberWidget({super.key, required this.imageList});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        headingTitle(text: 'Top 10 videos'),
        kHeigth10,
        LimitedBox(
          maxHeight: 200,
          maxWidth: 70,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) => Stack(
              children: [
                numberImageWidget(imageList[index]),
                number(index),
              ],
            ),
            itemCount: 10,
          ),
        ),
      ],
    );
  }
}
