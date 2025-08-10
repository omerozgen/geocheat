import 'package:flutter/material.dart';
import 'dart:math';

class SilindirYaricapPainter extends StatelessWidget {
  final double size;
  const SilindirYaricapPainter({super.key, this.size = 180});

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: Size(size, size),
      painter: _SilindirYaricapPainter(),
    );
  }
}

class _SilindirYaricapPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height * 0.7);
    final radius = size.width * 0.28;
    // Taban dairesi
    final borderPaint = Paint()
      ..color = Colors.brown
      ..style = PaintingStyle.stroke
      ..strokeWidth = 3;
    canvas.drawCircle(center, radius, borderPaint);
    // Yarıçap çizgisi
    final rPaint = Paint()
      ..color = Colors.red
      ..strokeWidth = 3;
    canvas.drawLine(center, Offset(center.dx + radius, center.dy), rPaint);
    // 'r' etiketi
    final textStyle = TextStyle(
      color: Colors.red,
      fontSize: 18,
      fontWeight: FontWeight.bold,
    );
    final labelPos = Offset(center.dx + radius / 2 - 6, center.dy - 24);
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
