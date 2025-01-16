import 'package:flutter/material.dart';
import 'package:movie/constants/colors.dart';

class NumberPainter extends CustomPainter {
  final bool stroke;

  NumberPainter({required this.stroke, required this.num});
  int num;
  @override
  void paint(Canvas canvas, Size size) {
    TextPainter textPainter = TextPainter(
      text: TextSpan(
        text: num.toString(),
        style: TextStyle(
          fontFamily: 'Montserrat',
          fontWeight: FontWeight.w700,
          fontSize: 100,
          foreground: Paint()
            ..style = stroke ? PaintingStyle.stroke : PaintingStyle.fill
            ..strokeWidth = stroke ? 3 : 0 
            ..color = stroke ? MyColors.activeIconColor : MyColors.backgroundColor,
        ),
      ),
      textDirection: TextDirection.ltr,
    );

    textPainter.layout();
    textPainter.paint(canvas, const Offset(0, 0)); // Raqamni chizish
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}