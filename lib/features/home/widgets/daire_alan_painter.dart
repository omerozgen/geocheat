import 'package:flutter/material.dart';
import 'dart:math';

class DaireAlanPainter extends StatelessWidget {
  final double size;
  const DaireAlanPainter({super.key, this.size = 180});

  @override
  Widget build(BuildContext context) {
    return CustomPaint(size: Size(size, size), painter: _DaireAlanPainter());
  }
}

class _DaireAlanPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = size.width * 0.35;

    // Alanı taralı göster (dairenin içi)
    final areaPaint = Paint()
      ..color = Colors.pink.withOpacity(0.2)
      ..style = PaintingStyle.fill;
    canvas.drawCircle(center, radius, areaPaint);

    // Dairenin kenarı
    final borderPaint = Paint()
      ..color = Colors.pink
      ..style = PaintingStyle.stroke
      ..strokeWidth = 3;
    canvas.drawCircle(center, radius, borderPaint);

    // Yarıçap çizgisi
    final rPaint = Paint()
      ..color = Colors.blue
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2;
    final rEnd = Offset(center.dx + radius, center.dy);
    canvas.drawLine(center, rEnd, rPaint);

    // Yarıçap etiketi
    final textStyle = TextStyle(color: Colors.blue, fontSize: 16);
    _drawText(
      canvas,
      'r',
      Offset(center.dx + radius / 2 + 4, center.dy - 18),
      textStyle,
    );
    // Alan etiketi
    _drawText(
      canvas,
      'Alan',
      center.translate(-18, 0),
      TextStyle(fontSize: 14, color: Colors.pink),
    );
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
