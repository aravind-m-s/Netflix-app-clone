import 'package:flutter/material.dart';

List<String> img = [
  'http://www.themoviedb.org/t/p/w300_and_h450_bestv2/xDgnmbdWS59NtTPdzujdZGuPUPZ.jpg',
  'http://www.themoviedb.org/t/p/w300_and_h450_bestv2/tVxDe01Zy3kZqaZRNiXFGDICdZk.jpg',
  'http://www.themoviedb.org/t/p/w300_and_h450_bestv2/daSFbrt8QCXV2hSwB0hqYjbj681.jpg',
  'http://www.themoviedb.org/t/p/w300_and_h450_bestv2/xDgnmbdWS59NtTPdzujdZGuPUPZ.jpg',
  'http://www.themoviedb.org/t/p/w300_and_h450_bestv2/tVxDe01Zy3kZqaZRNiXFGDICdZk.jpg',
  'http://www.themoviedb.org/t/p/w300_and_h450_bestv2/daSFbrt8QCXV2hSwB0hqYjbj681.jpg',
  'http://www.themoviedb.org/t/p/w300_and_h450_bestv2/xDgnmbdWS59NtTPdzujdZGuPUPZ.jpg',
  'http://www.themoviedb.org/t/p/w300_and_h450_bestv2/tVxDe01Zy3kZqaZRNiXFGDICdZk.jpg',
  'http://www.themoviedb.org/t/p/w300_and_h450_bestv2/daSFbrt8QCXV2hSwB0hqYjbj681.jpg',
  'http://www.themoviedb.org/t/p/w300_and_h450_bestv2/xDgnmbdWS59NtTPdzujdZGuPUPZ.jpg',
];

Row numberImageWidget(String image) {
  return Row(
    children: [
      const SizedBox(
        width: 65,
        height: 150,
      ),
      Container(
        height: 200,
        width: 140,
        decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(image),
              fit: BoxFit.fill,
            ),
            borderRadius: BorderRadius.circular(15)),
      )
    ],
  );
}
