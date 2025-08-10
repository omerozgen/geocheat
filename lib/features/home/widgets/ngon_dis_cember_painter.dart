import 'package:flutter/material.dart';
import 'dart:math';

class NgonDisCemberPainter extends StatelessWidget {
  final double size;
  const NgonDisCemberPainter({this.size = 180, super.key});

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: Size(size, size),
      painter: _NgonDisCemberPainter(),
    );
  }
}

class _NgonDisCemberPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final n = 7;
    final r = size.width * 0.38;
    final center = Offset(size.width / 2, size.height / 2);
    final paint = Paint()
      ..color = Colors.blueAccent
      ..strokeWidth = 2.5
      ..style = PaintingStyle.stroke;
    final circlePaint = Paint()
      ..color = Colors.orange
      ..strokeWidth = 3
      ..style = PaintingStyle.stroke;
    final radiusPaint = Paint()
      ..color = Colors.orange
      ..strokeWidth = 3
      ..style = PaintingStyle.stroke;
    List<Offset> points = [];
    for (int i = 0; i < n; i++) {
      double angle = (2 * pi * i) / n - pi / 2;
      points.add(center + Offset(r * cos(angle), r * sin(angle)));
    }
    // Çokgeni çiz
    for (int i = 0; i < n; i++) {
      canvas.drawLine(points[i], points[(i + 1) % n], paint);
    }
    // Çevrel çemberi çiz
    canvas.drawCircle(center, r, circlePaint);
    // Yarıçapı çiz ve 'R' harfi
    canvas.drawLine(center, points[0], radiusPaint);
    final textPainter = TextPainter(
      text: const TextSpan(
        text: 'R',
        style: TextStyle(
          color: Colors.orange,
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
      ),
      textDirection: TextDirection.ltr,
    )..layout();
    final labelOffset = center + (points[0] - center) * 0.5 + Offset(0, -10);
    textPainter.paint(
      canvas,
      labelOffset - Offset(textPainter.width / 2, textPainter.height / 2),
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
