import 'package:flutter/material.dart';

class KareAlanPainter extends StatelessWidget {
  final double size;
  const KareAlanPainter({super.key, this.size = 180});

  @override
  Widget build(BuildContext context) {
    return CustomPaint(size: Size(size, size), painter: _KareAlanPainter());
  }
}

class _KareAlanPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    // Kare köşeleri
    final leftTop = Offset(size.width * 0.15, size.height * 0.15);
    final rightTop = Offset(size.width * 0.85, size.height * 0.15);
    final rightBottom = Offset(size.width * 0.85, size.height * 0.85);
    final leftBottom = Offset(size.width * 0.15, size.height * 0.85);

    // Alanı taralı göster (karenin içi)
    final areaPaint = Paint()
      ..color = Colors.green.withOpacity(0.2)
      ..style = PaintingStyle.fill;
    final areaPath = Path()
      ..moveTo(leftTop.dx, leftTop.dy)
      ..lineTo(rightTop.dx, rightTop.dy)
      ..lineTo(rightBottom.dx, rightBottom.dy)
      ..lineTo(leftBottom.dx, leftBottom.dy)
      ..close();
    canvas.drawPath(areaPath, areaPaint);

    // Karenin kenarları
    final borderPaint = Paint()
      ..color = Colors.green
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
    // a (üst kenar)
    _drawText(
      canvas,
      'a',
      Offset((leftTop.dx + rightTop.dx) / 2 - 10, leftTop.dy - 20),
      textStyle,
    );
    // a (sağ kenar)
    _drawText(
      canvas,
      'a',
      Offset(rightTop.dx + 8, (rightTop.dy + rightBottom.dy) / 2 - 10),
      textStyle,
    );
    // a (alt kenar)
    _drawText(
      canvas,
      'a',
      Offset((leftBottom.dx + rightBottom.dx) / 2 - 10, leftBottom.dy + 8),
      textStyle,
    );
    // a (sol kenar)
    _drawText(
      canvas,
      'a',
      Offset(leftTop.dx - 28, (leftTop.dy + leftBottom.dy) / 2),
      textStyle,
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
