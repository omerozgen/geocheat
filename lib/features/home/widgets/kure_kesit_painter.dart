import 'package:flutter/material.dart';
import 'dart:math';

class KureKesitPainter extends StatelessWidget {
  final double size;
  const KureKesitPainter({super.key, this.size = 180});

  @override
  Widget build(BuildContext context) {
    return CustomPaint(size: Size(size, size), painter: _KureKesitPainter());
  }
}

class _KureKesitPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = size.width * 0.32;
    // Küre gövdesi
    final spherePaint = Paint()
      ..color = Colors.blue[100]!
      ..style = PaintingStyle.fill;
    canvas.drawCircle(center, radius, spherePaint);
    final borderPaint = Paint()
      ..color = Colors.brown
      ..style = PaintingStyle.stroke
      ..strokeWidth = 3;
    canvas.drawCircle(center, radius, borderPaint);
    // Kesit vurgusu (ortadan geçen bir daire)
    final kesitPaint = Paint()
      ..color = Colors.purple.withOpacity(0.22)
      ..style = PaintingStyle.fill;
    canvas.drawCircle(center, radius * 0.7, kesitPaint);
    // 'A_kesit' etiketi
    final textStyle = TextStyle(
      color: Colors.purple[900],
      fontSize: 16,
      fontWeight: FontWeight.bold,
    );
    final labelPos = Offset(center.dx - 24, center.dy - radius * 0.7 - 18);
    _drawText(canvas, 'A_kesit', labelPos, textStyle);
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
