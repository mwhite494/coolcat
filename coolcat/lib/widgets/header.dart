import 'dart:math';

import 'package:coolcat/constants/index.dart' show Numbers;
import 'package:flutter/material.dart';

class Header extends StatelessWidget {

  const Header({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    bool isMobile = min(screenWidth, screenHeight) < Numbers.mobileScreenWidthThreshold;
    double fontSize = isMobile ? Numbers.headerFontSizeSmall : Numbers.headerFontSizeLarge;

    return Align(
      alignment: Alignment.topCenter,
      child: Padding(
        padding: EdgeInsets.only(top: isMobile ? Numbers.paddingTopSmall : Numbers.paddingTopLarge), // Adjust padding as needed
        child: Text(
          "STAY F*KIN COOL",
          style: TextStyle(
            fontSize: fontSize, // Adjust the font size as needed
            color: Colors.white, // Set the text color to white
            fontFamily: 'GloriaHallelujah', // Use your custom font
          ),
        ),
      ),
    );
  }
}
