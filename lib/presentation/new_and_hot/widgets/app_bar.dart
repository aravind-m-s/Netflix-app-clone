import 'package:flutter/material.dart';
import 'package:netflix_application/core/colors.dart';
import 'package:netflix_application/core/constants.dart';

appBarWidget() {
  return AppBar(
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
      bottom: tabBar());
}

TabBar tabBar() {
  return TabBar(
    labelColor: Colors.black,
    unselectedLabelColor: text,
    labelStyle: const TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.bold,
    ),
    indicator: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(25),
    ),
    tabs: const [
      Tab(
        child: Text(
          '🍿 Coming Soon',
          maxLines: 1,
          style: TextStyle(fontSize: 15),
        ),
      ),
      Tab(
        child: Text(
          "👀 Everyone's watching",
          maxLines: 1,
          style: TextStyle(fontSize: 15),
        ),
      )
    ],
  );
}

Text title() {
  return const Text(
    'New  & Hot',
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
