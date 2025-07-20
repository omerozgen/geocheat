import 'package:flutter/material.dart';
import 'dart:math';

class IkizkenarUcgenCevresiPainter extends StatelessWidget {
  final double size;
  const IkizkenarUcgenCevresiPainter({super.key, this.size = 180});

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: Size(size, size),
      painter: _IkizkenarUcgenCevresiPainter(),
    );
  }
}

class _IkizkenarUcgenCevresiPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final double margin = size.width * 0.18;
    final double base = size.width * 0.64;
    final double height = size.height * 0.52;
    final Offset a = Offset(margin, size.height - margin);
    final Offset b = Offset(margin + base, size.height - margin);
    final Offset c = Offset(size.width / 2, size.height - margin - height);

    final trianglePaint = Paint()
      ..color = Colors.purple.withOpacity(0.13)
      ..style = PaintingStyle.fill;
    final trianglePath = Path()
      ..moveTo(a.dx, a.dy)
      ..lineTo(b.dx, b.dy)
      ..lineTo(c.dx, c.dy)
      ..close();
    canvas.drawPath(trianglePath, trianglePaint);

    final borderPaint = Paint()
      ..color = Colors.purple
      ..style = PaintingStyle.stroke
      ..strokeWidth = 3;
    canvas.drawPath(trianglePath, borderPaint);

    final textStyle = TextStyle(color: Colors.black, fontSize: 15);
    // a kenarları (eşit)
    _drawText(
      canvas,
      'a',
      Offset((a.dx + c.dx) / 2 - 18, (a.dy + c.dy) / 2 - 8),
      textStyle,
    );
    _drawText(
      canvas,
      'a',
      Offset((b.dx + c.dx) / 2 + 8, (b.dy + c.dy) / 2 - 10),
      textStyle,
    );
    // b taban
    _drawText(canvas, 'b', Offset((a.dx + b.dx) / 2 - 10, a.dy + 8), textStyle);
    // Çevreyi vurgulayan ok (üçgenin etrafında)
    _drawPerimeterArrow(canvas, a, c, Colors.red);
    _drawPerimeterArrow(canvas, c, b, Colors.red);
    _drawPerimeterArrow(canvas, b, a, Colors.red);
    // Etiket
    _drawText(
      canvas,
      'Çevre',
      Offset((a.dx + b.dx) / 2 - 18, a.dy + 28),
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
