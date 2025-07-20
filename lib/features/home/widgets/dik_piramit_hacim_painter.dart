import 'package:flutter/material.dart';

class DikPiramitHacimPainter extends StatelessWidget {
  final double size;
  const DikPiramitHacimPainter({super.key, this.size = 180});

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: Size(size, size),
      painter: _DikPiramitHacimPainter(),
    );
  }
}

class _DikPiramitHacimPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final double offsetX = size.width * 0.18;
    final double offsetY = size.height * 0.60;
    final double w = size.width * 0.55;
    final double h = size.height * 0.22;
    final double apexY = size.height * 0.18;
    final double cx = size.width / 2;

    // Taban dikdörtgeni
    final frontLeft = Offset(offsetX, offsetY);
    final frontRight = Offset(offsetX + w, offsetY);
    final backLeft = Offset(offsetX + w * 0.18, offsetY - h);
    final backRight = Offset(offsetX + w * 0.82, offsetY - h);

    // Tepe noktası
    final apex = Offset(cx, apexY);

    // Yan yüzler (hafif taralı)
    final sidePaint = Paint()
      ..color = Colors.red.withOpacity(0.13)
      ..style = PaintingStyle.fill;
    final sidePath1 = Path()
      ..moveTo(frontLeft.dx, frontLeft.dy)
      ..lineTo(apex.dx, apex.dy)
      ..lineTo(frontRight.dx, frontRight.dy)
      ..close();
    final sidePath2 = Path()
      ..moveTo(frontLeft.dx, frontLeft.dy)
      ..lineTo(apex.dx, apex.dy)
      ..lineTo(backLeft.dx, backLeft.dy)
      ..close();
    final sidePath3 = Path()
      ..moveTo(frontRight.dx, frontRight.dy)
      ..lineTo(apex.dx, apex.dy)
      ..lineTo(backRight.dx, backRight.dy)
      ..close();
    final sidePath4 = Path()
      ..moveTo(backLeft.dx, backLeft.dy)
      ..lineTo(apex.dx, apex.dy)
      ..lineTo(backRight.dx, backRight.dy)
      ..close();
    canvas.drawPath(sidePath1, sidePaint);
    canvas.drawPath(sidePath2, sidePaint);
    canvas.drawPath(sidePath3, sidePaint);
    canvas.drawPath(sidePath4, sidePaint);

    // Kenar çizgileri
    final borderPaint = Paint()
      ..color = Colors.red
      ..style = PaintingStyle.stroke
      ..strokeWidth = 3;
    // Taban
    final basePath = Path()
      ..moveTo(frontLeft.dx, frontLeft.dy)
      ..lineTo(frontRight.dx, frontRight.dy)
      ..lineTo(backRight.dx, backRight.dy)
      ..lineTo(backLeft.dx, backLeft.dy)
      ..close();
    canvas.drawPath(basePath, borderPaint);
    // Yan kenarlar
    canvas.drawLine(frontLeft, apex, borderPaint);
    canvas.drawLine(frontRight, apex, borderPaint);
    canvas.drawLine(backLeft, apex, borderPaint);
    canvas.drawLine(backRight, apex, borderPaint);

    // Kenar isimleri (a, b, h)
    final textStyle = TextStyle(color: Colors.black, fontSize: 15);
    // a: taban ön kenar
    _drawText(
      canvas,
      'a',
      Offset((frontLeft.dx + frontRight.dx) / 2 - 10, frontLeft.dy + 8),
      textStyle,
    );
    // b: taban sol kenar
    _drawText(
      canvas,
      'b',
      Offset(frontLeft.dx - 22, (frontLeft.dy + backLeft.dy) / 2 - 8),
      textStyle,
    );
    // h: tepeye dik yükseklik
    _drawText(
      canvas,
      'h',
      Offset(cx + 8, (apex.dy + offsetY) / 2 - 10),
      textStyle,
    );
    // Hacim etiketi
    _drawText(
      canvas,
      'Hacim',
      Offset(cx - 18, (apex.dy + offsetY) / 2 + 12),
      textStyle.copyWith(fontSize: 14, color: Colors.red),
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
