import 'package:flutter/material.dart';
import 'dart:math';

class ElipsDenklemiPainter extends StatelessWidget {
  final double size;
  const ElipsDenklemiPainter({super.key, this.size = 180});

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: Size(size, size),
      painter: _ElipsDenklemiPainter(),
    );
  }
}

class _ElipsDenklemiPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final double margin = 24;
    final double w = size.width;
    final double h = size.height;
    final double x0 = margin;
    final double x1 = w - margin;
    final double y0 = h - margin;
    final double y1 = margin;

    // Eksenler
    final axisPaint = Paint()
      ..color = Colors.grey[700]!
      ..strokeWidth = 2;
    // x ekseni
    canvas.drawLine(Offset(x0, y0), Offset(x1, y0), axisPaint);
    // y ekseni
    canvas.drawLine(Offset(x0, y0), Offset(x0, y1), axisPaint);

    // Elips merkezi (h, k), büyük yarı eksen a, küçük yarı eksen b
    final double h0 = x0 + (x1 - x0) * 0.55;
    final double k0 = y0 - (y0 - y1) * 0.45;
    final double a = (x1 - x0) * 0.33; // Biraz daha büyük elips için
    final double b = (y0 - y1) * 0.23; // Biraz daha büyük elips için
    final center = Offset(h0, k0);

    // Elips
    final elipsRect = Rect.fromCenter(
      center: center,
      width: a * 2,
      height: b * 2,
    );
    final elipsPaint = Paint()
      ..color = Colors.purple.withOpacity(0.13)
      ..style = PaintingStyle.fill;
    canvas.drawOval(elipsRect, elipsPaint);
    final borderPaint = Paint()
      ..color = Colors.purple
      ..style = PaintingStyle.stroke
      ..strokeWidth = 3;
    canvas.drawOval(elipsRect, borderPaint);

    // Merkez noktası
    final centerPaint = Paint()
      ..color = Colors.red
      ..strokeWidth = 2;
    canvas.drawCircle(center, 5, centerPaint);

    // Büyük yarı eksen (a)
    final aPaint = Paint()
      ..color = Colors.green
      ..strokeWidth = 3;
    canvas.drawLine(center, Offset(h0 + a, k0), aPaint);
    // Küçük yarı eksen (b)
    final bPaint = Paint()
      ..color = Colors.orange
      ..strokeWidth = 3;
    canvas.drawLine(center, Offset(h0, k0 - b), bPaint);

    // Etiketler
    final textStyle = TextStyle(color: Colors.black, fontSize: 14);
    // x, y eksenleri
    _drawText(canvas, 'x', Offset(x1 - 10, y0 + 6), textStyle);
    _drawText(canvas, 'y', Offset(x0 - 16, y1 - 2), textStyle);
    // Merkez (h, k)
    _drawText(
      canvas,
      '(h, k)',
      Offset(h0 - 32, k0 - 24),
      textStyle.copyWith(color: Colors.red),
    );
    // a ve b yarı eksenleri
    _drawText(
      canvas,
      'a',
      Offset(h0 + a / 2, k0 - 18),
      textStyle.copyWith(color: Colors.green),
    );
    _drawText(
      canvas,
      'b',
      Offset(h0 - 18, k0 - b / 2),
      textStyle.copyWith(color: Colors.orange),
    );
    // Elips denklemi etiketi
    _drawText(
      canvas,
      '((x-h)²/a²) + ((y-k)²/b²) = 1',
      Offset(center.dx - 64, center.dy + b + 18),
      textStyle.copyWith(color: Colors.purple),
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
