import 'package:flutter/material.dart';
import 'package:netflix_application/core/colors.dart';

Positioned bottomFunctions() {
  return Positioned(
    bottom: 20,
    left: 0,
    right: 0,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Column(
          children: const [Icon(Icons.add), Text('My List')],
        ),
        ElevatedButton.icon(
          style: ElevatedButton.styleFrom(backgroundColor: text),
          onPressed: () {},
          icon: const Icon(
            Icons.play_arrow,
            color: Colors.black,
          ),
          label: const Text(
            'Play',
            style: TextStyle(color: Colors.black),
          ),
        ),
        Column(
          children: const [
            Icon(Icons.info),
            Text('Info'),
          ],
        )
      ],
    ),
  );
}
