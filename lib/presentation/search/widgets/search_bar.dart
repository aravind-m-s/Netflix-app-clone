import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflix_application/application/search/search_bloc.dart';
import 'package:netflix_application/core/colors.dart';
import 'package:netflix_application/domain/core/debouncer/debouncer.dart';

searchBar(BuildContext context) {
  final Debouncer debouncer = Debouncer(milliseconds: 500);
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 20),
    child: CupertinoSearchTextField(
      onChanged: (value) {
        if (value.isEmpty) {
          return;
        }
        debouncer.run(() {
          BlocProvider.of<SearchBloc>(context)
              .add(SearchMovie(movieQuery: value));
        });
      },
      style: const TextStyle(color: text),
      suffixIcon: const Icon(Icons.close),
      prefixInsets: const EdgeInsetsDirectional.fromSTEB(10, 0, 5, 0),
      suffixInsets: const EdgeInsetsDirectional.fromSTEB(10, 0, 5, 0),
    ),
  );
}
