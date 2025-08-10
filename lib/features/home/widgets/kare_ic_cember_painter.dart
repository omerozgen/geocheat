import 'package:flutter/material.dart';
import 'dart:math';

class KareIcCemberPainter extends StatelessWidget {
  final double size;
  const KareIcCemberPainter({super.key, this.size = 180});

  @override
  Widget build(BuildContext context) {
    return CustomPaint(size: Size(size, size), painter: _KareIcCemberPainter());
  }
}

class _KareIcCemberPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final offset = size.width * 0.18;
    final side = size.width * 0.64;
    final center = Offset(offset + side / 2, offset + side / 2);
    // Kare gövdesi
    final fillPaint = Paint()
      ..color = Colors.blue[100]!
      ..style = PaintingStyle.fill;
    canvas.drawRect(Rect.fromLTWH(offset, offset, side, side), fillPaint);
    final borderPaint = Paint()
      ..color = Colors.brown
      ..style = PaintingStyle.stroke
      ..strokeWidth = 3;
    canvas.drawRect(Rect.fromLTWH(offset, offset, side, side), borderPaint);
    // İç çember
    final r = side / 2;
    final circlePaint = Paint()
      ..color = Colors.green.withOpacity(0.22)
      ..style = PaintingStyle.fill;
    canvas.drawCircle(center, r, circlePaint);
    final circleBorder = Paint()
      ..color = Colors.green[900]!
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2;
    canvas.drawCircle(center, r, circleBorder);
    // 'r' etiketi
    final textStyle = TextStyle(
      color: Colors.green[900],
      fontSize: 16,
      fontWeight: FontWeight.bold,
    );
    final labelPos = Offset(center.dx + r / 2 - 6, center.dy - 24);
    _drawText(canvas, 'r', labelPos, textStyle);
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
