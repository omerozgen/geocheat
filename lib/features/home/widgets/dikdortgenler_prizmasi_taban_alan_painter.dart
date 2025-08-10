import 'package:flutter/material.dart';
import 'dart:math';

class DikdortgenlerPrizmasiTabanAlanPainter extends StatelessWidget {
  final double size;
  const DikdortgenlerPrizmasiTabanAlanPainter({super.key, this.size = 180});

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: Size(size, size),
      painter: _DikdortgenlerPrizmasiTabanAlanPainter(),
    );
  }
}

class _DikdortgenlerPrizmasiTabanAlanPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final double offsetX = size.width * 0.18;
    final double offsetY = size.height * 0.22;
    final double w = size.width * 0.5;
    final double h = size.height * 0.32;
    final double d = size.width * 0.28;
    // Ön yüz
    final frontTopLeft = Offset(offsetX, offsetY);
    final frontTopRight = Offset(offsetX + w, offsetY);
    final frontBottomLeft = Offset(offsetX, offsetY + h);
    final frontBottomRight = Offset(offsetX + w, offsetY + h);
    // Arka yüz
    final backTopLeft = Offset(offsetX + d, offsetY + d);
    final backTopRight = Offset(offsetX + w + d, offsetY + d);
    final backBottomLeft = Offset(offsetX + d, offsetY + h + d);
    final backBottomRight = Offset(offsetX + w + d, offsetY + h + d);
    // Tabanı vurgulu çiz
    final areaPaint = Paint()
      ..color = Colors.blue.withOpacity(0.25)
      ..style = PaintingStyle.fill;
    final areaPath = Path()
      ..moveTo(frontBottomLeft.dx, frontBottomLeft.dy)
      ..lineTo(frontBottomRight.dx, frontBottomRight.dy)
      ..lineTo(backBottomRight.dx, backBottomRight.dy)
      ..lineTo(backBottomLeft.dx, backBottomLeft.dy)
      ..close();
    canvas.drawPath(areaPath, areaPaint);
    // Kenar çizgileri
    final borderPaint = Paint()
      ..color = Colors.brown
      ..style = PaintingStyle.stroke
      ..strokeWidth = 3;
    // Ön yüz
    final frontPath = Path()
      ..moveTo(frontTopLeft.dx, frontTopLeft.dy)
      ..lineTo(frontTopRight.dx, frontTopRight.dy)
      ..lineTo(frontBottomRight.dx, frontBottomRight.dy)
      ..lineTo(frontBottomLeft.dx, frontBottomLeft.dy)
      ..close();
    canvas.drawPath(frontPath, borderPaint);
    // Arka yüz
    final backPath = Path()
      ..moveTo(backTopLeft.dx, backTopLeft.dy)
      ..lineTo(backTopRight.dx, backTopRight.dy)
      ..lineTo(backBottomRight.dx, backBottomRight.dy)
      ..lineTo(backBottomLeft.dx, backBottomLeft.dy)
      ..close();
    canvas.drawPath(backPath, borderPaint);
    // Bağlantı çizgileri
    canvas.drawLine(frontTopLeft, backTopLeft, borderPaint);
    canvas.drawLine(frontTopRight, backTopRight, borderPaint);
    canvas.drawLine(frontBottomLeft, backBottomLeft, borderPaint);
    canvas.drawLine(frontBottomRight, backBottomRight, borderPaint);
    // 'A_taban' etiketi
    final textStyle = TextStyle(
      color: Colors.blue[900],
      fontSize: 16,
      fontWeight: FontWeight.bold,
    );
    final labelPos = Offset(
      (frontBottomLeft.dx + backBottomRight.dx) / 2 - 18,
      (frontBottomLeft.dy + backBottomRight.dy) / 2 - 8,
    );
    _drawText(canvas, 'A_taban', labelPos, textStyle);
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
