import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflix_application/application/search/search_bloc.dart';
import 'package:netflix_application/core/string.dart';

Padding gridViewResult() {
  const noImage =
      'http://www.fremontgurdwara.org/wp-content/uploads/2020/06/no-image-icon-2.png';

  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 5),
    child: BlocBuilder<SearchBloc, SearchState>(
      builder: (context, state) {
        return GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              mainAxisExtent: 175),
          itemBuilder: (context, index) {
            String? movieImage = state.searchResultList[index].posterPath;
            if (movieImage == null) {
              movieImage = noImage;
            } else {
              movieImage = kImageUrl + movieImage;
            }

            return image(movieImage);
          },
          itemCount: state.searchResultList.length,
        );
      },
    ),
  );
}

Container image(String imageUrl) {
  return Container(
    height: 300,
    width: 200,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(7),
      image: DecorationImage(
        image: NetworkImage(
          imageUrl,
        ),
        fit: BoxFit.cover,
      ),
    ),
  );
}
