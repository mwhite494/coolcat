import 'package:coolcat/widgets/index.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: Stack(
          children: <Widget>[
            BackgroundVideo(),
            Column(
            children: [
              Header(),
              Padding(
                padding: EdgeInsets.only(top: 12.0),
                child: LinkButtonsRow(),
              )
            ],
          ),
            OpenManifestoButton()
          ],
        ),
      ),
    );
  }

}
