import 'package:flutter/material.dart';

class BNBCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint =  Paint()
      ..color = const Color(0xFF1B2051)
      ..style = PaintingStyle.fill;

    Path path = Path();
    double centerCutSize = 10;

    path.moveTo(0, 55);
    path.quadraticBezierTo(0, 0, size.width * 0.25, size.height * 0.05);
    path.quadraticBezierTo(size.width * 0.4, size.height * 0.04, size.width * 0.396, size.height * 0.17);
    path.lineTo(size.width * 0.4, size.height * 0.1 + centerCutSize);
    path.arcToPoint(
      Offset(size.width * 0.601, size.height * 0.1 + centerCutSize),
      radius: Radius.circular(centerCutSize ),
      clockwise: false,
    );
    path.lineTo(size.width * 0.6, size.height * 0.3);
    path.quadraticBezierTo(size.width * 0.6, size.height * 0.05, size.width * 0.65, size.height * 0.05);
    path.quadraticBezierTo(size.width * 1, 0, size.width * 1 , 45);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.lineTo(0, size.height * 0.1);

    canvas.drawShadow(path, Colors.black, 5, true);
    canvas.drawPath(path, paint);


  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}