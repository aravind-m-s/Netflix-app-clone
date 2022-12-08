import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflix_application/application/hot_and_new/hot_and_n_ew_bloc.dart';
import 'package:netflix_application/core/imports/const_screens.dart';
import 'package:netflix_application/core/string.dart';

import '../../../core/imports/new_hot_imports.dart';

class EveryoneIsWatching extends StatelessWidget {
  const EveryoneIsWatching({super.key});

  @override
  Widget build(BuildContext context) {
    final noImage =
        "https://www.gmt-sales.com/wp-content/uploads/2015/10/no-image-found.jpg";

    WidgetsBinding.instance.addPostFrameCallback(
      (timeStamp) {
        BlocProvider.of<HotAndNEwBloc>(context)
            .add(const LoadDataInEveryoneIsWatching());
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
        if (state.everyOneIsWatchingList.isEmpty) {
          return const Center(
            child: Text('No Data Found'),
          );
        }
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: ListView.builder(
            itemBuilder: (BuildContext context, int index) {
              final movie = state.everyOneIsWatchingList[index];
              return videoDetailItems(
                  backdropPath: movie.backdropPath == null
                      ? noImage
                      : kImageUrl + movie.backdropPath!,
                  movieName: movie.originalName ?? 'No title',
                  description: movie.overview == null || movie.overview == ''
                      ? "NO description"
                      : movie.overview!);
            },
            itemCount: state.everyOneIsWatchingList.length,
          ),
        );
      },
    );
  }
}

Column videoDetailItems({
  required String movieName,
  required String backdropPath,
  required String description,
}) {
  return Column(
    children: [
      SizedBox(
        width: double.infinity,
        height: 400,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(backdropPath),
            kHeigth10,
            functions(),
            kHeigth10,
            movieTitle(movieName),
            kHeigth10,
            desceiption(description)
          ],
        ),
      )
    ],
  );
}

Row functions() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.end,
    children: [
      iconWidget(Icons.share, 'Share'),
      kWidth10,
      iconWidget(Icons.add, 'My List'),
      kWidth10,
      iconWidget(Icons.play_arrow, 'Play'),
      kWidth10,
    ],
  );
}

Column iconWidget(icon, title) {
  return Column(
    children: [
      Icon(icon),
      Text(
        title,
        style: const TextStyle(fontSize: 12),
      ),
    ],
  );
}

Text desceiption(description) {
  return Text(
    description,
    overflow: TextOverflow.ellipsis,
    maxLines: 5,
    style: const TextStyle(color: Colors.grey, fontSize: 12),
  );
}

Text movieTitle(movieName) {
  return Text(
    movieName,
    overflow: TextOverflow.ellipsis,
    style: const TextStyle(fontSize: 25),
  );
}
