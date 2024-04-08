import 'package:coolcat/widgets/index.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(scaffoldBackgroundColor: Colors.black),
      home: const Scaffold(
        body: Stack(
          children: <Widget>[
            BackgroundVideo(),
            Column(
            children: [
              Header(),
              LinkButtonsRow(),
            ],
          ),
            OpenManifestoButton()
          ],
        ),
      ),
    );
  }

}
