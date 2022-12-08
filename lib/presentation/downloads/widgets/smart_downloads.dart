import 'package:flutter/material.dart';
import 'package:netflix_application/core/colors.dart';
import 'package:netflix_application/core/constants.dart';

Center smartDownloadsButton() {
  return Center(
    child: Row(
      children: const [
        Icon(
          Icons.settings,
          color: text,
        ),
        kWidth10,
        Text(
          'Smart Downloads',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
      ],
    ),
  );
}
