import 'package:flutter/material.dart';
import 'dart:math';

class CemberUzunluguPainter extends StatelessWidget {
  final double size;
  const CemberUzunluguPainter({super.key, this.size = 180});

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: Size(size, size),
      painter: _CemberUzunluguPainter(),
    );
  }
}

class _CemberUzunluguPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = size.width * 0.35;

    // Çemberin kenarı (çevreyi vurgula)
    final borderPaint = Paint()
      ..color = Colors.deepOrange
      ..style = PaintingStyle.stroke
      ..strokeWidth = 4;
    canvas.drawCircle(center, radius, borderPaint);

    // Yarıçap çizgisi
    final rPaint = Paint()
      ..color = Colors.blue
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2;
    final rEnd = Offset(center.dx + radius, center.dy);
    canvas.drawLine(center, rEnd, rPaint);

    // Yarıçap etiketi
    final textStyle = TextStyle(color: Colors.blue, fontSize: 16);
    _drawText(
      canvas,
      'r',
      Offset(center.dx + radius / 2 + 4, center.dy - 18),
      textStyle,
    );
    // Removed textual label
  }

  void _drawText(Canvas canvas, String text, Offset pos, TextStyle style) {
    final textSpan = TextSpan(text: text, style: style);
    final tp = TextPainter(text: textSpan, textDirection: TextDirection.ltr);
    tp.layout();
    tp.paint(canvas, pos);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
