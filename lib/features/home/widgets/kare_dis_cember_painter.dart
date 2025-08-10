import 'package:flutter/material.dart';
import 'dart:math';

class KareDisCemberPainter extends StatelessWidget {
  final double size;
  const KareDisCemberPainter({super.key, this.size = 180});

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: Size(size, size),
      painter: _KareDisCemberPainter(),
    );
  }
}

class _KareDisCemberPainter extends CustomPainter {
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
    // Dış çember
    final R = side / sqrt(2) / 2 * 2;
    final circlePaint = Paint()
      ..color = Colors.purple.withOpacity(0.22)
      ..style = PaintingStyle.fill;
    canvas.drawCircle(center, R, circlePaint);
    final circleBorder = Paint()
      ..color = Colors.purple[900]!
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2;
    canvas.drawCircle(center, R, circleBorder);
    // 'R' etiketi
    final textStyle = TextStyle(
      color: Colors.purple[900],
      fontSize: 16,
      fontWeight: FontWeight.bold,
    );
    final labelPos = Offset(center.dx + R / 2 - 6, center.dy - 24);
    _drawText(canvas, 'R', labelPos, textStyle);
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
