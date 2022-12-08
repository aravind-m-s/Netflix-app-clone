import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflix_application/application/search/search_bloc.dart';
import 'package:netflix_application/core/constants.dart';
import 'package:netflix_application/core/imports/search_imports.dart';

Expanded listViewWidget() {
  const noImage =
      'https://imgs.search.brave.com/XbaLNffXL3D8s_IOdhPMZGMzGsr8RPooQ4_AdB81lv0/rs:fit:400:250:1/g:ce/aHR0cHM6Ly93d3cu/Z210LXNhbGVzLmNv/bS93cC1jb250ZW50/L3VwbG9hZHMvMjAx/NS8xMC9uby1pbWFn/ZS1mb3VuZC5qcGc';
  return Expanded(
    child: BlocBuilder<SearchBloc, SearchState>(
      builder: (context, state) {
        if (state.isLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state.isError) {
          return const Center(
            child: Text('Some error occured'),
          );
        } else if (state.idle.isEmpty) {
          return const Center(
            child: Text('No result found'),
          );
        }
        return ListView.separated(
            itemBuilder: (context, index) {
              final movie = state.idle[index];
              return tileWidget(
                  title: movie.title ?? "No title provided",
                  imageUrl: movie.posterPath ?? noImage);
            },
            separatorBuilder: (context, index) => kHeigth10,
            itemCount: state.idle.length);
      },
    ),
  );
}
