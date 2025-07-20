import 'package:flutter/material.dart';
import 'dart:math';

class EskenarUcgenAlanPainter extends StatelessWidget {
  final double size;
  const EskenarUcgenAlanPainter({super.key, this.size = 180});

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: Size(size, size),
      painter: _EskenarUcgenAlanPainter(),
    );
  }
}

class _EskenarUcgenAlanPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final double margin = size.width * 0.18;
    final double base = size.width * 0.64;
    final double height = size.height * 0.56;
    final Offset a = Offset(margin, size.height - margin);
    final Offset b = Offset(margin + base, size.height - margin);
    final Offset c = Offset(size.width / 2, size.height - margin - height);

    final trianglePaint = Paint()
      ..color = Colors.teal.withOpacity(0.18)
      ..style = PaintingStyle.fill;
    final trianglePath = Path()
      ..moveTo(a.dx, a.dy)
      ..lineTo(b.dx, b.dy)
      ..lineTo(c.dx, c.dy)
      ..close();
    canvas.drawPath(trianglePath, trianglePaint);

    final borderPaint = Paint()
      ..color = Colors.teal
      ..style = PaintingStyle.stroke
      ..strokeWidth = 3;
    canvas.drawPath(trianglePath, borderPaint);

    final textStyle = TextStyle(color: Colors.black, fontSize: 15);
    // a kenarları
    _drawText(canvas, 'a', Offset((a.dx + b.dx) / 2 - 10, a.dy + 8), textStyle);
    _drawText(
      canvas,
      'a',
      Offset((a.dx + c.dx) / 2 - 18, (a.dy + c.dy) / 2 - 8),
      textStyle,
    );
    _drawText(
      canvas,
      'a',
      Offset((b.dx + c.dx) / 2 + 8, (b.dy + c.dy) / 2 - 10),
      textStyle,
    );
    // Alan etiketi
    _drawText(
      canvas,
      'Alan',
      Offset(size.width / 2 - 18, (a.dy + c.dy) / 2),
      textStyle.copyWith(fontSize: 14, color: Colors.teal),
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
