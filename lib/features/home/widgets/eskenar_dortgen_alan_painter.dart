import 'package:flutter/material.dart';

class EskenarDortgenAlanPainter extends StatelessWidget {
  final double size;
  const EskenarDortgenAlanPainter({super.key, this.size = 180});

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: Size(size, size),
      painter: _EskenarDortgenAlanPainter(),
    );
  }
}

class _EskenarDortgenAlanPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    // Eşkenar dörtgen köşeleri
    final top = Offset(size.width / 2, size.height * 0.15);
    final right = Offset(size.width * 0.85, size.height / 2);
    final bottom = Offset(size.width / 2, size.height * 0.85);
    final left = Offset(size.width * 0.15, size.height / 2);

    // Alanı taralı göster (eşkenar dörtgenin içi)
    final areaPaint = Paint()
      ..color = Colors.teal.withOpacity(0.2)
      ..style = PaintingStyle.fill;
    final areaPath = Path()
      ..moveTo(top.dx, top.dy)
      ..lineTo(right.dx, right.dy)
      ..lineTo(bottom.dx, bottom.dy)
      ..lineTo(left.dx, left.dy)
      ..close();
    canvas.drawPath(areaPath, areaPaint);

    // Eşkenar dörtgenin kenarları
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

    // Köşegenler
    final diagPaint = Paint()
      ..color = Colors.purple
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2;
    canvas.drawLine(top, bottom, diagPaint);
    canvas.drawLine(left, right, diagPaint);

    // Kenar ve köşegen isimleri
    final textStyle = TextStyle(color: Colors.black, fontSize: 16);
    // a (kenar)
    _drawText(
      canvas,
      'a',
      Offset((top.dx + right.dx) / 2 + 8, (top.dy + right.dy) / 2 - 10),
      textStyle,
    );
    _drawText(
      canvas,
      'a',
      Offset((right.dx + bottom.dx) / 2 + 8, (right.dy + bottom.dy) / 2),
      textStyle,
    );
    _drawText(
      canvas,
      'a',
      Offset((bottom.dx + left.dx) / 2 - 18, (bottom.dy + left.dy) / 2 + 8),
      textStyle,
    );
    _drawText(
      canvas,
      'a',
      Offset((left.dx + top.dx) / 2 - 18, (left.dy + top.dy) / 2 - 10),
      textStyle,
    );
    // e, f (köşegenler)
    _drawText(
      canvas,
      'e',
      Offset((left.dx + right.dx) / 2 - 10, left.dy - 18),
      textStyle.copyWith(color: Colors.purple),
    );
    _drawText(
      canvas,
      'f',
      Offset(top.dx + 12, (top.dy + bottom.dy) / 2),
      textStyle.copyWith(color: Colors.purple),
    );
    // Alan etiketi
    _drawText(
      canvas,
      'Alan',
      Offset(
        (top.dx + bottom.dx + left.dx + right.dx) / 4,
        (top.dy + bottom.dy + left.dy + right.dy) / 4,
      ),
      textStyle.copyWith(fontSize: 14, color: Colors.teal),
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
