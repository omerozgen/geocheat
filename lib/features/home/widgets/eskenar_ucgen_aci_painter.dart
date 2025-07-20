import 'package:flutter/material.dart';
import 'dart:math';

class EskenarUcgenAciPainter extends StatelessWidget {
  final double size;
  const EskenarUcgenAciPainter({super.key, this.size = 180});

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: Size(size, size),
      painter: _EskenarUcgenAciPainter(),
    );
  }
}

class _EskenarUcgenAciPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final double margin = size.width * 0.18;
    final double base = size.width * 0.64;
    final double height = size.height * 0.56;
    final Offset a = Offset(margin, size.height - margin);
    final Offset b = Offset(margin + base, size.height - margin);
    final Offset c = Offset(size.width / 2, size.height - margin - height);

    final trianglePaint = Paint()
      ..color = Colors.blue.withOpacity(0.13)
      ..style = PaintingStyle.fill;
    final trianglePath = Path()
      ..moveTo(a.dx, a.dy)
      ..lineTo(b.dx, b.dy)
      ..lineTo(c.dx, c.dy)
      ..close();
    canvas.drawPath(trianglePath, trianglePaint);

    final borderPaint = Paint()
      ..color = Colors.blue
      ..style = PaintingStyle.stroke
      ..strokeWidth = 3;
    canvas.drawPath(trianglePath, borderPaint);

    final textStyle = TextStyle(color: Colors.black, fontSize: 15);
    // a kenarları
    _drawText(canvas, 'a', Offset((a.dx + b.dx) / 2 - 10, a.dy + 8), textStyle);
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
    // Sol alt açıya 60° işareti
    _drawAngleArc(canvas, a, b, c, 24, Colors.red);
    _drawText(
      canvas,
      '60°',
      Offset(a.dx + 18, a.dy - 8),
      textStyle.copyWith(color: Colors.red),
    );
    // Etiket
    _drawText(
      canvas,
      'İç Açı',
      Offset(a.dx + 8, a.dy - 32),
      textStyle.copyWith(fontSize: 14, color: Colors.red),
    );
  }

  void _drawText(Canvas canvas, String text, Offset pos, TextStyle style) {
    final textSpan = TextSpan(text: text, style: style);
    final tp = TextPainter(text: textSpan, textDirection: TextDirection.ltr);
    tp.layout();
    tp.paint(canvas, pos);
  }

  void _drawAngleArc(
    Canvas canvas,
    Offset vertex,
    Offset p1,
    Offset p2,
    double radius,
    Color color,
  ) {
    final angle1 = atan2(p1.dy - vertex.dy, p1.dx - vertex.dx);
    final angle2 = atan2(p2.dy - vertex.dy, p2.dx - vertex.dx);
    final startAngle = min(angle1, angle2);
    final sweepAngle = (angle2 - angle1).abs();
    final arcPaint = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2;
    canvas.drawArc(
      Rect.fromCircle(center: vertex, radius: radius),
      startAngle,
      sweepAngle,
      false,
      arcPaint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
