import 'package:flutter/material.dart';
import 'package:netflix_application/core/constants.dart';
import 'package:netflix_application/core/string.dart';

Column functions(String? posterPath) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.end,
    children: [
      CircleAvatar(
        radius: 30,
        backgroundImage:
            posterPath == null ? null : NetworkImage(kImageUrl + posterPath),
      ),
      kHeigth20,
      sideButtons(icon: Icons.emoji_emotions, text: 'LOL'),
      kHeigth20,
      sideButtons(icon: Icons.add, text: 'My List'),
      kHeigth20,
      sideButtons(icon: Icons.share, text: 'Share'),
      kHeigth20,
      sideButtons(icon: Icons.play_arrow, text: 'Play'),
      kHeigth20,
    ],
  );
}

sideButtons({required icon, required text}) {
  return Column(
    children: [
      Icon(icon),
      Text(text),
    ],
  );
}
