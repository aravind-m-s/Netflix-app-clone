import 'package:flutter/material.dart';

Center setupButton() {
  return Center(
    child: SizedBox(
      height: 40,
      width: 350,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.deepPurple[500],
        ),
        child: const Text(
          "Set Up",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        onPressed: () {},
      ),
    ),
  );
}
