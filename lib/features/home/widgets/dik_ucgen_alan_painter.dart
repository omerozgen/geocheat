import 'package:flutter/material.dart';

class DikUcgenAlanPainter extends StatelessWidget {
  final double size;
  const DikUcgenAlanPainter({super.key, this.size = 180});

  @override
  Widget build(BuildContext context) {
    return CustomPaint(size: Size(size, size), painter: _DikUcgenAlanPainter());
  }
}

class _DikUcgenAlanPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    // Üçgenin köşeleri
    final left = Offset(size.width * 0.15, size.height * 0.85);
    final right = Offset(size.width * 0.85, size.height * 0.85);
    final top = Offset(size.width * 0.15, size.height * 0.15);

    // Alanı taralı göster (üçgenin içi)
    final areaPaint = Paint()
      ..color = Colors.blue.withOpacity(0.2)
      ..style = PaintingStyle.fill;
    final areaPath = Path()
      ..moveTo(left.dx, left.dy)
      ..lineTo(right.dx, right.dy)
      ..lineTo(top.dx, top.dy)
      ..close();
    canvas.drawPath(areaPath, areaPaint);

    // Üçgenin kenarları
    final borderPaint = Paint()
      ..color = Colors.blue
      ..style = PaintingStyle.stroke
      ..strokeWidth = 3;
    final borderPath = Path()
      ..moveTo(left.dx, left.dy)
      ..lineTo(right.dx, right.dy)
      ..lineTo(top.dx, top.dy)
      ..close();
    canvas.drawPath(borderPath, borderPaint);

    // Kenar isimleri
    final textStyle = TextStyle(color: Colors.black, fontSize: 16);
    // a (taban)
    _drawText(
      canvas,
      'a',
      Offset((left.dx + right.dx) / 2 - 10, left.dy + 8),
      textStyle,
    );
    // b (yükseklik)
    _drawText(
      canvas,
      'b',
      Offset(left.dx - 28, (left.dy + top.dy) / 2),
      textStyle,
    );
    // c (hipotenüs)
    _drawText(
      canvas,
      'c',
      Offset((top.dx + right.dx) / 2 + 8, (top.dy + right.dy) / 2 - 10),
      textStyle,
    );
    // Alan etiketi
    _drawText(
      canvas,
      'Alan',
      Offset(
        (left.dx + right.dx + top.dx) / 3 + 10,
        (left.dy + right.dy + top.dy) / 3,
      ),
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
 