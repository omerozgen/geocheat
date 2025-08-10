import 'package:flutter/material.dart';
import 'dart:math' as math;

class DaireDilimiAlanPainter extends StatelessWidget {
  final double size;
  const DaireDilimiAlanPainter({super.key, this.size = 180});

  @override
  Widget build(BuildContext context) {
    return CustomPaint(size: Size(size, size), painter: _DaireDilimiPainter());
  }
}

class _DaireDilimiPainter extends CustomPainter {
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

    // Dilim açıları (örnek 60°)
    final startAngle = -1.0; // radians
    final sweepAngle = 1.0472; // ~60°

    final sectorPaint = Paint()
      ..color = Colors.blueAccent.withOpacity(0.18)
      ..style = PaintingStyle.fill;

    final rect = Rect.fromCircle(center: center, radius: radius);
    final path = Path()
      ..moveTo(center.dx, center.dy)
      ..arcTo(rect, startAngle, sweepAngle, false)
      ..close();
    canvas.drawPath(path, sectorPaint);

    // Yarıçap çizgileri
    final r1 = Offset(
      center.dx + radius * math.cos(startAngle),
      center.dy + radius * math.sin(startAngle),
    );
    final r2 = Offset(
      center.dx + radius * math.cos(startAngle + sweepAngle),
      center.dy + radius * math.sin(startAngle + sweepAngle),
    );
    canvas.drawLine(center, r1, circlePaint);
    canvas.drawLine(center, r2, circlePaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
