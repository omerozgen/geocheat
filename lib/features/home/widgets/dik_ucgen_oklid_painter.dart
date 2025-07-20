import 'package:flutter/material.dart';
import 'dart:math';

class DikUcgenOklidPainter extends StatelessWidget {
  final double size;
  const DikUcgenOklidPainter({super.key, this.size = 180});

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: Size(size, size),
      painter: _DikUcgenOklidPainter(),
    );
  }
}

class _DikUcgenOklidPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    // Ortak yükseklikle bitişik iki dik üçgen
    final double margin = size.width * 0.18;
    final double base1 = size.width * 0.28; // sol üçgen tabanı (p)
    final double base2 = size.width * 0.28; // sağ üçgen tabanı (k)
    final double h = size.height * 0.48; // yükseklik (ortak kenar)
    final Offset A = Offset(margin, size.height - margin); // sol alt
    final Offset D = Offset(
      margin + base1,
      size.height - margin,
    ); // orta alt (yüksekliğin indiği nokta)
    final Offset B = Offset(
      margin + base1 + base2,
      size.height - margin,
    ); // sağ alt
    final Offset C = Offset(
      margin + base1,
      size.height - margin - h,
    ); // üst (ortak tepe)

    // Sol üçgen (A-D-C)
    final trianglePaint = Paint()
      ..color = Colors.orange.withOpacity(0.13)
      ..style = PaintingStyle.fill;
    final leftTriangle = Path()
      ..moveTo(A.dx, A.dy)
      ..lineTo(D.dx, D.dy)
      ..lineTo(C.dx, C.dy)
      ..close();
    canvas.drawPath(leftTriangle, trianglePaint);
    final borderPaint = Paint()
      ..color = Colors.orange
      ..style = PaintingStyle.stroke
      ..strokeWidth = 3;
    canvas.drawPath(leftTriangle, borderPaint);

    // Sağ üçgen (D-B-C)
    final rightTriangle = Path()
      ..moveTo(D.dx, D.dy)
      ..lineTo(B.dx, B.dy)
      ..lineTo(C.dx, C.dy)
      ..close();
    canvas.drawPath(rightTriangle, trianglePaint);
    canvas.drawPath(rightTriangle, borderPaint);

    // Ortak yükseklik çizgisi (C-D)
    final heightPaint = Paint()
      ..color = Colors.red
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2;
    canvas.drawLine(C, D, heightPaint);

    // Kenar isimleri ve etiketler
    final textStyle = TextStyle(color: Colors.black, fontSize: 15);
    // Sol üçgen kenarları
    _drawText(canvas, 'A', Offset(A.dx - 12, A.dy + 2), textStyle);
    _drawText(
      canvas,
      'D',
      Offset(D.dx - 2, D.dy + 8),
      textStyle.copyWith(fontSize: 13),
    );
    _drawText(canvas, 'C', Offset(C.dx - 12, C.dy - 18), textStyle);
    _drawText(canvas, 'p', Offset((A.dx + D.dx) / 2 - 10, A.dy + 8), textStyle);
    // Sağ üçgen kenarları
    _drawText(canvas, 'B', Offset(B.dx + 2, B.dy + 2), textStyle);
    _drawText(canvas, 'k', Offset((B.dx + D.dx) / 2 + 8, B.dy + 8), textStyle);
    // Ortak yükseklik
    _drawText(
      canvas,
      'h',
      Offset(D.dx + 6, (C.dy + D.dy) / 2 - 10),
      textStyle.copyWith(color: Colors.red),
    );
    // Hipotenüs (A-B)
    _drawText(
      canvas,
      'c',
      Offset((A.dx + B.dx) / 2 - 10, A.dy + 18),
      textStyle,
    );
    // Etiket
    _drawText(
      canvas,
      'Öklid',
      Offset((A.dx + B.dx) / 2 - 24, size.height * 0.1),
      textStyle.copyWith(fontSize: 14, color: Colors.orange),
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
