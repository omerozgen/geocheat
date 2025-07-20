import 'package:flutter/material.dart';
import 'dart:math';

class ParabolDenklemiPainter extends StatelessWidget {
  final double size;
  const ParabolDenklemiPainter({super.key, this.size = 180});

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: Size(size, size),
      painter: _ParabolDenklemiPainter(),
    );
  }
}

class _ParabolDenklemiPainter extends CustomPainter {
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

    // Parabol: y = a(x-h)^2 + k (örnek: a=0.012, h=0, k=40)
    final a = 0.012;
    final h0 = 0.0;
    final k0 = 40.0;
    final points = <Offset>[];
    for (double x = x0; x <= x1; x += 1) {
      final xp = x - (x0 + x1) / 2;
      final y = y0 - (a * pow(xp - h0, 2) + k0);
      points.add(Offset(x, y));
    }
    final parabolPaint = Paint()
      ..color = Colors.purple
      ..strokeWidth = 3
      ..style = PaintingStyle.stroke;
    final path = Path()..moveTo(points.first.dx, points.first.dy);
    for (final p in points) {
      path.lineTo(p.dx, p.dy);
    }
    canvas.drawPath(path, parabolPaint);

    // Tepe noktası
    final vertex = Offset((x0 + x1) / 2 + h0, y0 - k0);
    final vertexPaint = Paint()
      ..color = Colors.red
      ..strokeWidth = 2;
    canvas.drawCircle(vertex, 5, vertexPaint);

    // Etiketler
    final textStyle = TextStyle(color: Colors.black, fontSize: 14);
    // x, y eksenleri
    _drawText(canvas, 'x', Offset(x1 - 10, y0 + 6), textStyle);
    _drawText(canvas, 'y', Offset(x0 - 16, y1 - 2), textStyle);
    // Tepe noktası
    _drawText(
      canvas,
      'Tepe',
      Offset(vertex.dx + 8, vertex.dy - 18),
      textStyle.copyWith(color: Colors.red),
    );
    // Parabol denklemi etiketi
    _drawText(
      canvas,
      'y = a(x-h)² + k',
      Offset((x0 + x1) / 2 - 48, y1 + 8),
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
