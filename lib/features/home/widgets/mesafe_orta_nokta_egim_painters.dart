import 'package:flutter/material.dart';

class NoktalarArasiMesafePainter extends StatelessWidget {
  final double size;
  const NoktalarArasiMesafePainter({super.key, this.size = 180});
  @override
  Widget build(BuildContext context) =>
      CustomPaint(size: Size(size, size), painter: _MesafePainter());
}

class _MesafePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paintAxis = Paint()
      ..color = Colors.blueAccent
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2;
    final cx = size.width / 2, cy = size.height / 2;
    // axes
    canvas.drawLine(Offset(10, cy), Offset(size.width - 10, cy), paintAxis);
    canvas.drawLine(Offset(cx, 10), Offset(cx, size.height - 10), paintAxis);

    final p1 = Offset(cx - size.width * 0.25, cy + size.height * 0.2);
    final p2 = Offset(cx + size.width * 0.3, cy - size.height * 0.15);
    final pointPaint = Paint()..color = Colors.red;
    canvas.drawCircle(p1, 4, pointPaint);
    canvas.drawCircle(p2, 4, pointPaint);

    final dPaint = Paint()
      ..color = Colors.green
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2.5;
    canvas.drawLine(p1, p2, dPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class NoktadanDogruyaMesafePainter extends StatelessWidget {
  final double size;
  const NoktadanDogruyaMesafePainter({super.key, this.size = 180});
  @override
  Widget build(BuildContext context) =>
      CustomPaint(size: Size(size, size), painter: _NoktadanDogruyaPainter());
}

class _NoktadanDogruyaPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paintLine = Paint()
      ..color = Colors.blueAccent
      ..style = PaintingStyle.stroke
      ..strokeWidth = 3;
    // line y = ax + b approx
    final pA = Offset(20, size.height * 0.25);
    final pB = Offset(size.width - 20, size.height * 0.75);
    canvas.drawLine(pA, pB, paintLine);

    // point
    final p = Offset(size.width * 0.7, size.height * 0.25);
    final pointPaint = Paint()..color = Colors.red;
    canvas.drawCircle(p, 4, pointPaint);

    // perpendicular
    final perp = Paint()
      ..color = Colors.green
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2.5;
    // projection on line
    final proj = Offset(size.width * 0.6, size.height * 0.5);
    canvas.drawLine(p, proj, perp);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class EgimPainter extends StatelessWidget {
  final double size;
  const EgimPainter({super.key, this.size = 180});
  @override
  Widget build(BuildContext context) =>
      CustomPaint(size: Size(size, size), painter: _EgimPainter());
}

class _EgimPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final axis = Paint()
      ..color = Colors.blueAccent
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2;
    final cx = size.width / 2, cy = size.height / 2;
    canvas.drawLine(Offset(10, cy), Offset(size.width - 10, cy), axis);
    canvas.drawLine(Offset(cx, 10), Offset(cx, size.height - 10), axis);

    final line = Paint()
      ..color = Colors.green
      ..style = PaintingStyle.stroke
      ..strokeWidth = 3;
    canvas.drawLine(Offset(cx - 60, cy + 40), Offset(cx + 60, cy - 20), line);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class OrtaNoktaPainter extends StatelessWidget {
  final double size;
  const OrtaNoktaPainter({super.key, this.size = 180});
  @override
  Widget build(BuildContext context) =>
      CustomPaint(size: Size(size, size), painter: _OrtaNoktaCPainter());
}

class _OrtaNoktaCPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final axis = Paint()
      ..color = Colors.blueAccent
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2;
    final cx = size.width / 2, cy = size.height / 2;
    canvas.drawLine(Offset(10, cy), Offset(size.width - 10, cy), axis);
    canvas.drawLine(Offset(cx, 10), Offset(cx, size.height - 10), axis);

    final p1 = Offset(cx - 50, cy + 30);
    final p2 = Offset(cx + 70, cy - 10);
    final mid = Offset((p1.dx + p2.dx) / 2, (p1.dy + p2.dy) / 2);
    final pointPaint = Paint()..color = Colors.red;
    canvas.drawCircle(p1, 4, pointPaint);
    canvas.drawCircle(p2, 4, pointPaint);

    final midPaint = Paint()..color = Colors.orange;
    canvas.drawCircle(mid, 4, midPaint);
    final conn = Paint()
      ..color = Colors.green
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2;
    canvas.drawLine(p1, p2, conn);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
