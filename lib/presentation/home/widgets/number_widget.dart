import 'package:bordered_text/bordered_text.dart';
import 'package:flutter/material.dart';
import 'package:netflix_application/core/colors.dart';

Positioned number(int index) {
  return Positioned(
    left: 20,
    bottom: 2,
    child: BorderedText(
      strokeWidth: 10,
      strokeColor: text,
      child: Text(
        '${index + 1}',
        style: const TextStyle(
          fontSize: 120,
          color: bg,
        ),
      ),
    ),
  );
}
