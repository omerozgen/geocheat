import 'package:flutter/material.dart';
import 'dart:math';

class ParalelkenarKosedegenPainter extends StatelessWidget {
  final double size;
  const ParalelkenarKosedegenPainter({super.key, this.size = 180});

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: Size(size, size),
      painter: _ParalelkenarKosedegenPainter(),
    );
  }
}

class _ParalelkenarKosedegenPainter extends CustomPainter {
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
    // Köşegenler
    final diagPaint1 = Paint()
      ..color = Colors.red
      ..strokeWidth = 3;
    final diagPaint2 = Paint()
      ..color = Colors.green[700]!
      ..strokeWidth = 3;
    canvas.drawLine(p1, p3, diagPaint1);
    canvas.drawLine(p2, p4, diagPaint2);
    // 'd₁' etiketi
    final textStyle1 = TextStyle(
      color: Colors.red,
      fontSize: 18,
      fontWeight: FontWeight.bold,
    );
    final labelPos1 = Offset((p1.dx + p3.dx) / 2 + 8, (p1.dy + p3.dy) / 2 - 8);
    _drawText(canvas, 'd₁', labelPos1, textStyle1);
    // 'd₂' etiketi
    final textStyle2 = TextStyle(
      color: Colors.green[900],
      fontSize: 18,
      fontWeight: FontWeight.bold,
    );
    final labelPos2 = Offset((p2.dx + p4.dx) / 2 - 18, (p2.dy + p4.dy) / 2 + 8);
    _drawText(canvas, 'd₂', labelPos2, textStyle2);
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
