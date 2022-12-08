import 'package:flutter/material.dart';

Container imageWidget({required String images}) {
  return Container(
    height: 90,
    width: 150,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(7),
      image: DecorationImage(
        image: NetworkImage(
          images,
        ),
        fit: BoxFit.cover,
      ),
    ),
  );
}
