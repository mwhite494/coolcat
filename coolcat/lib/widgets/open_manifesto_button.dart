import 'dart:math';

import 'package:coolcat/constants/index.dart' show NumberConstants;
import 'package:coolcat/widgets/index.dart' show HoverButton, Manifesto;
import 'package:flutter/material.dart';

class OpenManifestoButton extends StatelessWidget {
  const OpenManifestoButton({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    bool isMobile = min(screenWidth, screenHeight) < NumberConstants.mobileScreenWidthThreshold;
    double fontSize = isMobile ? NumberConstants.textButtonFontSizeSmall : NumberConstants.textButtonFontSizeLarge;

    return Align(
      alignment: Alignment.bottomCenter,
      child: Padding(
        padding: EdgeInsets.only(bottom: isMobile ? NumberConstants.paddingBottomSmall : NumberConstants.paddingBottomLarge),
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
            HoverButton(
              onPressed: () => showManifesto(context),
              child: Text(
                'MANIFESTO',
                style: TextStyle(
                  fontSize: fontSize,
                  color: Colors.white,
                  fontFamily: 'GloriaHallelujah',
                ),
              ),
            )
          ],
        ),
      )
    );
  }

  void showManifesto(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      constraints: const BoxConstraints(
        maxWidth: double.infinity
      ),
      builder: (BuildContext context) {
        return const Manifesto();
      },
    );
  }

}
