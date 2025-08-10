import 'package:flutter/material.dart';
import 'dart:math';

class NgonIcAciPainter extends StatelessWidget {
  final double size;
  const NgonIcAciPainter({this.size = 180, super.key});

  @override
  Widget build(BuildContext context) {
    return CustomPaint(size: Size(size, size), painter: _NgonIcAciPainter());
  }
}

class _NgonIcAciPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final n = 7;
    final r = size.width * 0.38;
    final center = Offset(size.width / 2, size.height / 2);
    final paint = Paint()
      ..color = Colors.blueAccent
      ..strokeWidth = 2.5
      ..style = PaintingStyle.stroke;
    final anglePaint = Paint()
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
    // İç açı yayını çiz (ilk köşe)
    final arcRect = Rect.fromCircle(
      center: points[0],
      radius: size.width * 0.13,
    );
    canvas.drawArc(
      arcRect,
      (2 * pi * (n - 1) / n) - pi / 2,
      (2 * pi / n),
      false,
      anglePaint,
    );
    // Açıya 'α' harfi
    final textPainter = TextPainter(
      text: const TextSpan(
        text: 'α',
        style: TextStyle(
          color: Colors.orange,
          fontSize: 28,
          fontWeight: FontWeight.bold,
        ),
      ),
      textDirection: TextDirection.ltr,
    )..layout();
    final labelOffset = points[0] + Offset(18, 8);
    textPainter.paint(canvas, labelOffset);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
