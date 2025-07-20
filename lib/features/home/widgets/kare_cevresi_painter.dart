import 'package:flutter/material.dart';
import 'dart:math';

class KareCevresiPainter extends StatelessWidget {
  final double size;
  const KareCevresiPainter({super.key, this.size = 180});

  @override
  Widget build(BuildContext context) {
    return CustomPaint(size: Size(size, size), painter: _KareCevresiPainter());
  }
}

class _KareCevresiPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final double margin = size.width * 0.18;
    final double side = size.width * 0.64;
    final Offset topLeft = Offset(margin, margin);
    final Offset topRight = Offset(margin + side, margin);
    final Offset bottomLeft = Offset(margin, margin + side);
    final Offset bottomRight = Offset(margin + side, margin + side);

    final rectPaint = Paint()
      ..color = Colors.green.withOpacity(0.13)
      ..style = PaintingStyle.fill;
    final rect = Rect.fromLTWH(margin, margin, side, side);
    canvas.drawRect(rect, rectPaint);

    final borderPaint = Paint()
      ..color = Colors.green
      ..style = PaintingStyle.stroke
      ..strokeWidth = 3;
    canvas.drawRect(rect, borderPaint);

    final textStyle = TextStyle(color: Colors.black, fontSize: 15);
    // a kenarları
    _drawText(
      canvas,
      'a',
      Offset((topLeft.dx + topRight.dx) / 2 - 10, topLeft.dy - 18),
      textStyle,
    );
    _drawText(
      canvas,
      'a',
      Offset(topRight.dx + 8, (topRight.dy + bottomRight.dy) / 2),
      textStyle,
    );
    _drawText(
      canvas,
      'a',
      Offset((bottomLeft.dx + bottomRight.dx) / 2 - 10, bottomLeft.dy + 8),
      textStyle,
    );
    _drawText(
      canvas,
      'a',
      Offset(topLeft.dx - 22, (topLeft.dy + bottomLeft.dy) / 2),
      textStyle,
    );
    // Çevreyi vurgulayan oklar
    _drawPerimeterArrow(canvas, topLeft, topRight, Colors.red);
    _drawPerimeterArrow(canvas, topRight, bottomRight, Colors.red);
    _drawPerimeterArrow(canvas, bottomRight, bottomLeft, Colors.red);
    _drawPerimeterArrow(canvas, bottomLeft, topLeft, Colors.red);
    // Etiket
    _drawText(
      canvas,
      'Çevre',
      Offset((topLeft.dx + bottomRight.dx) / 2 - 18, bottomRight.dy + 18),
      textStyle.copyWith(fontSize: 14, color: Colors.red),
    );
  }

  void _drawText(Canvas canvas, String text, Offset pos, TextStyle style) {
    final textSpan = TextSpan(text: text, style: style);
    final tp = TextPainter(text: textSpan, textDirection: TextDirection.ltr);
    tp.layout();
    tp.paint(canvas, pos);
  }

  void _drawPerimeterArrow(Canvas canvas, Offset from, Offset to, Color color) {
    final paint = Paint()
      ..color = color
      ..strokeWidth = 2;
    // Ok çizgisi
    canvas.drawLine(from, to, paint);
    // Ok başı
    final double arrowSize = 10;
    final double angle = atan2(to.dy - from.dy, to.dx - from.dx);
    final Offset arrowP1 = Offset(
      to.dx - arrowSize * cos(angle - pi / 6),
      to.dy - arrowSize * sin(angle - pi / 6),
    );
    final Offset arrowP2 = Offset(
      to.dx - arrowSize * cos(angle + pi / 6),
      to.dy - arrowSize * sin(angle + pi / 6),
    );
    final path = Path()
      ..moveTo(to.dx, to.dy)
      ..lineTo(arrowP1.dx, arrowP1.dy)
      ..moveTo(to.dx, to.dy)
      ..lineTo(arrowP2.dx, arrowP2.dy);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
