import 'package:flutter/material.dart';
import 'dart:math';

class KupHacimPainter extends StatelessWidget {
  final double size;
  const KupHacimPainter({super.key, this.size = 180});

  @override
  Widget build(BuildContext context) {
    return CustomPaint(size: Size(size, size), painter: _KupHacimPainter());
  }
}

class _KupHacimPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    // 3D izlenimi için önden ve arkadan iki kare ve bağlantı çizgileri
    final double offset = size.width * 0.18;
    final double side = size.width * 0.5;
    final frontTopLeft = Offset(offset, offset);
    final frontTopRight = Offset(offset + side, offset);
    final frontBottomLeft = Offset(offset, offset + side);
    final frontBottomRight = Offset(offset + side, offset + side);
    final backTopLeft = Offset(offset + 30, offset - 30);
    final backTopRight = Offset(offset + side + 30, offset - 30);
    final backBottomLeft = Offset(offset + 30, offset + side - 30);
    final backBottomRight = Offset(offset + side + 30, offset + side - 30);

    // Alanı taralı göster (küpün ön yüzü)
    final areaPaint = Paint()
      ..color = Colors.brown.withOpacity(0.15)
      ..style = PaintingStyle.fill;
    final areaPath = Path()
      ..moveTo(frontTopLeft.dx, frontTopLeft.dy)
      ..lineTo(frontTopRight.dx, frontTopRight.dy)
      ..lineTo(frontBottomRight.dx, frontBottomRight.dy)
      ..lineTo(frontBottomLeft.dx, frontBottomLeft.dy)
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

    // Kenar isimleri
    final textStyle = TextStyle(color: Colors.black, fontSize: 16);
    _drawText(
      canvas,
      'a',
      Offset(
        (frontTopLeft.dx + frontTopRight.dx) / 2 - 10,
        frontTopLeft.dy - 18,
      ),
      textStyle,
    );
    _drawText(
      canvas,
      'a',
      Offset(
        frontTopRight.dx + 8,
        (frontTopRight.dy + frontBottomRight.dy) / 2,
      ),
      textStyle,
    );
    _drawText(
      canvas,
      'a',
      Offset(
        (frontBottomLeft.dx + frontBottomRight.dx) / 2 - 10,
        frontBottomLeft.dy + 8,
      ),
      textStyle,
    );
    // Hacim etiketi
    _drawText(
      canvas,
      'Hacim',
      Offset(frontTopLeft.dx + side / 3, frontTopLeft.dy + side / 2),
      textStyle.copyWith(fontSize: 14, color: Colors.brown),
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
