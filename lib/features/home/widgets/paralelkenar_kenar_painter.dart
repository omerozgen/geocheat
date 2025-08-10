import 'package:flutter/material.dart';
import 'dart:math';

class ParalelkenarKenarPainter extends StatelessWidget {
  final double size;
  const ParalelkenarKenarPainter({super.key, this.size = 180});

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: Size(size, size),
      painter: _ParalelkenarKenarPainter(),
    );
  }
}

class _ParalelkenarKenarPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final offsetX = size.width * 0.18;
    final offsetY = size.height * 0.28;
    final w = size.width * 0.64;
    final h = size.height * 0.36;
    final skew = size.width * 0.18;
    final p1 = Offset(offsetX + skew, offsetY);
    final p2 = Offset(offsetX + w, offsetY);
    final p3 = Offset(offsetX + w - skew, offsetY + h);
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
    // Kenar vurgusu
    final edgePaint = Paint()
      ..color = Colors.red
      ..strokeWidth = 4;
    canvas.drawLine(p1, p2, edgePaint);
    // 'a' etiketi
    final textStyle = TextStyle(
      color: Colors.red,
      fontSize: 18,
      fontWeight: FontWeight.bold,
    );
    final labelPos = Offset((p1.dx + p2.dx) / 2 - 8, p1.dy - 24);
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
