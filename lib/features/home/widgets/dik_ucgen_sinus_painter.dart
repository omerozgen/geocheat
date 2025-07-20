import 'package:flutter/material.dart';
import 'dart:math';

class DikUcgenSinusPainter extends StatelessWidget {
  final double size;
  const DikUcgenSinusPainter({super.key, this.size = 180});

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: Size(size, size),
      painter: _DikUcgenSinusPainter(),
    );
  }
}

class _DikUcgenSinusPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final double margin = size.width * 0.18;
    final double base = size.width * 0.64;
    final double height = size.height * 0.48;
    final Offset a = Offset(margin, size.height - margin);
    final Offset b = Offset(margin + base, size.height - margin);
    final Offset c = Offset(margin, size.height - margin - height);

    // Üçgenin alanı
    final trianglePaint = Paint()
      ..color = Colors.blue.withOpacity(0.13)
      ..style = PaintingStyle.fill;
    final trianglePath = Path()
      ..moveTo(a.dx, a.dy)
      ..lineTo(b.dx, b.dy)
      ..lineTo(c.dx, c.dy)
      ..close();
    canvas.drawPath(trianglePath, trianglePaint);

    // Kenar çizgileri
    final borderPaint = Paint()
      ..color = Colors.blue
      ..style = PaintingStyle.stroke
      ..strokeWidth = 3;
    canvas.drawPath(trianglePath, borderPaint);

    // Sinüs için karşı dik kenar (a) ve hipotenüs (c) renkli
    final aPaint = Paint()
      ..color = Colors.red
      ..strokeWidth = 4;
    canvas.drawLine(a, c, aPaint);
    final cPaint = Paint()
      ..color = Colors.green
      ..strokeWidth = 4;
    canvas.drawLine(b, c, cPaint);

    final textStyle = TextStyle(color: Colors.black, fontSize: 15);
    // a kenarı (karşı dik kenar)
    _drawText(
      canvas,
      'a',
      Offset((a.dx + c.dx) / 2 - 18, (a.dy + c.dy) / 2 - 8),
      textStyle.copyWith(color: Colors.red),
    );
    // b kenarı
    _drawText(canvas, 'b', Offset((a.dx + b.dx) / 2 - 10, a.dy + 8), textStyle);
    // c kenarı (hipotenüs)
    _drawText(
      canvas,
      'c',
      Offset((b.dx + c.dx) / 2 + 8, (b.dy + c.dy) / 2 - 10),
      textStyle.copyWith(color: Colors.green),
    );
    // Sinüs etiketi
    _drawText(
      canvas,
      'sin(θ) = a / c',
      Offset((a.dx + c.dx) / 2 - 18, (a.dy + c.dy) / 2 - 28),
      textStyle.copyWith(fontSize: 14, color: Colors.blue),
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
