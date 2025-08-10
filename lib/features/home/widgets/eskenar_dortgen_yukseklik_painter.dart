import 'package:flutter/material.dart';
import 'dart:math';

class EskenarDortgenYukseklikPainter extends StatelessWidget {
  final double size;
  const EskenarDortgenYukseklikPainter({super.key, this.size = 180});

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: Size(size, size),
      painter: _EskenarDortgenYukseklikPainter(),
    );
  }
}

class _EskenarDortgenYukseklikPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final d1 = size.width * 0.7;
    final d2 = size.width * 0.4;
    final p1 = Offset(center.dx, center.dy - d2 / 2);
    final p2 = Offset(center.dx + d1 / 2, center.dy);
    final p3 = Offset(center.dx, center.dy + d2 / 2);
    final p4 = Offset(center.dx - d1 / 2, center.dy);
    // Gövde
    final fillPaint = Paint()
      ..color = Colors.blue[100]!
      ..style = PaintingStyle.fill;
    final path = Path()
      ..moveTo(p1.dx, p1.dy)
      ..lineTo(p2.dx, p2.dy)
      ..lineTo(p3.dx, p3.dy)
      ..lineTo(p4.dx, p4.dy)
      ..close();
    canvas.drawPath(path, fillPaint);
    final borderPaint = Paint()
      ..color = Colors.brown
      ..style = PaintingStyle.stroke
      ..strokeWidth = 3;
    canvas.drawPath(path, borderPaint);
    // Yükseklik çizgisi
    final hPaint = Paint()
      ..color = Colors.red
      ..strokeWidth = 3;
    final baseStart = p4;
    final baseEnd = p3;
    final hStart = Offset((p4.dx + p1.dx) / 2, (p4.dy + p1.dy) / 2);
    final hEnd = Offset(hStart.dx, p1.dy);
    canvas.drawLine(hStart, hEnd, hPaint);
    // Ok uçları
    canvas.drawLine(hEnd, Offset(hEnd.dx - 7, hEnd.dy + 12), hPaint);
    canvas.drawLine(hEnd, Offset(hEnd.dx + 7, hEnd.dy + 12), hPaint);
    canvas.drawLine(hStart, Offset(hStart.dx - 7, hStart.dy - 12), hPaint);
    canvas.drawLine(hStart, Offset(hStart.dx + 7, hStart.dy - 12), hPaint);
    // 'h' etiketi
    final textStyle = TextStyle(
      color: Colors.red,
      fontSize: 18,
      fontWeight: FontWeight.bold,
    );
    final labelPos = Offset(hEnd.dx + 8, (hEnd.dy + hStart.dy) / 2 - 10);
    _drawText(canvas, 'h', labelPos, textStyle);
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
