import 'package:flutter/material.dart';
import 'package:netflix_application/core/constants.dart';

rightSide(
  BuildContext context, {
  required String posterPath,
  required String movieName,
  required String date,
  required String desc,
}) {
  return SizedBox(
    width: MediaQuery.of(context).size.width - 50,
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          image(posterPath),
          kHeigth10,
          mainTitle(movieName),
          kHeigth20,
          comingDay(date),
          kHeigth10,
          secondTitle(movieName),
          kHeigth10,
          description(desc),
        ],
      ),
    ),
  );
}

Text secondTitle(movie) {
  return Text(
    movie,
    overflow: TextOverflow.ellipsis,
    maxLines: 1,
    style: const TextStyle(fontSize: 23),
  );
}

Text comingDay(day) {
  return Text(
    day,
    style: const TextStyle(fontSize: 16),
  );
}

SizedBox image(posterPath) {
  return SizedBox(
    child: Image.network(posterPath),
  );
}

Row mainTitle(title) {
  return Row(
    children: [
      Expanded(
        child: Text(
          title,
          overflow: TextOverflow.ellipsis,
          maxLines: 1,
          style: const TextStyle(fontSize: 35),
        ),
      ),
      Column(
        children: const [
          Icon(Icons.all_out_outlined),
          Text('Remind me'),
        ],
      ),
      kWidth10,
      Column(
        children: const [
          Icon(Icons.info),
          Text('Info'),
        ],
      ),
      kWidth10
    ],
  );
}

description(desc) {
  return Text(
    desc,
    overflow: TextOverflow.ellipsis,
    maxLines: 5,
    style: const TextStyle(color: Colors.grey),
  );
}
