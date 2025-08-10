import 'package:flutter/material.dart';
import 'dart:math';

class BesgenIcAciPainter extends StatelessWidget {
  final double size;
  const BesgenIcAciPainter({super.key, this.size = 180});

  @override
  Widget build(BuildContext context) {
    return CustomPaint(size: Size(size, size), painter: _BesgenIcAciPainter());
  }
}

class _BesgenIcAciPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final r = size.width * 0.36;
    final n = 5;
    final points = List.generate(n, (i) {
      final angle = -pi / 2 + 2 * pi * i / n;
      return Offset(center.dx + r * cos(angle), center.dy + r * sin(angle));
    });
    // Gövde
    final fillPaint = Paint()
      ..color = Colors.blue[100]!
      ..style = PaintingStyle.fill;
    final path = Path()..moveTo(points[0].dx, points[0].dy);
    for (var p in points.skip(1)) {
      path.lineTo(p.dx, p.dy);
    }
    path.close();
    canvas.drawPath(path, fillPaint);
    final borderPaint = Paint()
      ..color = Colors.brown
      ..style = PaintingStyle.stroke
      ..strokeWidth = 3;
    canvas.drawPath(path, borderPaint);
    // İç açı yayı
    final arcPaint = Paint()
      ..color = Colors.red
      ..style = PaintingStyle.stroke
      ..strokeWidth = 3;
    final arcRect = Rect.fromCircle(center: points[0], radius: 32);
    canvas.drawArc(arcRect, pi / 5, 3 * pi / 5, false, arcPaint);
    // 'α' etiketi
    final textStyle = TextStyle(
      color: Colors.red,
      fontSize: 18,
      fontWeight: FontWeight.bold,
    );
    final labelPos = Offset(points[0].dx + 18, points[0].dy + 12);
    _drawText(canvas, 'α', labelPos, textStyle);
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
