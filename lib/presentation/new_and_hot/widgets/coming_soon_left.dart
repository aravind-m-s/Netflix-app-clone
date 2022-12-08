import 'package:flutter/material.dart';

leftSide({required month, required day}) {
  return SizedBox(
    width: 50,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          month,
          style: const TextStyle(fontSize: 20),
        ),
        Text(
          day,
          style: TextStyle(fontSize: 30),
        ),
      ],
    ),
  );
}
