import 'dart:math';
import 'package:flutter/material.dart';

class ResponsiveUtils {
  static const double mobileScreenWidthThreshold = 600; // Define your threshold

  static bool isMobile(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;
    return min(screenWidth, screenHeight) < mobileScreenWidthThreshold;
  }
}
