import 'package:flutter/material.dart';
import 'dart:math';

class KureDilimPainter extends StatelessWidget {
  final double size;
  const KureDilimPainter({super.key, this.size = 180});

  @override
  Widget build(BuildContext context) {
    return CustomPaint(size: Size(size, size), painter: _KureDilimPainter());
  }
}

class _KureDilimPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = size.width * 0.32;
    // Küre gövdesi
    final spherePaint = Paint()
      ..color = Colors.blue[100]!
      ..style = PaintingStyle.fill;
    canvas.drawCircle(center, radius, spherePaint);
    final borderPaint = Paint()
      ..color = Colors.brown
      ..style = PaintingStyle.stroke
      ..strokeWidth = 3;
    canvas.drawCircle(center, radius, borderPaint);
    // Dilim vurgusu (örnek: 60 derece)
    final dilimPaint = Paint()
      ..color = Colors.green.withOpacity(0.22)
      ..style = PaintingStyle.fill;
    final startAngle = -pi / 3;
    final sweepAngle = pi / 3;
    final path = Path()
      ..moveTo(center.dx, center.dy)
      ..arcTo(
        Rect.fromCircle(center: center, radius: radius),
        startAngle,
        sweepAngle,
        false,
      )
      ..close();
    canvas.drawPath(path, dilimPaint);
    // 'V_dilim' etiketi
    final textStyle = TextStyle(
      color: Colors.green[900],
      fontSize: 16,
      fontWeight: FontWeight.bold,
    );
    final labelPos = Offset(center.dx + radius * 0.4, center.dy - radius * 0.4);
    _drawText(canvas, 'V_dilim', labelPos, textStyle);
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
