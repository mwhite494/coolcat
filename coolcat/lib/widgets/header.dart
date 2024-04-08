import 'package:flutter/material.dart';

class Header extends StatelessWidget {

  const Header({super.key});

  @override
  Widget build(BuildContext context) {
    return const Align(
      alignment: Alignment.topCenter,
      child: Padding(
        padding: EdgeInsets.only(top: 60.0), // Adjust padding as needed
        child: Text(
          "STAY F*KIN COOL",
          style: TextStyle(
            fontSize: 48, // Adjust the font size as needed
            color: Colors.white, // Set the text color to white
            fontFamily: 'GloriaHallelujah', // Use your custom font
          ),
        ),
      ),
    );
  }
}
