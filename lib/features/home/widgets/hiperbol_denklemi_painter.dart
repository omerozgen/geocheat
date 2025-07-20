import 'package:flutter/material.dart';
import 'dart:math';

class HiperbolDenklemiPainter extends StatelessWidget {
  final double size;
  const HiperbolDenklemiPainter({super.key, this.size = 180});

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: Size(size, size),
      painter: _HiperbolDenklemiPainter(),
    );
  }
}

class _HiperbolDenklemiPainter extends CustomPainter {
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

    // Hiperbol merkezi (h, k), a ve b
    final double h0 = x0 + (x1 - x0) * 0.55;
    final double k0 = y0 - (y0 - y1) * 0.45;
    final double a = (x1 - x0) * 0.28;
    final double b = (y0 - y1) * 0.18;
    final center = Offset(h0, k0);

    // Hiperbol kolları (x-y düzleminde)
    final points1 = <Offset>[];
    final points2 = <Offset>[];
    for (double x = -a * 1.2; x <= a * 1.2; x += 1) {
      final y = b * sqrt(1 + pow(x / a, 2));
      points1.add(Offset(h0 + x, k0 - y));
      points2.add(Offset(h0 + x, k0 + y));
    }
    final hiperbolPaint = Paint()
      ..color = Colors.teal
      ..strokeWidth = 3
      ..style = PaintingStyle.stroke;
    final path1 = Path()..moveTo(points1.first.dx, points1.first.dy);
    for (final p in points1) {
      path1.lineTo(p.dx, p.dy);
    }
    final path2 = Path()..moveTo(points2.first.dx, points2.first.dy);
    for (final p in points2) {
      path2.lineTo(p.dx, p.dy);
    }
    canvas.drawPath(path1, hiperbolPaint);
    canvas.drawPath(path2, hiperbolPaint);

    // Merkez noktası
    final centerPaint = Paint()
      ..color = Colors.red
      ..strokeWidth = 2;
    canvas.drawCircle(center, 5, centerPaint);

    // Asimptotlar: y = ±(b/a)(x-h) + k
    final asyPaint = Paint()
      ..color = Colors.orange
      ..strokeWidth = 2
      ..style = PaintingStyle.stroke;
    final asy1 = Path();
    final asy2 = Path();
    asy1.moveTo(x0, (b / a) * (x0 - h0) + k0);
    asy1.lineTo(x1, (b / a) * (x1 - h0) + k0);
    asy2.moveTo(x0, -(b / a) * (x0 - h0) + k0);
    asy2.lineTo(x1, -(b / a) * (x1 - h0) + k0);
    canvas.drawPath(asy1, asyPaint);
    canvas.drawPath(asy2, asyPaint);

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
    // Asimptot etiketi
    _drawText(
      canvas,
      'Asimptotlar',
      Offset(h0 + a / 2, k0 + b + 8),
      textStyle.copyWith(color: Colors.orange),
    );
    // Hiperbol denklemi etiketi
    _drawText(
      canvas,
      '((x-h)²/a²) - ((y-k)²/b²) = 1',
      Offset(center.dx - 64, center.dy + b + 28),
      textStyle.copyWith(color: Colors.teal),
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
