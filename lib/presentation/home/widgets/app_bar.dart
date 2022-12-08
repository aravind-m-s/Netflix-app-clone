import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflix_application/application/home/home_bloc.dart';
import 'package:netflix_application/core/constants.dart';
import 'package:netflix_application/core/imports/home_imports.dart';
import 'package:netflix_application/core/string.dart';

const logo =
    'https://imgs.search.brave.com/5C6W4F_NM632WSnWu9-XxS6YAudYR1RwiSp-6Rr14Rw/rs:fit:400:300:1/g:ce/aHR0cDovL3d3dy5z/ZXJpYWx0aGluZ3Mu/Y29tL3dwLWNvbnRl/bnQvdXBsb2Fkcy8y/MDE5LzA1L25ldGZs/aXgtbG9nby1jaXJj/bGUtcG5nLTUucG5n';
const noImage =
    "https://www.gmt-sales.com/wp-content/uploads/2015/10/no-image-found.jpg";

mainListView() {
  return BlocBuilder<HomeBloc, HomeState>(
    builder: (context, state) {
      if (state.isLoading) {
        return const Center(
          child: CircularProgressIndicator(
            strokeWidth: 2,
          ),
        );
      } else if (state.hasError) {
        return const Center(
          child: Text('Some error ouccured'),
        );
      } else if (state.pastYearMovieList.isEmpty) {
        return const Center(
          child: Text('No data'),
        );
      }

      // Release Past Yeare

      final releasesPastYear = state.pastYearMovieList.map((e) {
        return e.posterPath == null ? noImage : '$kImageUrl${e.posterPath}';
      }).toList();

      // Trending Movie

      final trendingMovie = state.trendingMovieList.map((e) {
        return e.posterPath == null ? noImage : '$kImageUrl${e.posterPath}';
      }).toList();

      // Trending TV

      final trendingTv = state.trendingTvList.map((e) {
        return e.posterPath == null ? noImage : '$kImageUrl${e.posterPath}';
      }).toList();

      // South Indian

      final southIndian = state.southIndianMovieList.map((e) {
        return e.posterPath == null ? noImage : '$kImageUrl${e.posterPath}';
      }).toList();

      // Dramas

      final dramas = state.tenseDramasMovieList.map((e) {
        return e.posterPath == null ? noImage : '$kImageUrl${e.posterPath}';
      }).toList();

      // Shuffling

      trendingTv.shuffle();
      dramas.shuffle();
      southIndian.shuffle();
      trendingMovie.shuffle();
      releasesPastYear.shuffle();

      // Main List

      return ListView(
        children: [
          TopWidget(image: trendingTv[9]),
          MainTitleWidget(
            title: 'Past Year Movies',
            imageUrl: releasesPastYear.sublist(0, 10),
          ),
          kHeigth10,
          MainTitleWidget(
            title: 'Trending Now',
            imageUrl: trendingMovie.sublist(0, 10),
          ),
          kHeigth10,
          NumberWidget(imageList: trendingTv),
          kHeigth10,
          MainTitleWidget(
            title: 'Tense Dramas',
            imageUrl: dramas,
          ),
          kHeigth10,
          MainTitleWidget(
            title: 'South Indian drama',
            imageUrl: southIndian,
          ),
        ],
      );
    },
  );
}

Container mainAppBar() {
  return Container(
    color: Colors.black.withOpacity(0.4),
    height: 100,
    child: Column(
      children: [kHeigth10, mainIcons(), kHeigth10, mainItemTitle()],
    ),
  );
}

Row mainIcons() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.start,
    children: [
      Image.network(
        logo,
        height: 50,
      ),
      const Expanded(child: kWidth10),
      castButton(),
      kWidth10,
      profileIcon(),
      kWidth10
    ],
  );
}

Row mainItemTitle() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: [
      mainItems('TV Shows'),
      mainItems('Movies'),
      mainItems('Categories'),
    ],
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

Text mainItems(title) {
  return Text(
    title,
    style: const TextStyle(fontSize: 16),
  );
}
