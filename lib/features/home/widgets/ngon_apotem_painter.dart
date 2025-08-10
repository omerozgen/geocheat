import 'package:flutter/material.dart';
import 'dart:math';

class NgonApotemPainter extends StatelessWidget {
  final double size;
  const NgonApotemPainter({this.size = 180, super.key});

  @override
  Widget build(BuildContext context) {
    return CustomPaint(size: Size(size, size), painter: _NgonApotemPainter());
  }
}

class _NgonApotemPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final n = 7;
    final r = size.width * 0.38;
    final center = Offset(size.width / 2, size.height / 2);
    final paint = Paint()
      ..color = Colors.blueAccent
      ..strokeWidth = 2.5
      ..style = PaintingStyle.stroke;
    final apotemPaint = Paint()
      ..color = Colors.orange
      ..strokeWidth = 4
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
    // Apotemi çiz (merkezden ilk kenara dik)
    final mid = Offset(
      (points[0].dx + points[1].dx) / 2,
      (points[0].dy + points[1].dy) / 2,
    );
    canvas.drawLine(center, mid, apotemPaint);
    // 'ap' etiketi
    final textPainter = TextPainter(
      text: const TextSpan(
        text: 'ap',
        style: TextStyle(
          color: Colors.orange,
          fontSize: 22,
          fontWeight: FontWeight.bold,
        ),
      ),
      textDirection: TextDirection.ltr,
    )..layout();
    final labelOffset = center + (mid - center) * 0.5 + Offset(0, 8);
    textPainter.paint(
      canvas,
      labelOffset - Offset(textPainter.width / 2, textPainter.height / 2),
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
