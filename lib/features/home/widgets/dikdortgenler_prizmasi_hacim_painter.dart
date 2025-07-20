import 'package:flutter/material.dart';

class DikdortgenlerPrizmasiHacimPainter extends StatelessWidget {
  final double size;
  const DikdortgenlerPrizmasiHacimPainter({super.key, this.size = 180});

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: Size(size, size),
      painter: _DikdortgenlerPrizmasiHacimPainter(),
    );
  }
}

class _DikdortgenlerPrizmasiHacimPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    // 3D prizma için önden ve arkadan iki dikdörtgen ve bağlantı çizgileri
    final double offsetX = size.width * 0.18;
    final double offsetY = size.height * 0.22;
    final double w = size.width * 0.55;
    final double h = size.height * 0.38;
    final double depth = size.width * 0.22;

    // Ön yüz
    final frontTopLeft = Offset(offsetX, offsetY);
    final frontTopRight = Offset(offsetX + w, offsetY);
    final frontBottomLeft = Offset(offsetX, offsetY + h);
    final frontBottomRight = Offset(offsetX + w, offsetY + h);
    // Arka yüz
    final backTopLeft = Offset(offsetX + depth, offsetY - depth);
    final backTopRight = Offset(offsetX + w + depth, offsetY - depth);
    final backBottomLeft = Offset(offsetX + depth, offsetY + h - depth);
    final backBottomRight = Offset(offsetX + w + depth, offsetY + h - depth);

    // Ön yüzü hafif taralı göster
    final areaPaint = Paint()
      ..color = Colors.blue.withOpacity(0.13)
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
      ..color = Colors.blue
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

    // Kenar isimleri (a, b, h)
    final textStyle = TextStyle(color: Colors.black, fontSize: 15);
    // a: ön alt kenar
    _drawText(
      canvas,
      'a',
      Offset(
        (frontBottomLeft.dx + frontBottomRight.dx) / 2 - 10,
        frontBottomLeft.dy + 8,
      ),
      textStyle,
    );
    // b: ön sol kenar
    _drawText(
      canvas,
      'b',
      Offset(
        frontTopLeft.dx - 22,
        (frontTopLeft.dy + frontBottomLeft.dy) / 2 - 8,
      ),
      textStyle,
    );
    // h: sağ yan kenar (derinlik)
    _drawText(
      canvas,
      'h',
      Offset(
        (frontTopRight.dx + backTopRight.dx) / 2 + 2,
        (frontTopRight.dy + backTopRight.dy) / 2 - 10,
      ),
      textStyle,
    );
    // Hacim etiketi
    _drawText(
      canvas,
      'Hacim',
      Offset(frontTopLeft.dx + w / 3, frontTopLeft.dy + h / 2),
      textStyle.copyWith(fontSize: 14, color: Colors.blue),
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
