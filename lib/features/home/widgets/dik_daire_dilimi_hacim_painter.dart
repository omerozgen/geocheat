import 'package:flutter/material.dart';
import 'dart:math';

class DikDaireDilimiHacimPainter extends StatelessWidget {
  final double size;
  const DikDaireDilimiHacimPainter({super.key, this.size = 180});

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: Size(size, size),
      painter: _DikDaireDilimiHacimPainter(),
    );
  }
}

class _DikDaireDilimiHacimPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final double cx = size.width / 2;
    final double topY = size.height * 0.22;
    final double bottomY = size.height * 0.78;
    final double rx = size.width * 0.28;
    final double ry = size.height * 0.11;
    final double theta = pi / 2; // 90 derece dilim

    // Üst ve alt elipsler (dilim)
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

    // Dilim gövdesi (hafif taralı)
    final bodyPaint = Paint()
      ..color = Colors.deepPurple.withOpacity(0.13)
      ..style = PaintingStyle.fill;
    final bodyPath = Path()
      ..moveTo(cx, topY)
      ..arcTo(topRect, -pi / 2, theta, false)
      ..lineTo(cx + rx * cos(theta), bottomY + ry * sin(theta))
      ..arcTo(bottomRect, -pi / 2 + theta, -theta, false)
      ..close();
    canvas.drawPath(bodyPath, bodyPaint);

    // Kenar çizgileri
    final borderPaint = Paint()
      ..color = Colors.deepPurple
      ..style = PaintingStyle.stroke
      ..strokeWidth = 3;
    // Üst elips dilimi
    canvas.drawArc(topRect, -pi / 2, theta, false, borderPaint);
    // Alt elips dilimi (kesikli)
    final dashedPaint = Paint()
      ..color = Colors.deepPurple
      ..style = PaintingStyle.stroke
      ..strokeWidth = 3;
    _drawDashedArc(canvas, bottomRect, -pi / 2, theta, dashedPaint);
    // Yan çizgiler
    canvas.drawLine(Offset(cx, topY), Offset(cx, bottomY), borderPaint);
    canvas.drawLine(
      Offset(cx + rx * cos(theta), topY + ry * sin(theta)),
      Offset(cx + rx * cos(theta), bottomY + ry * sin(theta)),
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
    // θ: üst yay ortası
    _drawText(
      canvas,
      'θ',
      Offset(cx + rx * cos(theta / 2) - 8, topY + ry * sin(theta / 2) - 24),
      textStyle,
    );
    // Hacim etiketi
    _drawText(
      canvas,
      'Hacim',
      Offset(cx - 18, (topY + bottomY) / 2 - 8),
      textStyle.copyWith(fontSize: 14, color: Colors.deepPurple),
    );
  }

  void _drawText(Canvas canvas, String text, Offset pos, TextStyle style) {
    final textSpan = TextSpan(text: text, style: style);
    final tp = TextPainter(text: textSpan, textDirection: TextDirection.ltr);
    tp.layout();
    tp.paint(canvas, pos);
  }

  void _drawDashedArc(
    Canvas canvas,
    Rect rect,
    double startAngle,
    double sweepAngle,
    Paint paint,
  ) {
    const int dashCount = 18;
    final double gap = sweepAngle / dashCount;
    for (int i = 0; i < dashCount; i += 2) {
      final double s = startAngle + i * gap;
      final double e = startAngle + (i + 1) * gap;
      final Path path = Path();
      path.addArc(rect, s, e - s);
      canvas.drawPath(path, paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
