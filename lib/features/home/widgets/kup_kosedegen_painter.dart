import 'package:flutter/material.dart';
import 'dart:math';

class KupKosedegenPainter extends StatelessWidget {
  final double size;
  const KupKosedegenPainter({super.key, this.size = 180});

  @override
  Widget build(BuildContext context) {
    return CustomPaint(size: Size(size, size), painter: _KupKosedegenPainter());
  }
}

class _KupKosedegenPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final double offset = size.width * 0.18;
    final double side = size.width * 0.45;
    final double depth = size.width * 0.25;

    // Ön yüz (daha büyük)
    final frontTopLeft = Offset(offset, offset);
    final frontTopRight = Offset(offset + side, offset);
    final frontBottomLeft = Offset(offset, offset + side);
    final frontBottomRight = Offset(offset + side, offset + side);

    // Arka yüz (daha küçük ve yukarıda)
    final backTopLeft = Offset(offset + depth, offset - depth * 0.3);
    final backTopRight = Offset(offset + depth + side, offset - depth * 0.3);
    final backBottomLeft = Offset(offset + depth, offset + side - depth * 0.3);
    final backBottomRight = Offset(
      offset + depth + side,
      offset + side - depth * 0.3,
    );

    // Kenar çizgileri
    final borderPaint = Paint()
      ..color = Colors.brown
      ..style = PaintingStyle.stroke
      ..strokeWidth = 3;
    // Ön yüz
    final frontPath = Path()
      ..moveTo(frontTopLeft.dx, frontTopLeft.dy)
      ..lineTo(frontTopRight.dx, frontTopRight.dy)
      ..lineTo(frontBottomRight.dx, frontBottomRight.dy)
      ..lineTo(frontBottomLeft.dx, frontBottomLeft.dy)
      ..close();
    canvas.drawPath(frontPath, borderPaint);
    // Arka yüz
    final backPath = Path()
      ..moveTo(backTopLeft.dx, backTopLeft.dy)
      ..lineTo(backTopRight.dx, backTopRight.dy)
      ..lineTo(backBottomRight.dx, backBottomRight.dy)
      ..lineTo(backBottomLeft.dx, backBottomLeft.dy)
      ..close();
    canvas.drawPath(backPath, borderPaint);
    // Bağlantı çizgileri
    canvas.drawLine(frontTopLeft, backTopLeft, borderPaint);
    canvas.drawLine(frontTopRight, backTopRight, borderPaint);
    canvas.drawLine(frontBottomLeft, backBottomLeft, borderPaint);
    canvas.drawLine(frontBottomRight, backBottomRight, borderPaint);

    // Köşegen çizgisi (ön sol üstten arka sağ alta)
    final diagonalPaint = Paint()
      ..color = Colors.red
      ..strokeWidth = 3;
    canvas.drawLine(frontTopLeft, backBottomRight, diagonalPaint);

    // 'd' etiketi
    final textStyle = TextStyle(
      color: Colors.red,
      fontSize: 18,
      fontWeight: FontWeight.bold,
    );
    final labelPos = Offset(
      (frontTopLeft.dx + backBottomRight.dx) / 2 + 8,
      (frontTopLeft.dy + backBottomRight.dy) / 2 - 8,
    );
    _drawText(canvas, 'd', labelPos, textStyle);
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
