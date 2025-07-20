import 'package:flutter/material.dart';
import 'dart:math';

class PrizmaHacimPainter extends StatelessWidget {
  final double size;
  const PrizmaHacimPainter({super.key, this.size = 180});

  @override
  Widget build(BuildContext context) {
    return CustomPaint(size: Size(size, size), painter: _PrizmaHacimPainter());
  }
}

class _PrizmaHacimPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final double cx = size.width / 2;
    final double cy = size.height * 0.65;
    final double r = size.width * 0.22;
    final double h = size.height * 0.32;
    final int n = 6; // Altıgen taban örneği

    // Alt taban çokgeni
    final List<Offset> basePoints = List.generate(n, (i) {
      final angle = pi / 2 + 2 * pi * i / n;
      return Offset(cx + r * cos(angle), cy + r * sin(angle));
    });
    // Üst taban çokgeni (yukarıya taşınmış)
    final List<Offset> topPoints = basePoints
        .map((p) => Offset(p.dx, p.dy - h))
        .toList();

    // Yan yüzler (hafif taralı)
    final sidePaint = Paint()
      ..color = Colors.teal.withOpacity(0.13)
      ..style = PaintingStyle.fill;
    for (int i = 0; i < n; i++) {
      final next = (i + 1) % n;
      final path = Path()
        ..moveTo(basePoints[i].dx, basePoints[i].dy)
        ..lineTo(topPoints[i].dx, topPoints[i].dy)
        ..lineTo(topPoints[next].dx, topPoints[next].dy)
        ..lineTo(basePoints[next].dx, basePoints[next].dy)
        ..close();
      canvas.drawPath(path, sidePaint);
    }

    // Kenar çizgileri
    final borderPaint = Paint()
      ..color = Colors.teal
      ..style = PaintingStyle.stroke
      ..strokeWidth = 3;
    // Alt taban
    final basePath = Path()..moveTo(basePoints[0].dx, basePoints[0].dy);
    for (int i = 1; i < n; i++) {
      basePath.lineTo(basePoints[i].dx, basePoints[i].dy);
    }
    basePath.close();
    canvas.drawPath(basePath, borderPaint);
    // Üst taban
    final topPath = Path()..moveTo(topPoints[0].dx, topPoints[0].dy);
    for (int i = 1; i < n; i++) {
      topPath.lineTo(topPoints[i].dx, topPoints[i].dy);
    }
    topPath.close();
    canvas.drawPath(topPath, borderPaint);
    // Yan kenarlar
    for (int i = 0; i < n; i++) {
      canvas.drawLine(basePoints[i], topPoints[i], borderPaint);
    }

    // Kenar isimleri (A, h)
    final textStyle = TextStyle(color: Colors.black, fontSize: 15);
    // A: alt taban ortası
    final baseCenter = Offset(
      basePoints.map((p) => p.dx).reduce((a, b) => a + b) / n,
      basePoints.map((p) => p.dy).reduce((a, b) => a + b) / n,
    );
    _drawText(
      canvas,
      'A',
      Offset(baseCenter.dx - 10, baseCenter.dy + 8),
      textStyle,
    );
    // h: sağ yan kenar ortası
    _drawText(
      canvas,
      'h',
      Offset(
        (basePoints[0].dx + topPoints[0].dx) / 2 + 8,
        (basePoints[0].dy + topPoints[0].dy) / 2 - 10,
      ),
      textStyle,
    );
    // Hacim etiketi
    _drawText(
      canvas,
      'Hacim',
      Offset(cx - 18, cy - h / 2),
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
