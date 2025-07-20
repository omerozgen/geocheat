import 'package:flutter/material.dart';
import 'dart:math';

class DaireDenklemiPainter extends StatelessWidget {
  final double size;
  const DaireDenklemiPainter({super.key, this.size = 180});

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: Size(size, size),
      painter: _DaireDenklemiPainter(),
    );
  }
}

class _DaireDenklemiPainter extends CustomPainter {
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

    // Daire merkezi (a, b) ve yarıçap r
    final double a = x0 + (x1 - x0) * 0.55;
    final double b = y0 - (y0 - y1) * 0.45;
    final double r = min(w, h) * 0.28;
    final center = Offset(a, b);

    // Daire
    final circlePaint = Paint()
      ..color = Colors.blue.withOpacity(0.13)
      ..style = PaintingStyle.fill;
    canvas.drawCircle(center, r, circlePaint);
    final borderPaint = Paint()
      ..color = Colors.blue
      ..style = PaintingStyle.stroke
      ..strokeWidth = 3;
    canvas.drawCircle(center, r, borderPaint);

    // Merkez noktası
    final centerPaint = Paint()
      ..color = Colors.red
      ..strokeWidth = 2;
    canvas.drawCircle(center, 5, centerPaint);

    // Yarıçap çizgisi
    final radiusPaint = Paint()
      ..color = Colors.green
      ..strokeWidth = 3;
    canvas.drawLine(center, Offset(a + r, b), radiusPaint);

    // Etiketler
    final textStyle = TextStyle(color: Colors.black, fontSize: 14);
    // x, y eksenleri
    _drawText(canvas, 'x', Offset(x1 - 10, y0 + 6), textStyle);
    _drawText(canvas, 'y', Offset(x0 - 16, y1 - 2), textStyle);
    // Merkez (a, b)
    _drawText(
      canvas,
      '(a, b)',
      Offset(a - 32, b - 24),
      textStyle.copyWith(color: Colors.red),
    );
    // r etiketi
    _drawText(
      canvas,
      'r',
      Offset(a + r / 2, b - 18),
      textStyle.copyWith(color: Colors.green),
    );
    // Daire denklemi etiketi
    _drawText(
      canvas,
      '(x-a)² + (y-b)² = r²',
      Offset(center.dx - 48, center.dy + r + 18),
      textStyle.copyWith(color: Colors.blue),
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
