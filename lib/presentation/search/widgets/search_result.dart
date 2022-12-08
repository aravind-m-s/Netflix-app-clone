import 'package:flutter/material.dart';
import 'package:netflix_application/core/constants.dart';
import 'package:netflix_application/core/imports/search_imports.dart';

Column searchResult(BuildContext context) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      kHeigth20,
      textWidget(text: 'Movies & TV'),
      kHeigth20,
      Expanded(child: gridViewResult()),
    ],
  );
}
