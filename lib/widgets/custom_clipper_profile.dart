import 'package:flutter/material.dart';

class CustomClipperProfile extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path
      ..lineTo(0.0, 4 * size.height / 5)
      ..quadraticBezierTo(
          size.width / 2, size.height, size.width, 4 * size.height / 5)
      ..lineTo(size.width, 0.0)
      ..close();
      return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
