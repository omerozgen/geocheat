import 'package:flutter/material.dart';
import 'dart:math';

class KureCapPainter extends StatelessWidget {
  final double size;
  const KureCapPainter({super.key, this.size = 180});

  @override
  Widget build(BuildContext context) {
    return CustomPaint(size: Size(size, size), painter: _KureCapPainter());
  }
}

class _KureCapPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = size.width * 0.32;
    // Küre gövdesi
    final spherePaint = Paint()
      ..color = Colors.blue[100]!
      ..style = PaintingStyle.fill;
    canvas.drawCircle(center, radius, spherePaint);
    final borderPaint = Paint()
      ..color = Colors.brown
      ..style = PaintingStyle.stroke
      ..strokeWidth = 3;
    canvas.drawCircle(center, radius, borderPaint);
    // Çap çizgisi
    final capPaint = Paint()
      ..color = Colors.red
      ..strokeWidth = 3;
    canvas.drawLine(
      Offset(center.dx - radius, center.dy),
      Offset(center.dx + radius, center.dy),
      capPaint,
    );
    // 'd' etiketi
    final textStyle = TextStyle(
      color: Colors.red,
      fontSize: 18,
      fontWeight: FontWeight.bold,
    );
    final labelPos = Offset(center.dx - 10, center.dy - 24);
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
