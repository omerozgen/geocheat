import 'package:flutter/material.dart';

class DikdortgenAlanPainter extends StatelessWidget {
  final double size;
  const DikdortgenAlanPainter({super.key, this.size = 180});

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: Size(size, size),
      painter: _DikdortgenAlanPainter(),
    );
  }
}

class _DikdortgenAlanPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    // Dikdörtgen köşeleri
    final leftTop = Offset(size.width * 0.18, size.height * 0.25);
    final rightTop = Offset(size.width * 0.82, size.height * 0.25);
    final rightBottom = Offset(size.width * 0.82, size.height * 0.75);
    final leftBottom = Offset(size.width * 0.18, size.height * 0.75);

    // Alanı taralı göster (dikdörtgenin içi)
    final areaPaint = Paint()
      ..color = Colors.orange.withOpacity(0.2)
      ..style = PaintingStyle.fill;
    final areaPath = Path()
      ..moveTo(leftTop.dx, leftTop.dy)
      ..lineTo(rightTop.dx, rightTop.dy)
      ..lineTo(rightBottom.dx, rightBottom.dy)
      ..lineTo(leftBottom.dx, leftBottom.dy)
      ..close();
    canvas.drawPath(areaPath, areaPaint);

    // Dikdörtgenin kenarları
    final borderPaint = Paint()
      ..color = Colors.orange
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
    // a (üst ve alt kenar)
    _drawText(
      canvas,
      'a',
      Offset((leftTop.dx + rightTop.dx) / 2 - 10, leftTop.dy - 20),
      textStyle,
    );
    _drawText(
      canvas,
      'a',
      Offset((leftBottom.dx + rightBottom.dx) / 2 - 10, leftBottom.dy + 8),
      textStyle,
    );
    // b (sol ve sağ kenar)
    _drawText(
      canvas,
      'b',
      Offset(leftTop.dx - 28, (leftTop.dy + leftBottom.dy) / 2),
      textStyle,
    );
    _drawText(
      canvas,
      'b',
      Offset(rightTop.dx + 8, (rightTop.dy + rightBottom.dy) / 2 - 10),
      textStyle,
    );
    // Alan etiketi
    _drawText(
      canvas,
      'Alan',
      Offset(
        (leftTop.dx + rightBottom.dx) / 2 - 10,
        (leftTop.dy + rightBottom.dy) / 2,
      ),
      textStyle.copyWith(fontSize: 14, color: Colors.orange),
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
