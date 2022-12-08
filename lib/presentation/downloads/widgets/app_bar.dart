import 'package:flutter/material.dart';
import 'package:netflix_application/core/constants.dart';

appBarWidget() {
  return PreferredSize(
    preferredSize: const Size.fromHeight(50),
    child: AppBar(
      title: title(),
      actions: [
        Row(
          children: [
            castButton(),
            kWidth10,
            profileIcon(),
            kWidth10,
          ],
        )
      ],
    ),
  );
}

Text title() {
  return const Text(
    'Downloads',
    style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
  );
}

IconButton castButton() {
  return IconButton(
    onPressed: () {},
    icon: const Icon(
      Icons.cast,
      size: 30,
    ),
  );
}

Container profileIcon() {
  return Container(
    height: 30,
    width: 30,
    color: Colors.blue,
  );
}
