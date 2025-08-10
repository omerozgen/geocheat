import 'package:flutter/material.dart';
import 'dart:math';

class KureHacimPainter extends StatelessWidget {
  final double size;
  const KureHacimPainter({super.key, this.size = 180});

  @override
  Widget build(BuildContext context) {
    return CustomPaint(size: Size(size, size), painter: _KureHacimPainter());
  }
}

class _KureHacimPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final double cx = size.width / 2;
    final double cy = size.height / 2;
    final double r = size.width * 0.35; // Biraz daha büyük küre için
    final double eqRy = size.height * 0.14; // Ekvator elipsi için

    // Küre ana dairesi
    final mainCircle = Paint()
      ..color = Colors.green.withOpacity(0.13)
      ..style = PaintingStyle.fill;
    canvas.drawCircle(Offset(cx, cy), r, mainCircle);

    final borderPaint = Paint()
      ..color = Colors.green
      ..style = PaintingStyle.stroke
      ..strokeWidth = 3;
    canvas.drawCircle(Offset(cx, cy), r, borderPaint);

    // Ekvator elipsi (kesikli)
    final eqRect = Rect.fromCenter(
      center: Offset(cx, cy),
      width: r * 2,
      height: eqRy * 2,
    );
    final dashedPaint = Paint()
      ..color = Colors.green
      ..style = PaintingStyle.stroke
      ..strokeWidth = 3;
    _drawDashedOval(canvas, eqRect, dashedPaint);

    // Yarıçap çizgisi
    canvas.drawLine(Offset(cx, cy), Offset(cx + r, cy), borderPaint);

    // Kenar isimleri
    final textStyle = TextStyle(color: Colors.black, fontSize: 15);
    // r: sağa
    _drawText(canvas, 'r', Offset(cx + r / 2, cy - 18), textStyle);
    // Removed textual label
  }

  void _drawText(Canvas canvas, String text, Offset pos, TextStyle style) {
    final textSpan = TextSpan(text: text, style: style);
    final tp = TextPainter(text: textSpan, textDirection: TextDirection.ltr);
    tp.layout();
    tp.paint(canvas, pos);
  }

  void _drawDashedOval(Canvas canvas, Rect rect, Paint paint) {
    const int dashCount = 36;
    const double gap = pi * 2 / dashCount;
    for (int i = 0; i < dashCount; i += 2) {
      final double startAngle = i * gap;
      final double endAngle = (i + 1) * gap;
      final Path path = Path();
      path.addArc(rect, startAngle, endAngle - startAngle);
      canvas.drawPath(path, paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
