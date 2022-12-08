import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflix_application/application/fast_laugh/fast_laugh_bloc.dart';
import 'package:netflix_application/core/imports/fast_laughs_imports.dart';

class ScreenFastLaugh extends StatelessWidget {
  const ScreenFastLaugh({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      BlocProvider.of<FastLaughBloc>(context).add(const Initialize());
    });
    return Scaffold(
      body: BlocBuilder<FastLaughBloc, FastLaughState>(
        builder: (context, state) {
          if (state.isLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state.videosList.isEmpty) {
            return const Center(
              child: Text('No videos found'),
            );
          } else if (state.isError) {
            return const Center(
              child: Text('No videos found'),
            );
          } else {
            return PageView(
              scrollDirection: Axis.vertical,
              children: List.generate(
                  state.videosList.length,
                  (index) => VideoListItemInheritedWidget(
                        widget: VideoItem(
                          key: Key(index.toString()),
                          index: index,
                        ),
                        movieData: state.videosList[index],
                      )),
            );
          }
        },
      ),
    );
  }
}
