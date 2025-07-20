import 'package:flutter/material.dart';
import 'dart:math';

class AltigenAlanPainter extends StatelessWidget {
  final double size;
  const AltigenAlanPainter({super.key, this.size = 180});

  @override
  Widget build(BuildContext context) {
    return CustomPaint(size: Size(size, size), painter: _AltigenAlanPainter());
  }
}

class _AltigenAlanPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = size.width * 0.35;
    final angle = 2 * pi / 6;

    // Altıgen köşeleri
    final points = List.generate(6, (i) {
      final theta = -pi / 2 + i * angle;
      return Offset(
        center.dx + radius * cos(theta),
        center.dy + radius * sin(theta),
      );
    });

    // Alanı taralı göster (altıgenin içi)
    final areaPaint = Paint()
      ..color = Colors.teal.withOpacity(0.2)
      ..style = PaintingStyle.fill;
    final areaPath = Path()..moveTo(points[0].dx, points[0].dy);
    for (var i = 1; i < 6; i++) {
      areaPath.lineTo(points[i].dx, points[i].dy);
    }
    areaPath.close();
    canvas.drawPath(areaPath, areaPaint);

    // Altıgenin kenarları
    final borderPaint = Paint()
      ..color = Colors.teal
      ..style = PaintingStyle.stroke
      ..strokeWidth = 3;
    final borderPath = Path()..moveTo(points[0].dx, points[0].dy);
    for (var i = 1; i < 6; i++) {
      borderPath.lineTo(points[i].dx, points[i].dy);
    }
    borderPath.close();
    canvas.drawPath(borderPath, borderPaint);

    // Kenar isimleri
    final textStyle = TextStyle(color: Colors.black, fontSize: 16);
    for (var i = 0; i < 6; i++) {
      final p1 = points[i];
      final p2 = points[(i + 1) % 6];
      final mid = Offset((p1.dx + p2.dx) / 2, (p1.dy + p2.dy) / 2);
      _drawText(canvas, 'a', mid, textStyle);
    }
    // Alan etiketi
    _drawText(
      canvas,
      'Alan',
      center.translate(-18, 0),
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
