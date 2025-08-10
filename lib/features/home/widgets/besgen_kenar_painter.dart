import 'package:flutter/material.dart';
import 'dart:math';

class BesgenKenarPainter extends StatelessWidget {
  final double size;
  const BesgenKenarPainter({super.key, this.size = 180});

  @override
  Widget build(BuildContext context) {
    return CustomPaint(size: Size(size, size), painter: _BesgenKenarPainter());
  }
}

class _BesgenKenarPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final r = size.width * 0.36;
    final n = 5;
    final points = List.generate(n, (i) {
      final angle = -pi / 2 + 2 * pi * i / n;
      return Offset(center.dx + r * cos(angle), center.dy + r * sin(angle));
    });
    // Gövde
    final fillPaint = Paint()
      ..color = Colors.blue[100]!
      ..style = PaintingStyle.fill;
    final path = Path()..moveTo(points[0].dx, points[0].dy);
    for (var p in points.skip(1)) {
      path.lineTo(p.dx, p.dy);
    }
    path.close();
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
    canvas.drawLine(points[0], points[1], edgePaint);
    // 'a' etiketi
    final textStyle = TextStyle(
      color: Colors.red,
      fontSize: 18,
      fontWeight: FontWeight.bold,
    );
    final labelPos = Offset(
      (points[0].dx + points[1].dx) / 2 - 8,
      (points[0].dy + points[1].dy) / 2 - 24,
    );
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
