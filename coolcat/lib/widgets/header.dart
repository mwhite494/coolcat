import 'dart:math';

import 'package:coolcat/constants/index.dart' show NumberConstants;
import 'package:flutter/material.dart';

class Header extends StatelessWidget {

  const Header({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    bool isMobile = min(screenWidth, screenHeight) < NumberConstants.mobileScreenWidthThreshold;
    double fontSize = isMobile ? NumberConstants.headerFontSizeSmall : NumberConstants.headerFontSizeLarge;

    return Align(
      alignment: Alignment.topCenter,
      child: Padding(
        padding: EdgeInsets.only(top: isMobile ? NumberConstants.paddingTopSmall : NumberConstants.paddingTopLarge), // Adjust padding as needed
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
