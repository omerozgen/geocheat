import 'package:flutter/material.dart';
import 'dart:math';

class YayUzunluguPainter extends StatelessWidget {
  final double size;
  const YayUzunluguPainter({super.key, this.size = 180});

  @override
  Widget build(BuildContext context) {
    return CustomPaint(size: Size(size, size), painter: _YayUzunluguPainter());
  }
}

class _YayUzunluguPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = size.width * 0.35;
    final startAngle = -pi / 3;
    final sweepAngle = pi / 2;

    // Yay (kalın ve renkli)
    final arcPaint = Paint()
      ..color = Colors.red
      ..style = PaintingStyle.stroke
      ..strokeWidth = 4;
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      startAngle,
      sweepAngle,
      false,
      arcPaint,
    );

    // Dairenin geri kalan kısmı (ince gri)
    final restPaint = Paint()
      ..color = Colors.grey.shade400
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2;
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      startAngle + sweepAngle,
      2 * pi - sweepAngle,
      false,
      restPaint,
    );

    // Yarıçap çizgileri
    final rPaint = Paint()
      ..color = Colors.blue
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2;
    final p1 = Offset(
      center.dx + radius * cos(startAngle),
      center.dy + radius * sin(startAngle),
    );
    final p2 = Offset(
      center.dx + radius * cos(startAngle + sweepAngle),
      center.dy + radius * sin(startAngle + sweepAngle),
    );
    canvas.drawLine(center, p1, rPaint);
    canvas.drawLine(center, p2, rPaint);

    // Yarıçap etiketi
    final textStyle = TextStyle(color: Colors.blue, fontSize: 16);
    _drawText(
      canvas,
      'r',
      Offset((center.dx + p1.dx) / 2 - 8, (center.dy + p1.dy) / 2 - 18),
      textStyle,
    );
    _drawText(
      canvas,
      'r',
      Offset((center.dx + p2.dx) / 2 + 4, (center.dy + p2.dy) / 2 - 18),
      textStyle,
    );
    // Yay etiketi
    _drawText(
      canvas,
      'Yay',
      Offset((p1.dx + p2.dx) / 2, (p1.dy + p2.dy) / 2 - 18),
      TextStyle(fontSize: 14, color: Colors.red),
    );
    // Merkez açı etiketi
    _drawText(
      canvas,
      'θ',
      Offset(center.dx + 18, center.dy - 8),
      TextStyle(fontSize: 18, color: Colors.black),
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
