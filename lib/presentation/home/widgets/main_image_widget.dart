import 'package:flutter/material.dart';

Container imageWidget(String image) {
  return Container(
    width: double.infinity,
    height: 700,
    decoration: BoxDecoration(
      image: DecorationImage(image: NetworkImage(image), fit: BoxFit.fill),
    ),
  );
}
