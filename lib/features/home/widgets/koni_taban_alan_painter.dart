import 'package:flutter/material.dart';
import 'dart:math';

class KoniTabanAlanPainter extends StatelessWidget {
  final double size;
  const KoniTabanAlanPainter({super.key, this.size = 180});

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: Size(size, size),
      painter: _KoniTabanAlanPainter(),
    );
  }
}

class _KoniTabanAlanPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height * 0.7);
    final radius = size.width * 0.28;
    // Tabanı vurgulu çiz
    final areaPaint = Paint()
      ..color = Colors.blue.withOpacity(0.25)
      ..style = PaintingStyle.fill;
    canvas.drawCircle(center, radius, areaPaint);
    // Kenar çizgileri
    final borderPaint = Paint()
      ..color = Colors.brown
      ..style = PaintingStyle.stroke
      ..strokeWidth = 3;
    canvas.drawCircle(center, radius, borderPaint);
    // Gövde çizgileri (koni yanları)
    final apex = Offset(size.width / 2, size.height * 0.18);
    canvas.drawLine(apex, Offset(center.dx - radius, center.dy), borderPaint);
    canvas.drawLine(apex, Offset(center.dx + radius, center.dy), borderPaint);
    // 'A_taban' etiketi
    final textStyle = TextStyle(
      color: Colors.blue[900],
      fontSize: 16,
      fontWeight: FontWeight.bold,
    );
    final labelPos = Offset(center.dx - 24, center.dy - 10);
    _drawText(canvas, 'A_taban', labelPos, textStyle);
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
