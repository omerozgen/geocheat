import 'package:flutter/material.dart';
import 'dart:math';

class AltigenIcCemberPainter extends StatelessWidget {
  final double size;
  const AltigenIcCemberPainter({super.key, this.size = 180});

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: Size(size, size),
      painter: _AltigenIcCemberPainter(),
    );
  }
}

class _AltigenIcCemberPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final r = size.width * 0.36;
    final n = 6;
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
    // İç çember
    final ap = r * cos(pi / 6);
    final circlePaint = Paint()
      ..color = Colors.green.withOpacity(0.22)
      ..style = PaintingStyle.fill;
    canvas.drawCircle(center, ap, circlePaint);
    final circleBorder = Paint()
      ..color = Colors.green[900]!
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2;
    canvas.drawCircle(center, ap, circleBorder);
    // 'r' etiketi
    final textStyle = TextStyle(
      color: Colors.green[900],
      fontSize: 16,
      fontWeight: FontWeight.bold,
    );
    final labelPos = Offset(center.dx + ap / 2 - 6, center.dy - 24);
    _drawText(canvas, 'r', labelPos, textStyle);
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
