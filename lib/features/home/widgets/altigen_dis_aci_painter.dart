import 'package:flutter/material.dart';
import 'dart:math';

class AltigenDisAciPainter extends StatelessWidget {
  final double size;
  const AltigenDisAciPainter({super.key, this.size = 180});

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: Size(size, size),
      painter: _AltigenDisAciPainter(),
    );
  }
}

class _AltigenDisAciPainter extends CustomPainter {
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
    // Dış açı yayı
    final arcPaint = Paint()
      ..color = Colors.green[700]!
      ..style = PaintingStyle.stroke
      ..strokeWidth = 3;
    final arcRect = Rect.fromCircle(center: points[0], radius: 44);
    canvas.drawArc(arcRect, -pi / 6, -pi / 3, false, arcPaint);
    // 'β' etiketi
    final textStyle = TextStyle(
      color: Colors.green[900],
      fontSize: 18,
      fontWeight: FontWeight.bold,
    );
    final labelPos = Offset(points[0].dx - 36, points[0].dy - 12);
    _drawText(canvas, 'β', labelPos, textStyle);
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
