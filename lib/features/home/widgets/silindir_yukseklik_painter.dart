import 'package:flutter/material.dart';
import 'dart:math';

class SilindirYukseklikPainter extends StatelessWidget {
  final double size;
  const SilindirYukseklikPainter({super.key, this.size = 180});

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: Size(size, size),
      painter: _SilindirYukseklikPainter(),
    );
  }
}

class _SilindirYukseklikPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height * 0.7);
    final radius = size.width * 0.28;
    // Taban ve üst daire
    final borderPaint = Paint()
      ..color = Colors.brown
      ..style = PaintingStyle.stroke
      ..strokeWidth = 3;
    canvas.drawCircle(center, radius, borderPaint);
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
    canvas.drawOval(
      Rect.fromCenter(
        center: Offset(center.dx, center.dy - size.height * 0.4),
        width: radius * 2,
        height: radius * 0.7,
      ),
      borderPaint,
    );
    // Yükseklik ok çizgisi
    final arrowPaint = Paint()
      ..color = Colors.red
      ..strokeWidth = 3;
    final y1 = center.dy - size.height * 0.4;
    final y2 = center.dy;
    final x = center.dx + radius + 18;
    canvas.drawLine(Offset(x, y1), Offset(x, y2), arrowPaint);
    // Ok uçları
    canvas.drawLine(Offset(x, y1), Offset(x - 7, y1 + 12), arrowPaint);
    canvas.drawLine(Offset(x, y1), Offset(x + 7, y1 + 12), arrowPaint);
    canvas.drawLine(Offset(x, y2), Offset(x - 7, y2 - 12), arrowPaint);
    canvas.drawLine(Offset(x, y2), Offset(x + 7, y2 - 12), arrowPaint);
    // 'h' etiketi
    final textStyle = TextStyle(
      color: Colors.red,
      fontSize: 18,
      fontWeight: FontWeight.bold,
    );
    final labelPos = Offset(x + 6, (y1 + y2) / 2 - 10);
    _drawText(canvas, 'h', labelPos, textStyle);
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
