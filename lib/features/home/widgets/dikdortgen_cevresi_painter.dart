import 'package:flutter/material.dart';
import 'dart:math';

class DikdortgenCevresiPainter extends StatelessWidget {
  final double size;
  const DikdortgenCevresiPainter({super.key, this.size = 180});

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: Size(size, size),
      painter: _DikdortgenCevresiPainter(),
    );
  }
}

class _DikdortgenCevresiPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final double margin = size.width * 0.18;
    final double w = size.width * 0.64;
    final double h = size.height * 0.42;
    final Offset topLeft = Offset(margin, margin + 18);
    final Offset topRight = Offset(margin + w, margin + 18);
    final Offset bottomLeft = Offset(margin, margin + 18 + h);
    final Offset bottomRight = Offset(margin + w, margin + 18 + h);

    final rectPaint = Paint()
      ..color = Colors.orange.withOpacity(0.13)
      ..style = PaintingStyle.fill;
    final rect = Rect.fromLTWH(topLeft.dx, topLeft.dy, w, h);
    canvas.drawRect(rect, rectPaint);

    final borderPaint = Paint()
      ..color = Colors.orange
      ..style = PaintingStyle.stroke
      ..strokeWidth = 3;
    canvas.drawRect(rect, borderPaint);

    final textStyle = TextStyle(color: Colors.black, fontSize: 15);
    // a kenarları (kısa)
    _drawText(
      canvas,
      'a',
      Offset(topLeft.dx - 22, (topLeft.dy + bottomLeft.dy) / 2),
      textStyle,
    );
    _drawText(
      canvas,
      'a',
      Offset(topRight.dx + 8, (topRight.dy + bottomRight.dy) / 2),
      textStyle,
    );
    // b kenarları (uzun)
    _drawText(
      canvas,
      'b',
      Offset((topLeft.dx + topRight.dx) / 2 - 10, topLeft.dy - 18),
      textStyle,
    );
    _drawText(
      canvas,
      'b',
      Offset((bottomLeft.dx + bottomRight.dx) / 2 - 10, bottomLeft.dy + 8),
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
