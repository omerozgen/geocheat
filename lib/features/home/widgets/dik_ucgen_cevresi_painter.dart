import 'package:flutter/material.dart';
import 'dart:math';

class DikUcgenCevresiPainter extends StatelessWidget {
  final double size;
  const DikUcgenCevresiPainter({super.key, this.size = 180});

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: Size(size, size),
      painter: _DikUcgenCevresiPainter(),
    );
  }
}

class _DikUcgenCevresiPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.blueAccent
      ..strokeWidth = 3
      ..style = PaintingStyle.stroke;
    final a = size.width * 0.7;
    final b = size.height * 0.5;
    final p0 = Offset(size.width * 0.15, size.height * 0.8);
    final p1 = Offset(p0.dx + a, p0.dy);
    final p2 = Offset(p0.dx, p0.dy - b);
    final path = Path()
      ..moveTo(p0.dx, p0.dy)
      ..lineTo(p1.dx, p1.dy)
      ..lineTo(p2.dx, p2.dy)
      ..close();
    canvas.drawPath(path, paint);
    // Kenar etiketleri
    final textStyle = TextStyle(
      color: Colors.black87,
      fontSize: 16,
      fontWeight: FontWeight.bold,
    );
    _drawText(
      canvas,
      'a',
      Offset((p0.dx + p1.dx) / 2 - 8, p0.dy + 12),
      textStyle,
    );
    _drawText(
      canvas,
      'b',
      Offset(p0.dx - 28, (p0.dy + p2.dy) / 2 - 8),
      textStyle,
    );
    _drawText(
      canvas,
      'c',
      Offset((p1.dx + p2.dx) / 2 + 8, (p1.dy + p2.dy) / 2 - 16),
      textStyle,
    );
    // Çevreyi vurgulayan kırmızı oklar
    final arrowPaint = Paint()
      ..color = Colors.red
      ..strokeWidth = 2;
    _drawArrow(canvas, p0, p1, arrowPaint);
    _drawArrow(canvas, p1, p2, arrowPaint);
    _drawArrow(canvas, p2, p0, arrowPaint);
    // Çevre etiketi
    _drawText(
      canvas,
      'Çevre',
      Offset(size.width * 0.5 - 28, size.height * 0.1),
      textStyle.copyWith(color: Colors.red, fontSize: 15),
    );
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
