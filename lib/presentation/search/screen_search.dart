import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflix_application/application/search/search_bloc.dart';
import 'package:netflix_application/core/imports/const_screens.dart';
import 'package:netflix_application/core/imports/search_imports.dart';

class ScreenSearch extends StatelessWidget {
  const ScreenSearch({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback(
        (_) => BlocProvider.of<SearchBloc>(context).add(const Initialize()));
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            kHeigth10,
            searchBar(context),
            Expanded(
              child: BlocBuilder<SearchBloc, SearchState>(
                builder: (context, state) {
                  if (state.searchResultList.isEmpty) {
                    return searchDefault(context);
                  } else {
                    return searchResult(context);
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
