import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:netflix_application/application/hot_and_new/hot_and_n_ew_bloc.dart';
import 'package:netflix_application/core/constants.dart';
import 'package:netflix_application/core/imports/new_hot_imports.dart';
import 'package:netflix_application/core/string.dart';

class ComingSoon extends StatelessWidget {
  final noImage =
      "https://www.gmt-sales.com/wp-content/uploads/2015/10/no-image-found.jpg";
  const ComingSoon({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback(
      (timeStamp) {
        BlocProvider.of<HotAndNEwBloc>(context)
            .add(const LoadDataInComingSoon());
      },
    );
    return BlocBuilder<HotAndNEwBloc, HotAndNEwState>(
      builder: (context, state) {
        if (state.isLoading) {
          return const Center(
            child: CircularProgressIndicator(strokeWidth: 2),
          );
        }
        if (state.hasError) {
          return const Center(
            child: Text('Some error occured Please try again later'),
          );
        }
        if (state.comingSoonList.isEmpty) {
          return const Center(
            child: Text('No Data Found'),
          );
        }
        return ListView.builder(
          itemBuilder: (BuildContext context, int index) {
            final movie = state.comingSoonList[index];
            final date = DateTime.parse(movie.releaseDate!);
            final formattedDate = DateFormat.yMMMMd('en_US').format(date);
            return ComingSoonItem(
              posterPath: movie.backdropPath == null
                  ? noImage
                  : kImageUrl + movie.backdropPath!,
              movieName: movie.title ?? 'No title',
              day: date.toString().substring(8, 10),
              month: formattedDate.substring(0, 3).toUpperCase(),
              desc: movie.overview == null || movie.overview! == ''
                  ? "No description"
                  : movie.overview!,
              date: date.toString().substring(0, 10),
            );
          },
          itemCount: state.comingSoonList.length,
        );
      },
    );
  }
}

class ComingSoonItem extends StatelessWidget {
  final String posterPath;
  final String movieName;
  final String day;
  final String month;
  final String desc;
  final String date;
  const ComingSoonItem(
      {Key? key,
      required this.posterPath,
      required this.movieName,
      required this.day,
      required this.month,
      required this.desc,
      required this.date})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        kHeigth10,
        SizedBox(
          height: 450,
          child: Row(
            children: [
              leftSide(day: day, month: month),
              rightSide(context,
                  posterPath: posterPath,
                  movieName: movieName,
                  date: date,
                  desc: desc)
            ],
          ),
        ),
      ],
    );
  }
}
