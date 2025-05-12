import 'package:flutter/material.dart';

/// A utility class for responsive typography
class ResponsiveText {
  static double scaleFactor(BuildContext context) {
    // Get the screen width
    final width = MediaQuery.of(context).size.width;
    
    // Scale factor based on screen width
    if (width < 360) return 0.8;  // Small phones
    if (width < 600) return 0.9;  // Normal phones
    if (width < 900) return 1.0;  // Tablets/Default
    if (width < 1200) return 1.1; // Small desktops
    return 1.2;                   // Large desktops
  }
  
  // Heading 1
  static TextStyle h1(BuildContext context) {
    final factor = scaleFactor(context);
    return TextStyle(
      fontSize: 24 * factor,
      fontWeight: FontWeight.w600,
      color: Colors.white,
      height: 1.2,
    );
  }
  
  // Heading 2
  static TextStyle h2(BuildContext context) {
    final factor = scaleFactor(context);
    return TextStyle(
      fontSize: 20 * factor,
      fontWeight: FontWeight.w600,
      color: Colors.white,
      height: 1.2,
    );
  }
  
  // Heading 3
  static TextStyle h3(BuildContext context) {
    final factor = scaleFactor(context);
    return TextStyle(
      fontSize: 18 * factor,
      fontWeight: FontWeight.w500,
      color: Colors.white,
      height: 1.2,
    );
  }
  
  // Body text
  static TextStyle body(BuildContext context) {
    final factor = scaleFactor(context);
    return TextStyle(
      fontSize: 14 * factor,
      color: Colors.white,
      height: 1.5,
    );
  }
  
  // Caption text
  static TextStyle caption(BuildContext context) {
    final factor = scaleFactor(context);
    return TextStyle(
      fontSize: 12 * factor,
      color: const Color(0xFF999999),
      height: 1.5,
    );
  }
  
  // Button text
  static TextStyle button(BuildContext context) {
    final factor = scaleFactor(context);
    return TextStyle(
      fontSize: 14 * factor,
      fontWeight: FontWeight.w500,
      color: Colors.black,
      height: 1.2,
    );
  }
}
