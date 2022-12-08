import 'package:flutter/material.dart';
import 'package:netflix_application/core/imports/new_hot_imports.dart';
import 'package:netflix_application/presentation/new_and_hot/widgets/app_bar.dart';

class ScreenNewAndHot extends StatelessWidget {
  const ScreenNewAndHot({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
          appBar: appBarWidget(),
          body: const TabBarView(
            children: [
              ComingSoon(),
              EveryoneIsWatching(),
            ],
          )),
    );
  }
}
