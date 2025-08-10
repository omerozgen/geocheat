import 'package:flutter/material.dart';
import 'dart:math';

class NgonIcCemberPainter extends StatelessWidget {
  final double size;
  const NgonIcCemberPainter({this.size = 180, super.key});

  @override
  Widget build(BuildContext context) {
    return CustomPaint(size: Size(size, size), painter: _NgonIcCemberPainter());
  }
}

class _NgonIcCemberPainter extends CustomPainter {
  Offset _normalize(Offset v) {
    final len = v.distance;
    if (len == 0) return v;
    return Offset(v.dx / len, v.dy / len);
  }

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
    // İç çemberin yarıçapı (apotem)
    final ap = r * cos(pi / n);
    // İç çemberi çiz
    canvas.drawCircle(center, ap, circlePaint);
    // Yarıçapı çiz ve 'ap' harfi
    final mid = Offset(
      (points[0].dx + points[1].dx) / 2,
      (points[0].dy + points[1].dy) / 2,
    );
    final apEnd = center + _normalize(mid - center) * ap;
    canvas.drawLine(center, apEnd, radiusPaint);
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
    final labelOffset = center + (apEnd - center) * 0.5 + Offset(0, 8);
    textPainter.paint(
      canvas,
      labelOffset - Offset(textPainter.width / 2, textPainter.height / 2),
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
