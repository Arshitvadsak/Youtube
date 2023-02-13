import 'package:flutter/material.dart';
import 'package:youtube/screens/HomePage.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => HomePage(videoLink: '',),
      },
    )
  );
}
