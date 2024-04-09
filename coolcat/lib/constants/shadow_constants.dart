import 'dart:ui';

class ShadowConstants {

  static const List<Shadow> shadowHeavy = 
  [
    Shadow(
      // Shadow properties
      offset: Offset(2.0, 2.0), // Horizontal and vertical offset
      blurRadius: 3.0, // Blur radius
      color: Color.fromARGB(255, 0, 0, 0), // Shadow color
    ),
    // Add more Shadow objects here if you want multiple shadows.
  ];

}