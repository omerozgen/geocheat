import 'package:flutter/material.dart';
import 'dart:math';

class SilindirYanAlanPainter extends StatelessWidget {
  final double size;
  const SilindirYanAlanPainter({super.key, this.size = 180});

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: Size(size, size),
      painter: _SilindirYanAlanPainter(),
    );
  }
}

class _SilindirYanAlanPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height * 0.7);
    final radius = size.width * 0.28;
    // Yan yüzeyi vurgulu çiz (dikdörtgen gibi)
    final areaPaint = Paint()
      ..color = Colors.green.withOpacity(0.22)
      ..style = PaintingStyle.fill;
    final rect = Rect.fromLTWH(
      center.dx - radius,
      center.dy - size.height * 0.4,
      radius * 2,
      size.height * 0.4,
    );
    canvas.drawRect(rect, areaPaint);
    // Kenar çizgileri
    final borderPaint = Paint()
      ..color = Colors.brown
      ..style = PaintingStyle.stroke
      ..strokeWidth = 3;
    // Alt daire
    canvas.drawCircle(center, radius, borderPaint);
    // Yan çizgiler
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
    // 'A_yan' etiketi
    final textStyle = TextStyle(
      color: Colors.green[900],
      fontSize: 16,
      fontWeight: FontWeight.bold,
    );
    final labelPos = Offset(
      center.dx + radius - 40,
      center.dy - size.height * 0.2,
    );
    _drawText(canvas, 'A_yan', labelPos, textStyle);
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
