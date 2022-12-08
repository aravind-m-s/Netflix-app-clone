import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflix_application/application/downloads/downloads_bloc.dart';
import 'package:netflix_application/core/string.dart';

class Imamges extends StatelessWidget {
  const Imamges({super.key});
  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      BlocProvider.of<DownloadsBloc>(context)
          .add(const DownloadsEvent.getDownloadsImage());
    });
    const noImage =
        'https://imgs.search.brave.com/XbaLNffXL3D8s_IOdhPMZGMzGsr8RPooQ4_AdB81lv0/rs:fit:400:250:1/g:ce/aHR0cHM6Ly93d3cu/Z210LXNhbGVzLmNv/bS93cC1jb250ZW50/L3VwbG9hZHMvMjAx/NS8xMC9uby1pbWFn/ZS1mb3VuZC5qcGc';

    return Expanded(
      child: BlocBuilder<DownloadsBloc, DownloadsState>(
        builder: (context, state) {
          if (state.downloads!.isEmpty) {
            return const Center(child: CircularProgressIndicator());
          }
          return SizedBox(
            height: 100,
            width: double.infinity,
            child: Stack(
              alignment: AlignmentDirectional.center,
              children: [
                const Positioned(
                  child: CircleAvatar(
                    backgroundColor: Color.fromARGB(255, 87, 87, 87),
                    radius: 135,
                  ),
                ),
                ImageWidget(
                  image:
                      '$kImageUrl${state.downloads![0].posterPath ?? noImage}',
                  x: -20,
                  y: 175,
                  angle: 27 * pi / 180,
                ),
                ImageWidget(
                  image:
                      '$kImageUrl${state.downloads![1].posterPath ?? noImage}',
                  x: 20,
                  y: 175,
                  angle: -27 * pi / 180,
                ),
                ImageWidget(
                  image:
                      '$kImageUrl${state.downloads![2].posterPath ?? noImage}',
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

// ignore: must_be_immutable
class ImageWidget extends StatelessWidget {
  const ImageWidget({
    super.key,
    required this.image,
    this.angle = 0,
    this.x = 0,
    this.y = 0,
  });
  final String image;
  final double angle;
  final double x;
  final double y;

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: angle,
      origin: Offset(x, y),
      child: Container(
        width: 140,
        height: 210,
        decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.contain,
              image: NetworkImage(
                image,
              ),
            ),
            borderRadius: BorderRadius.circular(10)),
      ),
    );
  }
}
