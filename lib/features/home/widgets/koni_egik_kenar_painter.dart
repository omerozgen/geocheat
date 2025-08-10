import 'package:flutter/material.dart';
import 'dart:math';

class KoniEgikKenarPainter extends StatelessWidget {
  final double size;
  const KoniEgikKenarPainter({super.key, this.size = 180});

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: Size(size, size),
      painter: _KoniEgikKenarPainter(),
    );
  }
}

class _KoniEgikKenarPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height * 0.7);
    final radius = size.width * 0.28;
    final apex = Offset(size.width / 2, size.height * 0.18);
    // Taban dairesi
    final borderPaint = Paint()
      ..color = Colors.brown
      ..style = PaintingStyle.stroke
      ..strokeWidth = 3;
    canvas.drawCircle(center, radius, borderPaint);
    canvas.drawLine(apex, Offset(center.dx - radius, center.dy), borderPaint);
    canvas.drawLine(apex, Offset(center.dx + radius, center.dy), borderPaint);
    // Eğik kenar çizgisi (apex'ten taban sağ kenara)
    final lPaint = Paint()
      ..color = Colors.red
      ..strokeWidth = 3;
    canvas.drawLine(apex, Offset(center.dx + radius, center.dy), lPaint);
    // 'l' etiketi
    final textStyle = TextStyle(
      color: Colors.red,
      fontSize: 18,
      fontWeight: FontWeight.bold,
    );
    final labelPos = Offset(
      (apex.dx + center.dx + radius) / 2 + 6,
      (apex.dy + center.dy) / 2 - 10,
    );
    _drawText(canvas, 'l', labelPos, textStyle);
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
