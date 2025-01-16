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
          fontSize: 100, // Matn o'lchami
          foreground: Paint()
            ..style = stroke ? PaintingStyle.stroke : PaintingStyle.fill // Agar stroke bo'lsa hoshiyasi chiziladi
            ..strokeWidth = stroke ? 3 : 0 // Hoshiyaning kengligi (agar stroke bo'lsa)
            ..color = stroke ? MyColors.activeIconColor : MyColors.backgroundColor, // Hoshiyaning rangi ko'k, ichki rangi esa kulrang
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