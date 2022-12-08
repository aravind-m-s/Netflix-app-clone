import 'package:flutter/material.dart';
import 'package:netflix_application/core/constants.dart';
import 'package:netflix_application/core/imports/search_imports.dart';

Padding searchDefault(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.only(top: 20),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        textWidget(text: 'Top Searches'),
        kHeigth10,
        listViewWidget(),
      ],
    ),
  );
}
