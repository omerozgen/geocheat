import 'package:flutter/material.dart';
import 'dart:math';

class YamukTabanPainter extends StatelessWidget {
  final double size;
  const YamukTabanPainter({super.key, this.size = 180});

  @override
  Widget build(BuildContext context) {
    return CustomPaint(size: Size(size, size), painter: _YamukTabanPainter());
  }
}

class _YamukTabanPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final offsetX = size.width * 0.18;
    final offsetY = size.height * 0.28;
    final wTop = size.width * 0.44;
    final wBottom = size.width * 0.64;
    final h = size.height * 0.36;
    final skew = size.width * 0.12;
    final p1 = Offset(offsetX + skew, offsetY);
    final p2 = Offset(offsetX + skew + wTop, offsetY);
    final p3 = Offset(offsetX + wBottom, offsetY + h);
    final p4 = Offset(offsetX, offsetY + h);
    // Gövde
    final fillPaint = Paint()
      ..color = Colors.blue[100]!
      ..style = PaintingStyle.fill;
    final path = Path()
      ..moveTo(p1.dx, p1.dy)
      ..lineTo(p2.dx, p2.dy)
      ..lineTo(p3.dx, p3.dy)
      ..lineTo(p4.dx, p4.dy)
      ..close();
    canvas.drawPath(path, fillPaint);
    final borderPaint = Paint()
      ..color = Colors.brown
      ..style = PaintingStyle.stroke
      ..strokeWidth = 3;
    canvas.drawPath(path, borderPaint);
    // Taban vurgusu
    final basePaint = Paint()
      ..color = Colors.red
      ..strokeWidth = 4;
    canvas.drawLine(p4, p3, basePaint);
    // 'a' etiketi
    final textStyle = TextStyle(
      color: Colors.red,
      fontSize: 18,
      fontWeight: FontWeight.bold,
    );
    final labelPos = Offset((p4.dx + p3.dx) / 2 - 8, p4.dy + 8);
    _drawText(canvas, 'a', labelPos, textStyle);
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
