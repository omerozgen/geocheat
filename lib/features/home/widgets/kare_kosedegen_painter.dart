import 'package:flutter/material.dart';
import 'dart:math';

class KareKosedegenPainter extends StatelessWidget {
  final double size;
  const KareKosedegenPainter({super.key, this.size = 180});

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: Size(size, size),
      painter: _KareKosedegenPainter(),
    );
  }
}

class _KareKosedegenPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final offset = size.width * 0.18;
    final side = size.width * 0.64;
    final topLeft = Offset(offset, offset);
    final topRight = Offset(offset + side, offset);
    final bottomLeft = Offset(offset, offset + side);
    final bottomRight = Offset(offset + side, offset + side);
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
    // Köşegen çizgisi
    final diagPaint = Paint()
      ..color = Colors.red
      ..strokeWidth = 3;
    canvas.drawLine(topLeft, bottomRight, diagPaint);
    // 'd' etiketi
    final textStyle = TextStyle(
      color: Colors.red,
      fontSize: 18,
      fontWeight: FontWeight.bold,
    );
    final labelPos = Offset(
      (topLeft.dx + bottomRight.dx) / 2 + 8,
      (topLeft.dy + bottomRight.dy) / 2 - 8,
    );
    _drawText(canvas, 'd', labelPos, textStyle);
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
