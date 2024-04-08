import 'dart:math';

import 'package:coolcat/constants/index.dart' show Numbers;
import 'package:flutter/material.dart';

class OpenManifestoButton extends StatelessWidget {
  const OpenManifestoButton({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    bool isMobile = min(screenWidth, screenHeight) < Numbers.mobileScreenWidthThreshold;
    double fontSize = isMobile ? Numbers.textButtonFontSizeSmall : Numbers.textButtonFontSizeLarge;

    return Align(
      alignment: Alignment.bottomCenter,
      child: Padding(
        padding: EdgeInsets.only(bottom: isMobile ? Numbers.paddingBottomSmall : Numbers.paddingBottomLarge),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              height: isMobile ? 24 : 36,
              alignment: Alignment.topCenter,
              child: Text(
                '^',
                style: TextStyle(
                  fontSize: isMobile ? 32 : 48,
                  color: Colors.white,
                  fontFamily: 'GloriaHallelujah',
                ),
              ),
            ),
            Text(
              'MANIFESTO',
              style: TextStyle(
                fontSize: fontSize,
                color: Colors.white,
                fontFamily: 'GloriaHallelujah',
              ),
            ),
          ],
        ),
      )
    );
  }
}
