import 'package:flutter/material.dart';
import 'package:netflix_application/core/constants.dart';

Column introducingDownloadsSection() {
  return Column(
    children: const [
      Text(
        'Introducing Downloads for You',
        style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
      ),
      kHeigth20,
      Text(
        "We'll download a personalised selelction of\nmovies and shows for you, so there's\nalways something to watch on your\ndevice.",
        style: TextStyle(color: Colors.grey, fontSize: 15),
        textAlign: TextAlign.center,
      ),
    ],
  );
}
