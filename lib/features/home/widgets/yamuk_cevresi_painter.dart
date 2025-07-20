import 'package:flutter/material.dart';
import 'dart:math';

class YamukCevresiPainter extends StatelessWidget {
  final double size;
  const YamukCevresiPainter({super.key, this.size = 180});

  @override
  Widget build(BuildContext context) {
    return CustomPaint(size: Size(size, size), painter: _YamukCevresiPainter());
  }
}

class _YamukCevresiPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.blueAccent
      ..strokeWidth = 3
      ..style = PaintingStyle.stroke;
    // Düzgün klasik yamuk: alt ve üst taban paralel, yan kenarlar farklı uzunlukta
    final baseA = size.width * 0.7; // alt taban
    final baseC = size.width * 0.4; // üst taban
    final h = size.height * 0.45; // yükseklik
    // Alt taban ortalanmış
    final p0 = Offset((size.width - baseA) / 2, size.height * 0.8);
    final p1 = Offset(p0.dx + baseA, p0.dy);
    // Üst taban ortalanmış ve alt tabana göre yukarıda
    final p2 = Offset(p1.dx - (baseA - baseC) / 2, p0.dy - h);
    final p3 = Offset(p0.dx + (baseA - baseC) / 2, p0.dy - h);
    final path = Path()
      ..moveTo(p0.dx, p0.dy)
      ..lineTo(p1.dx, p1.dy)
      ..lineTo(p2.dx, p2.dy)
      ..lineTo(p3.dx, p3.dy)
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
      Offset((p0.dx + p1.dx) / 2 - 8, p0.dy + 10),
      textStyle,
    ); // alt taban
    _drawText(
      canvas,
      'b',
      Offset((p1.dx + p2.dx) / 2 + 8, (p1.dy + p2.dy) / 2 - 8),
      textStyle,
    ); // sağ kenar
    _drawText(
      canvas,
      'c',
      Offset((p2.dx + p3.dx) / 2 - 8, p2.dy - 18),
      textStyle,
    ); // üst taban
    _drawText(
      canvas,
      'd',
      Offset((p3.dx + p0.dx) / 2 - 28, (p3.dy + p0.dy) / 2 - 8),
      textStyle,
    ); // sol kenar
    // Çevreyi vurgulayan kırmızı oklar
    final arrowPaint = Paint()
      ..color = Colors.red
      ..strokeWidth = 2;
    _drawArrow(canvas, p0, p1, arrowPaint);
    _drawArrow(canvas, p1, p2, arrowPaint);
    _drawArrow(canvas, p2, p3, arrowPaint);
    _drawArrow(canvas, p3, p0, arrowPaint);
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
