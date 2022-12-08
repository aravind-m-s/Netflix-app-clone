import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflix_application/application/home/home_bloc.dart';
import 'package:netflix_application/core/constants.dart';
import 'package:netflix_application/core/imports/home_imports.dart';

ValueNotifier<bool> scrollNotifier = ValueNotifier(true);

class ScreenHome extends StatelessWidget {
  const ScreenHome({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      BlocProvider.of<HomeBloc>(context).add(const GetHomeScreenData());
    });
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            mainListView(),
            ValueListenableBuilder(
              valueListenable: scrollNotifier,
              builder: (context, value, child) {
                return NotificationListener<UserScrollNotification>(
                    onNotification: (notification) {
                      if (notification.direction == ScrollDirection.reverse) {
                        scrollNotifier.value = false;
                      } else if (notification.direction ==
                          ScrollDirection.forward) {
                        scrollNotifier.value = true;
                      }
                      return true;
                    },
                    child: scrollNotifier.value ? mainAppBar() : kHeigth10);
              },
            ),
          ],
        ),
      ),
    );
  }
}
