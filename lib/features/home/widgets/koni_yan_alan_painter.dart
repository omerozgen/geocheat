import 'package:flutter/material.dart';
import 'dart:math';

class KoniYanAlanPainter extends StatelessWidget {
  final double size;
  const KoniYanAlanPainter({super.key, this.size = 180});

  @override
  Widget build(BuildContext context) {
    return CustomPaint(size: Size(size, size), painter: _KoniYanAlanPainter());
  }
}

class _KoniYanAlanPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height * 0.7);
    final radius = size.width * 0.28;
    final apex = Offset(size.width / 2, size.height * 0.18);
    // Yan yüzeyi vurgulu çiz (sol yan yüzey)
    final areaPaint = Paint()
      ..color = Colors.green.withOpacity(0.22)
      ..style = PaintingStyle.fill;
    final path = Path()
      ..moveTo(apex.dx, apex.dy)
      ..lineTo(center.dx - radius, center.dy)
      ..arcToPoint(
        Offset(center.dx + radius, center.dy),
        radius: Radius.circular(radius),
        clockwise: false,
      )
      ..close();
    canvas.drawPath(path, areaPaint);
    // Kenar çizgileri
    final borderPaint = Paint()
      ..color = Colors.brown
      ..style = PaintingStyle.stroke
      ..strokeWidth = 3;
    canvas.drawCircle(center, radius, borderPaint);
    canvas.drawLine(apex, Offset(center.dx - radius, center.dy), borderPaint);
    canvas.drawLine(apex, Offset(center.dx + radius, center.dy), borderPaint);
    // Removed textual label
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
