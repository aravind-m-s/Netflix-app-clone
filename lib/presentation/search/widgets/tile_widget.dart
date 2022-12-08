import 'package:flutter/material.dart';
import 'package:netflix_application/core/constants.dart';
import 'package:netflix_application/core/imports/search_imports.dart';
import 'package:netflix_application/core/string.dart';

Padding tileWidget({required String title, required String imageUrl}) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 15.0),
    child: SizedBox(
      height: 100,
      child: Row(
        children: [
          imageWidget(images: kImageUrl + imageUrl),
          kWidth10,
          Expanded(child: Text(title)),
          playButton(),
          kWidth10,
        ],
      ),
    ),
  );
}
