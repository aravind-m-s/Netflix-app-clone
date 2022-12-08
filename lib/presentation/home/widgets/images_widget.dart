import 'package:flutter/material.dart';
import 'package:netflix_application/core/constants.dart';
import 'package:netflix_application/core/imports/home_imports.dart';

LimitedBox imagesWidget(List<String> imageUrl) {
  return LimitedBox(
    maxHeight: 200,
    child: ListView.separated(
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) {
        if (index == 0) {
          return Row(
            children: [kWidth10, imageWidgets(imageUrl[index])],
          );
        }
        return imageWidgets(imageUrl[index]);
      },
      separatorBuilder: (context, index) => kWidth10,
      itemCount: imageUrl.length,
    ),
  );
}

Container imageWidgets(String image) {
  return Container(
    height: 200,
    width: 140,
    decoration: BoxDecoration(
        image: DecorationImage(
            image: NetworkImage(
              image,
            ),
            fit: BoxFit.fill),
        borderRadius: BorderRadius.circular(15)),
  );
}
