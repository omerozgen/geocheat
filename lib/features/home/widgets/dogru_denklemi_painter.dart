import 'package:flutter/material.dart';
import 'dart:math';

class DogruDenklemiPainter extends StatelessWidget {
  final double size;
  const DogruDenklemiPainter({super.key, this.size = 180});

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: Size(size, size),
      painter: _DogruDenklemiPainter(),
    );
  }
}

class _DogruDenklemiPainter extends CustomPainter {
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

    // Doğru: y = mx + n (örnek: m=0.7, n=30)
    final m = 0.7;
    final n = 30.0;
    final xStart = x0;
    final xEnd = x1;
    final yStart = y0 - n;
    final yEnd = y0 - (m * (xEnd - xStart) + n);
    final linePaint = Paint()
      ..color = Colors.blue
      ..strokeWidth = 3;
    canvas.drawLine(Offset(xStart, yStart), Offset(xEnd, yEnd), linePaint);

    // y-kesişim noktası
    final yIntercept = Offset(x0, yStart);
    final interceptPaint = Paint()
      ..color = Colors.red
      ..strokeWidth = 2;
    canvas.drawCircle(yIntercept, 5, interceptPaint);

    // Eğim açısı (örnek)
    final angle = atan(m);
    final arcPaint = Paint()
      ..color = Colors.orange
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2;
    canvas.drawArc(
      Rect.fromCircle(center: yIntercept, radius: 28),
      pi / 2,
      -angle,
      false,
      arcPaint,
    );

    // Etiketler
    final textStyle = TextStyle(color: Colors.black, fontSize: 14);
    // x, y eksenleri
    _drawText(canvas, 'x', Offset(x1 - 10, y0 + 6), textStyle);
    _drawText(canvas, 'y', Offset(x0 - 16, y1 - 2), textStyle);
    // y-kesişim
    _drawText(
      canvas,
      'n',
      Offset(yIntercept.dx - 18, yIntercept.dy - 18),
      textStyle.copyWith(color: Colors.red),
    );
    // eğim açısı etiketi
    _drawText(
      canvas,
      'm',
      Offset(yIntercept.dx + 24, yIntercept.dy - 18),
      textStyle.copyWith(color: Colors.orange),
    );
    // Doğru etiketi
    _drawText(
      canvas,
      'y = mx + n',
      Offset((x0 + x1) / 2 - 32, (yStart + yEnd) / 2 - 18),
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
