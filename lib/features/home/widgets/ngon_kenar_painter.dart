import 'package:flutter/material.dart';
import 'dart:math';

class NgonKenarPainter extends StatelessWidget {
  final double size;
  const NgonKenarPainter({this.size = 180, super.key});

  @override
  Widget build(BuildContext context) {
    return CustomPaint(size: Size(size, size), painter: _NgonKenarPainter());
  }
}

class _NgonKenarPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final n = 7;
    final r = size.width * 0.38;
    final center = Offset(size.width / 2, size.height / 2);
    final paint = Paint()
      ..color = Colors.blueAccent
      ..strokeWidth = 2.5
      ..style = PaintingStyle.stroke;
    final highlightPaint = Paint()
      ..color = Colors.orange
      ..strokeWidth = 4
      ..style = PaintingStyle.stroke;
    List<Offset> points = [];
    for (int i = 0; i < n; i++) {
      double angle = (2 * 3.141592653589793 * i) / n - 3.141592653589793 / 2;
      points.add(center + Offset(r * cos(angle), r * sin(angle)));
    }
    // Çokgeni çiz
    for (int i = 0; i < n; i++) {
      canvas.drawLine(points[i], points[(i + 1) % n], paint);
    }
    // Bir kenarı vurgula
    canvas.drawLine(points[0], points[1], highlightPaint);
    // Kenar ortasına 'a' harfi
    final textPainter = TextPainter(
      text: const TextSpan(
        text: 'a',
        style: TextStyle(
          color: Colors.orange,
          fontSize: 28,
          fontWeight: FontWeight.bold,
        ),
      ),
      textDirection: TextDirection.ltr,
    )..layout();
    final mid = Offset(
      (points[0].dx + points[1].dx) / 2,
      (points[0].dy + points[1].dy) / 2,
    );
    textPainter.paint(
      canvas,
      mid - Offset(textPainter.width / 2, textPainter.height / 2),
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
