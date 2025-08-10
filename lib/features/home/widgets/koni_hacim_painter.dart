import 'package:flutter/material.dart';
import 'dart:math';

class KoniHacimPainter extends StatelessWidget {
  final double size;
  const KoniHacimPainter({super.key, this.size = 180});

  @override
  Widget build(BuildContext context) {
    return CustomPaint(size: Size(size, size), painter: _KoniHacimPainter());
  }
}

class _KoniHacimPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final double cx = size.width / 2;
    final double baseY = size.height * 0.78;
    final double topY = size.height * 0.22;
    final double rx = size.width * 0.28;
    final double ry = size.height * 0.12; // Biraz daha büyük taban için

    // Taban elipsi
    final baseRect = Rect.fromCenter(
      center: Offset(cx, baseY),
      width: rx * 2,
      height: ry * 2,
    );

    // Yan yüz (gövde)
    final bodyPaint = Paint()
      ..color = Colors.purple.withOpacity(0.13)
      ..style = PaintingStyle.fill;
    final bodyPath = Path()
      ..moveTo(cx - rx, baseY)
      ..lineTo(cx, topY)
      ..lineTo(cx + rx, baseY)
      ..arcTo(baseRect, 0, pi, false)
      ..close();
    canvas.drawPath(bodyPath, bodyPaint);

    // Kenar çizgileri
    final borderPaint = Paint()
      ..color = Colors.purple
      ..style = PaintingStyle.stroke
      ..strokeWidth = 3;
    // Yan çizgiler
    canvas.drawLine(Offset(cx - rx, baseY), Offset(cx, topY), borderPaint);
    canvas.drawLine(Offset(cx + rx, baseY), Offset(cx, topY), borderPaint);
    // Taban elipsi (kesikli)
    final dashedPaint = Paint()
      ..color = Colors.purple
      ..style = PaintingStyle.stroke
      ..strokeWidth = 3;
    _drawDashedOval(canvas, baseRect, dashedPaint);
    // Tabanın ön yarısı (düz çizgi)
    canvas.drawArc(baseRect, pi, pi, false, borderPaint);

    // Kenar isimleri
    final textStyle = TextStyle(color: Colors.black, fontSize: 15);
    // r: taban merkezden sağa
    _drawText(canvas, 'r', Offset(cx + rx / 2, baseY + 8), textStyle);
    // h: taban merkezden yukarıya
    _drawText(canvas, 'h', Offset(cx + 8, (topY + baseY) / 2 - 10), textStyle);
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
