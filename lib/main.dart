import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflix_application/application/home/home_bloc.dart';
import 'package:netflix_application/application/hot_and_new/hot_and_n_ew_bloc.dart';
import 'package:netflix_application/application/downloads/downloads_bloc.dart';
import 'package:netflix_application/application/search/search_bloc.dart';
import 'package:netflix_application/core/imports/const_screens.dart';
import 'package:netflix_application/domain/core/di/injectable.dart';

import 'application/fast_laugh/fast_laugh_bloc.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await configureInjection();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => getIt<DownloadsBloc>()),
        BlocProvider(create: (context) => getIt<SearchBloc>()),
        BlocProvider(create: (context) => getIt<FastLaughBloc>()),
        BlocProvider(create: (context) => getIt<HotAndNEwBloc>()),
        BlocProvider(create: (context) => getIt<HomeBloc>()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: themeData(),
        home: const ScreenBottomNavigation(),
      ),
    );
  }
}
