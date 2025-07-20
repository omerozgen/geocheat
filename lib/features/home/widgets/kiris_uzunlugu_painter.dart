import 'package:flutter/material.dart';
import 'dart:math';

class KirisUzunluguPainter extends StatelessWidget {
  final double size;
  const KirisUzunluguPainter({super.key, this.size = 180});

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: Size(size, size),
      painter: _KirisUzunluguPainter(),
    );
  }
}

class _KirisUzunluguPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = size.width * 0.35;
    final startAngle = -pi / 4;
    final sweepAngle = pi / 2;

    // Çemberin kenarı (gri)
    final borderPaint = Paint()
      ..color = Colors.grey.shade400
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2;
    canvas.drawCircle(center, radius, borderPaint);

    // Kiriş (kalın ve renkli)
    final chordPaint = Paint()
      ..color = Colors.green
      ..style = PaintingStyle.stroke
      ..strokeWidth = 4;
    final p1 = Offset(
      center.dx + radius * cos(startAngle),
      center.dy + radius * sin(startAngle),
    );
    final p2 = Offset(
      center.dx + radius * cos(startAngle + sweepAngle),
      center.dy + radius * sin(startAngle + sweepAngle),
    );
    canvas.drawLine(p1, p2, chordPaint);

    // Yarıçap çizgileri
    final rPaint = Paint()
      ..color = Colors.blue
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2;
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
    // Kiriş etiketi
    _drawText(
      canvas,
      'Kiriş',
      Offset((p1.dx + p2.dx) / 2 - 10, (p1.dy + p2.dy) / 2 + 8),
      TextStyle(fontSize: 14, color: Colors.green),
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
