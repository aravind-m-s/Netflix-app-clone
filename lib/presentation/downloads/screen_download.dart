import 'package:flutter/material.dart';
import 'package:netflix_application/core/constants.dart';
import 'package:netflix_application/core/imports/downloads_imports.dart';

class ScreenDownload extends StatelessWidget {
  const ScreenDownload({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: appBarWidget(),
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              smartDownloadsButton(),
              kHeigth30,
              introducingDownloadsSection(),
              Imamges(),
              setupButton(),
              kHeigth20,
              seeWhatYouCanDownloadButton(),
              kHeigth20
            ],
          ),
        ));
  }
}
