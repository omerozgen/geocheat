import 'package:flutter/material.dart';
import 'dart:math' as math;

class DaireParcasiAlanPainter extends StatelessWidget {
  final double size;
  const DaireParcasiAlanPainter({super.key, this.size = 180});

  @override
  Widget build(BuildContext context) {
    return CustomPaint(size: Size(size, size), painter: _DaireParcasiPainter());
  }
}

class _DaireParcasiPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = size.width * 0.38;

    final circlePaint = Paint()
      ..color = Colors.blueAccent
      ..style = PaintingStyle.stroke
      ..strokeWidth = 3;

    // Daire
    canvas.drawCircle(center, radius, circlePaint);

    // Segment için açı
    final startAngle = -0.8;
    final sweepAngle = 1.2; // < 180° örnek segment
    final rect = Rect.fromCircle(center: center, radius: radius);

    // Yay
    final arcPath = Path()..addArc(rect, startAngle, sweepAngle);

    // Kiriş
    final p1 = Offset(
      center.dx + radius * math.cos(startAngle),
      center.dy + radius * math.sin(startAngle),
    );
    final p2 = Offset(
      center.dx + radius * math.cos(startAngle + sweepAngle),
      center.dy + radius * math.sin(startAngle + sweepAngle),
    );

    final segmentPaint = Paint()
      ..color = Colors.blueAccent.withOpacity(0.18)
      ..style = PaintingStyle.fill;

    final path = Path()
      ..moveTo(p1.dx, p1.dy)
      ..arcTo(rect, startAngle, sweepAngle, false)
      ..lineTo(p2.dx, p2.dy)
      ..close();
    canvas.drawPath(path, segmentPaint);

    canvas.drawLine(p1, p2, circlePaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
