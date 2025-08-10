import 'package:flutter/material.dart';
import 'dart:math';

class BesgenCevresiPainter extends StatelessWidget {
  final double size;
  const BesgenCevresiPainter({super.key, this.size = 180});

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: Size(size, size),
      painter: _BesgenCevresiPainter(),
    );
  }
}

class _BesgenCevresiPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = size.width * 0.35;
    final angle = 2 * pi / 5;
    // Beşgen köşeleri
    final points = List.generate(5, (i) {
      final theta = -pi / 2 + i * angle;
      return Offset(
        center.dx + radius * cos(theta),
        center.dy + radius * sin(theta),
      );
    });
    // Kenar çizgileri
    final borderPaint = Paint()
      ..color = Colors.deepPurple
      ..style = PaintingStyle.stroke
      ..strokeWidth = 3;
    final borderPath = Path()..moveTo(points[0].dx, points[0].dy);
    for (var i = 1; i < 5; i++) {
      borderPath.lineTo(points[i].dx, points[i].dy);
    }
    borderPath.close();
    canvas.drawPath(borderPath, borderPaint);
    // Kenar etiketleri
    final textStyle = TextStyle(
      color: Colors.black,
      fontSize: 16,
      fontWeight: FontWeight.bold,
    );
    for (var i = 0; i < 5; i++) {
      final p1 = points[i];
      final p2 = points[(i + 1) % 5];
      final mid = Offset((p1.dx + p2.dx) / 2, (p1.dy + p2.dy) / 2);
      _drawText(canvas, 'a', mid, textStyle);
    }
    // Çevreyi vurgulayan kırmızı oklar
    final arrowPaint = Paint()
      ..color = Colors.red
      ..strokeWidth = 2;
    for (var i = 0; i < 5; i++) {
      final p1 = points[i];
      final p2 = points[(i + 1) % 5];
      _drawArrow(canvas, p1, p2, arrowPaint);
    }
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
