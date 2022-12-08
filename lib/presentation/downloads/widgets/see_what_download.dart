import 'package:flutter/material.dart';

seeWhatYouCanDownloadButton() {
  return SizedBox(
    width: 300,
    height: 40,
    child: ElevatedButton(
      style: ElevatedButton.styleFrom(backgroundColor: Colors.white),
      child: const Text(
        "See what you can download",
        style: TextStyle(
            color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold),
      ),
      onPressed: () {},
    ),
  );
}
