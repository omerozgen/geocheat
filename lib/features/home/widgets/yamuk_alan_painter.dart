import 'package:flutter/material.dart';

class YamukAlanPainter extends StatelessWidget {
  final double size;
  const YamukAlanPainter({super.key, this.size = 180});

  @override
  Widget build(BuildContext context) {
    return CustomPaint(size: Size(size, size), painter: _YamukAlanPainter());
  }
}

class _YamukAlanPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    // Yamuk köşeleri
    final leftTop = Offset(size.width * 0.28, size.height * 0.25);
    final rightTop = Offset(size.width * 0.78, size.height * 0.25);
    final rightBottom = Offset(size.width * 0.92, size.height * 0.75);
    final leftBottom = Offset(size.width * 0.08, size.height * 0.75);

    // Alanı taralı göster (yamuk içi)
    final areaPaint = Paint()
      ..color = Colors.red.withOpacity(0.2)
      ..style = PaintingStyle.fill;
    final areaPath = Path()
      ..moveTo(leftTop.dx, leftTop.dy)
      ..lineTo(rightTop.dx, rightTop.dy)
      ..lineTo(rightBottom.dx, rightBottom.dy)
      ..lineTo(leftBottom.dx, leftBottom.dy)
      ..close();
    canvas.drawPath(areaPath, areaPaint);

    // Yamuk kenarları
    final borderPaint = Paint()
      ..color = Colors.red
      ..style = PaintingStyle.stroke
      ..strokeWidth = 3;
    final borderPath = Path()
      ..moveTo(leftTop.dx, leftTop.dy)
      ..lineTo(rightTop.dx, rightTop.dy)
      ..lineTo(rightBottom.dx, rightBottom.dy)
      ..lineTo(leftBottom.dx, leftBottom.dy)
      ..close();
    canvas.drawPath(borderPath, borderPaint);

    // Kenar isimleri
    final textStyle = TextStyle(color: Colors.black, fontSize: 16);
    // a (üst taban)
    _drawText(
      canvas,
      'a',
      Offset((leftTop.dx + rightTop.dx) / 2 - 10, leftTop.dy - 20),
      textStyle,
    );
    // b (alt taban)
    _drawText(
      canvas,
      'b',
      Offset((leftBottom.dx + rightBottom.dx) / 2 - 10, leftBottom.dy + 8),
      textStyle,
    );
    // h (yükseklik, sol kenardan aşağı)
    final hStart = Offset((leftTop.dx + leftBottom.dx) / 2, leftTop.dy);
    final hEnd = Offset((leftTop.dx + leftBottom.dx) / 2, leftBottom.dy);
    final heightPaint = Paint()
      ..color = Colors.blue
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2;
    canvas.drawLine(hStart, hEnd, heightPaint);
    _drawText(
      canvas,
      'h',
      Offset(hStart.dx - 24, (hStart.dy + hEnd.dy) / 2 - 10),
      textStyle.copyWith(color: Colors.blue),
    );
    // Removed textual label
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
