import 'package:flutter/material.dart';
import 'dart:math';

class SilindirTabanAlanPainter extends StatelessWidget {
  final double size;
  const SilindirTabanAlanPainter({super.key, this.size = 180});

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: Size(size, size),
      painter: _SilindirTabanAlanPainter(),
    );
  }
}

class _SilindirTabanAlanPainter extends CustomPainter {
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
    // Gövde çizgileri (silindirin yanları)
    canvas.drawLine(
      Offset(center.dx - radius, center.dy),
      Offset(center.dx - radius, center.dy - size.height * 0.4),
      borderPaint,
    );
    canvas.drawLine(
      Offset(center.dx + radius, center.dy),
      Offset(center.dx + radius, center.dy - size.height * 0.4),
      borderPaint,
    );
    // Üst daire
    canvas.drawOval(
      Rect.fromCenter(
        center: Offset(center.dx, center.dy - size.height * 0.4),
        width: radius * 2,
        height: radius * 0.7,
      ),
      borderPaint,
    );
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
