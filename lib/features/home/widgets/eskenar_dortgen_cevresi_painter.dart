import 'package:flutter/material.dart';
import 'dart:math';

class EskenarDortgenCevresiPainter extends StatelessWidget {
  final double size;
  const EskenarDortgenCevresiPainter({super.key, this.size = 180});

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: Size(size, size),
      painter: _EskenarDortgenCevresiPainter(),
    );
  }
}

class _EskenarDortgenCevresiPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    // Köşeler
    final top = Offset(size.width / 2, size.height * 0.15);
    final right = Offset(size.width * 0.85, size.height / 2);
    final bottom = Offset(size.width / 2, size.height * 0.85);
    final left = Offset(size.width * 0.15, size.height / 2);

    // Dörtgenin kenarları
    final borderPaint = Paint()
      ..color = Colors.teal
      ..style = PaintingStyle.stroke
      ..strokeWidth = 3;
    final borderPath = Path()
      ..moveTo(top.dx, top.dy)
      ..lineTo(right.dx, right.dy)
      ..lineTo(bottom.dx, bottom.dy)
      ..lineTo(left.dx, left.dy)
      ..close();
    canvas.drawPath(borderPath, borderPaint);

    // Kenar etiketleri
    final textStyle = TextStyle(
      color: Colors.black,
      fontSize: 16,
      fontWeight: FontWeight.bold,
    );
    _drawText(
      canvas,
      'a',
      Offset((top.dx + right.dx) / 2 + 8, (top.dy + right.dy) / 2 - 18),
      textStyle,
    );
    _drawText(
      canvas,
      'a',
      Offset((right.dx + bottom.dx) / 2 + 8, (right.dy + bottom.dy) / 2 + 8),
      textStyle,
    );
    _drawText(
      canvas,
      'a',
      Offset((bottom.dx + left.dx) / 2 - 28, (bottom.dy + left.dy) / 2 + 8),
      textStyle,
    );
    _drawText(
      canvas,
      'a',
      Offset((left.dx + top.dx) / 2 - 28, (left.dy + top.dy) / 2 - 18),
      textStyle,
    );

    // Çevreyi vurgulayan kırmızı oklar
    final arrowPaint = Paint()
      ..color = Colors.red
      ..strokeWidth = 2;
    _drawArrow(canvas, top, right, arrowPaint);
    _drawArrow(canvas, right, bottom, arrowPaint);
    _drawArrow(canvas, bottom, left, arrowPaint);
    _drawArrow(canvas, left, top, arrowPaint);

    // Removed textual label
  }

  void _drawArrow(Canvas canvas, Offset start, Offset end, Paint paint) {
    canvas.drawLine(start, end, paint);
    // Ok başı
    const double arrowSize = 10;
    final angle = (end - start).direction;
    final arrowAngle = 0.5;
    final p1 =
        end -
        Offset(
          arrowSize * cos(angle - arrowAngle),
          arrowSize * sin(angle - arrowAngle),
        );
    final p2 =
        end -
        Offset(
          arrowSize * cos(angle + arrowAngle),
          arrowSize * sin(angle + arrowAngle),
        );
    final path = Path()
      ..moveTo(end.dx, end.dy)
      ..lineTo(p1.dx, p1.dy)
      ..moveTo(end.dx, end.dy)
      ..lineTo(p2.dx, p2.dy);
    canvas.drawPath(path, paint);
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
