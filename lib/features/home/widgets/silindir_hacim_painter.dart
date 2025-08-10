import 'package:flutter/material.dart';
import 'dart:math';

class SilindirHacimPainter extends StatelessWidget {
  final double size;
  const SilindirHacimPainter({super.key, this.size = 180});

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: Size(size, size),
      painter: _SilindirHacimPainter(),
    );
  }
}

class _SilindirHacimPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final double cx = size.width / 2;
    final double topY = size.height * 0.22;
    final double bottomY = size.height * 0.78;
    final double rx = size.width * 0.28;
    final double ry = size.height * 0.12; // Biraz daha büyük elips için

    // Alt ve üst elipsler
    final topRect = Rect.fromCenter(
      center: Offset(cx, topY),
      width: rx * 2,
      height: ry * 2,
    );
    final bottomRect = Rect.fromCenter(
      center: Offset(cx, bottomY),
      width: rx * 2,
      height: ry * 2,
    );

    // Yan yüz (gövde)
    final bodyPaint = Paint()
      ..color = Colors.orange.withOpacity(0.13)
      ..style = PaintingStyle.fill;
    final bodyPath = Path()
      ..moveTo(cx - rx, topY)
      ..lineTo(cx - rx, bottomY)
      ..arcToPoint(
        Offset(cx + rx, bottomY),
        radius: Radius.elliptical(rx, ry),
        clockwise: false,
      )
      ..lineTo(cx + rx, topY)
      ..arcToPoint(
        Offset(cx - rx, topY),
        radius: Radius.elliptical(rx, ry),
        clockwise: false,
      )
      ..close();
    canvas.drawPath(bodyPath, bodyPaint);

    // Kenar çizgileri
    final borderPaint = Paint()
      ..color = Colors.orange
      ..style = PaintingStyle.stroke
      ..strokeWidth = 3;
    // Üst elips
    canvas.drawOval(topRect, borderPaint);
    // Alt elips (kesikli)
    final dashedPaint = Paint()
      ..color = Colors.orange
      ..style = PaintingStyle.stroke
      ..strokeWidth = 3;
    _drawDashedOval(canvas, bottomRect, dashedPaint);
    // Yan çizgiler
    canvas.drawLine(
      Offset(cx - rx, topY),
      Offset(cx - rx, bottomY),
      borderPaint,
    );
    canvas.drawLine(
      Offset(cx + rx, topY),
      Offset(cx + rx, bottomY),
      borderPaint,
    );

    // Kenar isimleri
    final textStyle = TextStyle(color: Colors.black, fontSize: 15);
    // r: üst merkezden sağa
    _drawText(canvas, 'r', Offset(cx + rx / 2, topY - 18), textStyle);
    // h: sağ dıştan ortada
    _drawText(
      canvas,
      'h',
      Offset(cx + rx + 8, (topY + bottomY) / 2 - 8),
      textStyle,
    );
    // Hacim etiketi
    _drawText(
      canvas,
      'Hacim',
      Offset(cx - 18, (topY + bottomY) / 2 - 8),
      textStyle.copyWith(fontSize: 14, color: Colors.orange),
    );
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
