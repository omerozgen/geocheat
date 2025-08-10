import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../models/category.dart';
import '../../viewmodels/home_viewmodel.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../category/category_screen.dart';
import '../favorites/favorites_screen.dart';
import 'dart:math' as math;
import '../../../calculator/screens/calculator_screen.dart';
import '../../../settings/screens/settings_screen.dart';
// import 'package:auto_size_text/auto_size_text.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final categories = ref.watch(homeViewModelProvider);
    return Scaffold(
      appBar: AppBar(
        title: RichText(
          text: TextSpan(
            style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            children: [
              TextSpan(
                text: 'Geo',
                style: TextStyle(
                  color: Colors.blueAccent,
                  fontWeight: FontWeight.bold,
                ),
              ),
              WidgetSpan(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 2),
                  child: Text(
                    '∆',
                    style: TextStyle(
                      color: Theme.of(context).brightness == Brightness.dark
                          ? Colors.white70
                          : Colors.black54,
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
              TextSpan(
                text: 'Cheat',
                style: TextStyle(
                  color: Theme.of(context).brightness == Brightness.dark
                      ? Colors.white
                      : Colors.black87,
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
        centerTitle: true,

        elevation: 0.5,
        actions: [
          IconButton(
            icon: const Icon(Icons.favorite),
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (_) => const FavoritesScreen()),
              );
            },
          ),
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {
              Navigator.of(
                context,
              ).push(MaterialPageRoute(builder: (_) => const SettingsScreen()));
            },
          ),
        ],
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: Theme.of(context).brightness == Brightness.dark
                ? [const Color(0xFF2d2d2d), const Color(0xFF1a1a1a)]
                : [const Color(0xFFe3f0ff), const Color(0xFFf6f8fb)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: LayoutBuilder(
          builder: (context, constraints) {
            int crossAxisCount = 2;
            double aspectRatio = 1.1;
            if (constraints.maxWidth < 400) {
              crossAxisCount = 1;
              aspectRatio = 2.2;
            } else if (constraints.maxWidth > 700) {
              crossAxisCount = 3;
              aspectRatio = 1.1;
            }
            return Padding(
              padding: const EdgeInsets.all(12.0),
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: crossAxisCount,
                  mainAxisSpacing: 16,
                  crossAxisSpacing: 16,
                  childAspectRatio: aspectRatio,
                ),
                itemCount: categories.length,
                itemBuilder: (context, index) {
                  final category = categories[index];
                  return CategoryCard(category: category);
                },
              ),
            );
          },
        ),
      ),
    );
  }
}

class CategoryCard extends StatelessWidget {
  final Category category;
  const CategoryCard({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    Widget iconWidget;
    if (category.id == 'triangles') {
      iconWidget = const TriangleIcon(size: 56);
    } else if (category.id == 'quadrilaterals') {
      iconWidget = const SquareIcon(size: 56);
    } else if (category.id == 'polygons') {
      iconWidget = const PentagonIcon(size: 56);
    } else if (category.id == 'circle') {
      iconWidget = const CircleIcon(size: 56);
    } else if (category.id == 'solids') {
      iconWidget = const CubeIcon(size: 56);
    } else if (category.id == 'analytic') {
      iconWidget = const AnalitikIcon(size: 56);
    } else if (category.id == 'calculator') {
      iconWidget = const CalculatorIcon(size: 56);
    } else {
      iconWidget = Icon(Icons.category, size: 56, color: Colors.blueAccent);
    }
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      curve: Curves.easeInOut,
      child: Card(
        elevation: 6,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
        shadowColor: Colors.blueAccent.withOpacity(0.12),
        child: InkWell(
          borderRadius: BorderRadius.circular(24),
          splashColor: Colors.blueAccent.withOpacity(0.08),
          highlightColor: Colors.blueAccent.withOpacity(0.04),
          onTap: () {
            if (category.id == 'calculator') {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (_) => const CalculatorScreen()),
              );
            } else {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (_) => CategoryScreen(category: category),
                ),
              );
            }
          },
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(24),
              gradient: LinearGradient(
                colors: [Colors.blueAccent.withOpacity(0.08), Colors.white],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 12),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                iconWidget,
                const SizedBox(height: 18),
                Text(
                  category.name,
                  style: theme.textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: Colors.blueGrey[900],
                    fontSize: 16,
                  ),
                  textAlign: TextAlign.center,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  softWrap: true,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class TriangleIcon extends StatelessWidget {
  final double size;
  const TriangleIcon({this.size = 48});
  @override
  Widget build(BuildContext context) {
    return CustomPaint(size: Size(size, size), painter: TrianglePainter());
  }
}

class TrianglePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.blueAccent
      ..style = PaintingStyle.fill;
    final path = Path();
    path.moveTo(size.width / 2, 0);
    path.lineTo(0, size.height);
    path.lineTo(size.width, size.height);
    path.close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class SquareIcon extends StatelessWidget {
  final double size;
  const SquareIcon({this.size = 48});
  @override
  Widget build(BuildContext context) {
    return CustomPaint(size: Size(size, size), painter: SquarePainter());
  }
}

class SquarePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.blueAccent
      ..style = PaintingStyle.fill;
    final rect = Rect.fromLTWH(0, 0, size.width, size.height);
    canvas.drawRect(rect, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class PentagonIcon extends StatelessWidget {
  final double size;
  const PentagonIcon({this.size = 48});
  @override
  Widget build(BuildContext context) {
    return CustomPaint(size: Size(size, size), painter: PentagonPainter());
  }
}

class PentagonPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.blueAccent
      ..style = PaintingStyle.fill;
    final path = Path();
    final n = 5;
    final r = size.width / 2;
    final cx = size.width / 2;
    final cy = size.height / 2 + 4;
    for (int i = 0; i < n; i++) {
      final angle = (2 * 3.141592653589793 * i / n) - 3.14159 / 2;
      final x = cx + r * 0.85 * math.cos(angle);
      final y = cy + r * 0.85 * math.sin(angle);
      if (i == 0) {
        path.moveTo(x, y);
      } else {
        path.lineTo(x, y);
      }
    }
    path.close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class CircleIcon extends StatelessWidget {
  final double size;
  const CircleIcon({this.size = 48});
  @override
  Widget build(BuildContext context) {
    return CustomPaint(size: Size(size, size), painter: CirclePainter());
  }
}

class CirclePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.blueAccent
      ..style = PaintingStyle.fill;
    canvas.drawCircle(
      Offset(size.width / 2, size.height / 2),
      size.width / 2,
      paint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class CubeIcon extends StatelessWidget {
  final double size;
  const CubeIcon({this.size = 48});
  @override
  Widget build(BuildContext context) {
    return CustomPaint(size: Size(size, size), painter: CubePainter());
  }
}

class CubePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.blueAccent
      ..style = PaintingStyle.stroke
      ..strokeWidth = 3;
    final double s = size.width * 0.6;
    final double offset = size.width * 0.18;
    final rect = Rect.fromLTWH(offset, offset, s, s);
    canvas.drawRect(rect, paint);
    final path = Path();
    path.moveTo(offset, offset);
    path.lineTo(offset + s * 0.5, offset - s * 0.3);
    path.lineTo(offset + s * 1.5, offset - s * 0.3);
    path.lineTo(offset + s, offset);
    path.moveTo(offset + s, offset);
    path.lineTo(offset + s * 1.5, offset - s * 0.3);
    path.lineTo(offset + s * 1.5, offset + s * 0.7);
    path.lineTo(offset + s, offset + s);
    path.moveTo(offset + s, offset + s);
    path.lineTo(offset + s * 1.5, offset + s * 0.7);
    path.lineTo(offset + s * 0.5, offset + s * 0.7);
    path.lineTo(offset, offset + s);
    path.lineTo(offset, offset);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class RulerIcon extends StatelessWidget {
  final double size;
  const RulerIcon({this.size = 48});
  @override
  Widget build(BuildContext context) {
    return CustomPaint(size: Size(size, size), painter: RulerPainter());
  }
}

class RulerPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.blueAccent
      ..style = PaintingStyle.stroke
      ..strokeWidth = 3;
    final rect = Rect.fromLTWH(
      size.width * 0.15,
      size.height * 0.6,
      size.width * 0.7,
      size.height * 0.18,
    );
    canvas.drawRect(rect, paint);
    for (int i = 1; i < 6; i++) {
      final x = size.width * 0.15 + i * size.width * 0.7 / 6;
      canvas.drawLine(
        Offset(x, size.height * 0.6),
        Offset(x, size.height * 0.78),
        paint,
      );
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class CalculatorIcon extends StatelessWidget {
  final double size;
  const CalculatorIcon({this.size = 48});
  @override
  Widget build(BuildContext context) {
    return CustomPaint(size: Size(size, size), painter: CalculatorPainter());
  }
}

class CalculatorPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.blueAccent
      ..style = PaintingStyle.stroke
      ..strokeWidth = 3;
    final rect = Rect.fromLTWH(
      size.width * 0.18,
      size.height * 0.18,
      size.width * 0.64,
      size.height * 0.64,
    );
    canvas.drawRect(rect, paint);
    final buttonPaint = Paint()
      ..color = Colors.blueAccent
      ..style = PaintingStyle.fill;
    for (int row = 0; row < 3; row++) {
      for (int col = 0; col < 3; col++) {
        final cx = size.width * 0.28 + col * size.width * 0.18;
        final cy = size.height * 0.28 + row * size.height * 0.18;
        canvas.drawCircle(Offset(cx, cy), size.width * 0.04, buttonPaint);
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class AnalitikIcon extends StatelessWidget {
  final double size;
  const AnalitikIcon({this.size = 48});
  @override
  Widget build(BuildContext context) {
    return CustomPaint(size: Size(size, size), painter: AnalitikPainter());
  }
}

class AnalitikPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.blueAccent
      ..strokeWidth = 3
      ..style = PaintingStyle.stroke;
    // x ekseni
    canvas.drawLine(
      Offset(size.width * 0.15, size.height * 0.85),
      Offset(size.width * 0.85, size.height * 0.85),
      paint,
    );
    // y ekseni
    canvas.drawLine(
      Offset(size.width * 0.15, size.height * 0.85),
      Offset(size.width * 0.15, size.height * 0.15),
      paint,
    );
    // x ok ucu
    final arrowSize = size.width * 0.06;
    canvas.drawLine(
      Offset(size.width * 0.85, size.height * 0.85),
      Offset(size.width * 0.85 - arrowSize, size.height * 0.85 - arrowSize),
      paint,
    );
    canvas.drawLine(
      Offset(size.width * 0.85, size.height * 0.85),
      Offset(size.width * 0.85 - arrowSize, size.height * 0.85 + arrowSize),
      paint,
    );
    // y ok ucu
    canvas.drawLine(
      Offset(size.width * 0.15, size.height * 0.15),
      Offset(size.width * 0.15 - arrowSize, size.height * 0.15 + arrowSize),
      paint,
    );
    canvas.drawLine(
      Offset(size.width * 0.15, size.height * 0.15),
      Offset(size.width * 0.15 + arrowSize, size.height * 0.15 + arrowSize),
      paint,
    );
    // Orijine küçük bir daire
    final fillPaint = Paint()
      ..color = Colors.blueAccent
      ..style = PaintingStyle.fill;
    canvas.drawCircle(
      Offset(size.width * 0.15, size.height * 0.85),
      size.width * 0.03,
      fillPaint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

// Katı Cisimler için özel ikonlar
class SphereIcon extends StatelessWidget {
  final double size;
  const SphereIcon({this.size = 48});
  @override
  Widget build(BuildContext context) {
    return CustomPaint(size: Size(size, size), painter: SpherePainter());
  }
}

class SpherePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.blueAccent
      ..style = PaintingStyle.fill;
    final center = Offset(size.width / 2, size.height / 2);
    final radius = size.width * 0.4;
    canvas.drawCircle(center, radius, paint);

    // 3D efekti için gölge
    final shadowPaint = Paint()
      ..color = Colors.blueAccent.withOpacity(0.3)
      ..style = PaintingStyle.fill;
    canvas.drawCircle(
      Offset(center.dx + radius * 0.3, center.dy + radius * 0.3),
      radius * 0.8,
      shadowPaint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class ConeIcon extends StatelessWidget {
  final double size;
  const ConeIcon({this.size = 48});
  @override
  Widget build(BuildContext context) {
    return CustomPaint(size: Size(size, size), painter: ConePainter());
  }
}

class ConePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.blueAccent
      ..style = PaintingStyle.fill;

    final center = Offset(size.width / 2, size.height * 0.7);
    final radius = size.width * 0.25;
    final topY = size.height * 0.2;

    // Taban dairesi
    canvas.drawCircle(center, radius, paint);

    // Koni gövdesi
    final path = Path()
      ..moveTo(center.dx - radius, center.dy)
      ..lineTo(center.dx, topY)
      ..lineTo(center.dx + radius, center.dy)
      ..close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class CylinderIcon extends StatelessWidget {
  final double size;
  const CylinderIcon({this.size = 48});
  @override
  Widget build(BuildContext context) {
    return CustomPaint(size: Size(size, size), painter: CylinderPainter());
  }
}

class CylinderPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.blueAccent
      ..style = PaintingStyle.fill;

    final center = Offset(size.width / 2, size.height / 2);
    final radius = size.width * 0.25;
    final height = size.height * 0.4;

    // Üst elips
    final topRect = Rect.fromCenter(
      center: Offset(center.dx, center.dy - height / 2),
      width: radius * 2,
      height: radius * 0.6,
    );
    canvas.drawOval(topRect, paint);

    // Alt elips
    final bottomRect = Rect.fromCenter(
      center: Offset(center.dx, center.dy + height / 2),
      width: radius * 2,
      height: radius * 0.6,
    );
    canvas.drawOval(bottomRect, paint);

    // Yan yüz
    final sidePath = Path()
      ..moveTo(center.dx - radius, center.dy - height / 2)
      ..lineTo(center.dx - radius, center.dy + height / 2)
      ..arcToPoint(
        Offset(center.dx + radius, center.dy + height / 2),
        radius: Radius.elliptical(radius, radius * 0.3),
        clockwise: false,
      )
      ..lineTo(center.dx + radius, center.dy - height / 2)
      ..arcToPoint(
        Offset(center.dx - radius, center.dy - height / 2),
        radius: Radius.elliptical(radius, radius * 0.3),
        clockwise: false,
      )
      ..close();
    canvas.drawPath(sidePath, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class RectangularPrismIcon extends StatelessWidget {
  final double size;
  const RectangularPrismIcon({this.size = 48});
  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: Size(size, size),
      painter: RectangularPrismPainter(),
    );
  }
}

class RectangularPrismPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.blueAccent
      ..style = PaintingStyle.stroke
      ..strokeWidth = 3;

    final double width = size.width * 0.5;
    final double height = size.height * 0.4;
    final double depth = size.width * 0.3;
    final double offset = size.width * 0.15;

    // Ön yüz
    final frontRect = Rect.fromLTWH(offset, offset, width, height);
    canvas.drawRect(frontRect, paint);

    // Arka yüz
    final backRect = Rect.fromLTWH(
      offset + depth,
      offset - depth,
      width,
      height,
    );
    canvas.drawRect(backRect, paint);

    // Bağlantı çizgileri
    canvas.drawLine(
      Offset(offset, offset),
      Offset(offset + depth, offset - depth),
      paint,
    );
    canvas.drawLine(
      Offset(offset + width, offset),
      Offset(offset + width + depth, offset - depth),
      paint,
    );
    canvas.drawLine(
      Offset(offset, offset + height),
      Offset(offset + depth, offset + height - depth),
      paint,
    );
    canvas.drawLine(
      Offset(offset + width, offset + height),
      Offset(offset + width + depth, offset + height - depth),
      paint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

// Üçgenler için özel ikonlar
class RightTriangleIcon extends StatelessWidget {
  final double size;
  const RightTriangleIcon({this.size = 48});
  @override
  Widget build(BuildContext context) {
    return CustomPaint(size: Size(size, size), painter: RightTrianglePainter());
  }
}

class RightTrianglePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.blueAccent
      ..style = PaintingStyle.fill;

    final path = Path()
      ..moveTo(size.width * 0.2, size.height * 0.8)
      ..lineTo(size.width * 0.2, size.height * 0.2)
      ..lineTo(size.width * 0.8, size.height * 0.8)
      ..close();
    canvas.drawPath(path, paint);

    // Dik açı işareti
    final rightAnglePaint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2;
    final squareSize = size.width * 0.15;
    canvas.drawRect(
      Rect.fromLTWH(
        size.width * 0.2,
        size.height * 0.65,
        squareSize,
        squareSize,
      ),
      rightAnglePaint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class EquilateralTriangleIcon extends StatelessWidget {
  final double size;
  const EquilateralTriangleIcon({this.size = 48});
  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: Size(size, size),
      painter: EquilateralTrianglePainter(),
    );
  }
}

class EquilateralTrianglePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.blueAccent
      ..style = PaintingStyle.fill;

    final center = Offset(size.width / 2, size.height * 0.7);
    final radius = size.width * 0.35;

    final path = Path()
      ..moveTo(center.dx, center.dy - radius)
      ..lineTo(center.dx - radius * 0.866, center.dy + radius * 0.5)
      ..lineTo(center.dx + radius * 0.866, center.dy + radius * 0.5)
      ..close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class IsoscelesTriangleIcon extends StatelessWidget {
  final double size;
  const IsoscelesTriangleIcon({this.size = 48});
  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: Size(size, size),
      painter: IsoscelesTrianglePainter(),
    );
  }
}

class IsoscelesTrianglePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.blueAccent
      ..style = PaintingStyle.fill;

    final path = Path()
      ..moveTo(size.width / 2, size.height * 0.2)
      ..lineTo(size.width * 0.15, size.height * 0.8)
      ..lineTo(size.width * 0.85, size.height * 0.8)
      ..close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

// Dörtgenler için özel ikonlar
class RectangleIcon extends StatelessWidget {
  final double size;
  const RectangleIcon({this.size = 48});
  @override
  Widget build(BuildContext context) {
    return CustomPaint(size: Size(size, size), painter: RectanglePainter());
  }
}

class RectanglePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.blueAccent
      ..style = PaintingStyle.fill;

    final rect = Rect.fromLTWH(
      size.width * 0.15,
      size.height * 0.25,
      size.width * 0.7,
      size.height * 0.5,
    );
    canvas.drawRect(rect, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class ParallelogramIcon extends StatelessWidget {
  final double size;
  const ParallelogramIcon({this.size = 48});
  @override
  Widget build(BuildContext context) {
    return CustomPaint(size: Size(size, size), painter: ParallelogramPainter());
  }
}

class ParallelogramPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.blueAccent
      ..style = PaintingStyle.fill;

    final path = Path()
      ..moveTo(size.width * 0.25, size.height * 0.2)
      ..lineTo(size.width * 0.75, size.height * 0.2)
      ..lineTo(size.width * 0.85, size.height * 0.8)
      ..lineTo(size.width * 0.35, size.height * 0.8)
      ..close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class TrapezoidIcon extends StatelessWidget {
  final double size;
  const TrapezoidIcon({this.size = 48});
  @override
  Widget build(BuildContext context) {
    return CustomPaint(size: Size(size, size), painter: TrapezoidPainter());
  }
}

class TrapezoidPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.blueAccent
      ..style = PaintingStyle.fill;

    final path = Path()
      ..moveTo(size.width * 0.2, size.height * 0.8)
      ..lineTo(size.width * 0.8, size.height * 0.8)
      ..lineTo(size.width * 0.9, size.height * 0.2)
      ..lineTo(size.width * 0.1, size.height * 0.2)
      ..close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class RhombusIcon extends StatelessWidget {
  final double size;
  const RhombusIcon({this.size = 48});
  @override
  Widget build(BuildContext context) {
    return CustomPaint(size: Size(size, size), painter: RhombusPainter());
  }
}

class RhombusPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.blueAccent
      ..style = PaintingStyle.fill;

    final center = Offset(size.width / 2, size.height / 2);
    final width = size.width * 0.6;
    final height = size.height * 0.6;

    final path = Path()
      ..moveTo(center.dx, center.dy - height / 2)
      ..lineTo(center.dx + width / 2, center.dy)
      ..lineTo(center.dx, center.dy + height / 2)
      ..lineTo(center.dx - width / 2, center.dy)
      ..close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

// Çokgenler için özel ikonlar
class HexagonIcon extends StatelessWidget {
  final double size;
  const HexagonIcon({this.size = 48});
  @override
  Widget build(BuildContext context) {
    return CustomPaint(size: Size(size, size), painter: HexagonPainter());
  }
}

class HexagonPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.blueAccent
      ..style = PaintingStyle.fill;

    final center = Offset(size.width / 2, size.height / 2);
    final radius = size.width * 0.35;

    final path = Path();
    for (int i = 0; i < 6; i++) {
      final angle = (2 * 3.14159 * i / 6) - 3.14159 / 2;
      final x = center.dx + radius * math.cos(angle);
      final y = center.dy + radius * math.sin(angle);
      if (i == 0) {
        path.moveTo(x, y);
      } else {
        path.lineTo(x, y);
      }
    }
    path.close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class NGonIcon extends StatelessWidget {
  final double size;
  const NGonIcon({this.size = 48});
  @override
  Widget build(BuildContext context) {
    return CustomPaint(size: Size(size, size), painter: NGonPainter());
  }
}

class NGonPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.blueAccent
      ..style = PaintingStyle.fill;

    final center = Offset(size.width / 2, size.height / 2);
    final radius = size.width * 0.3;

    final path = Path();
    for (int i = 0; i < 8; i++) {
      final angle = (2 * 3.14159 * i / 8) - 3.14159 / 2;
      final x = center.dx + radius * math.cos(angle);
      final y = center.dy + radius * math.sin(angle);
      if (i == 0) {
        path.moveTo(x, y);
      } else {
        path.lineTo(x, y);
      }
    }
    path.close();
    canvas.drawPath(path, paint);

    // n etiketi
    final textPaint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.fill;
    final textStyle = TextStyle(
      color: Colors.white,
      fontSize: size.width * 0.2,
      fontWeight: FontWeight.bold,
    );
    _drawText(canvas, 'n', center, textStyle);
  }

  void _drawText(Canvas canvas, String text, Offset pos, TextStyle style) {
    final textSpan = TextSpan(text: text, style: style);
    final tp = TextPainter(text: textSpan, textDirection: TextDirection.ltr);
    tp.layout();
    tp.paint(canvas, pos - Offset(tp.width / 2, tp.height / 2));
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

// Çember ve Daire için özel ikonlar
class CircleBasicIcon extends StatelessWidget {
  final double size;
  const CircleBasicIcon({this.size = 48});
  @override
  Widget build(BuildContext context) {
    return CustomPaint(size: Size(size, size), painter: CircleBasicPainter());
  }
}

class CircleBasicPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.blueAccent
      ..style = PaintingStyle.stroke
      ..strokeWidth = 3;

    final center = Offset(size.width / 2, size.height / 2);
    final radius = size.width * 0.35;
    canvas.drawCircle(center, radius, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class DiskIcon extends StatelessWidget {
  final double size;
  const DiskIcon({this.size = 48});
  @override
  Widget build(BuildContext context) {
    return CustomPaint(size: Size(size, size), painter: DiskPainter());
  }
}

class DiskPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.blueAccent
      ..style = PaintingStyle.fill;

    final center = Offset(size.width / 2, size.height / 2);
    final radius = size.width * 0.35;
    canvas.drawCircle(center, radius, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class ArcIcon extends StatelessWidget {
  final double size;
  const ArcIcon({this.size = 48});
  @override
  Widget build(BuildContext context) {
    return CustomPaint(size: Size(size, size), painter: ArcPainter());
  }
}

class ArcPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.blueAccent
      ..style = PaintingStyle.stroke
      ..strokeWidth = 3;

    final center = Offset(size.width / 2, size.height / 2);
    final radius = size.width * 0.35;

    final rect = Rect.fromCenter(
      center: center,
      width: radius * 2,
      height: radius * 2,
    );
    canvas.drawArc(rect, 0, 3.14159, false, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class ChordIcon extends StatelessWidget {
  final double size;
  const ChordIcon({this.size = 48});
  @override
  Widget build(BuildContext context) {
    return CustomPaint(size: Size(size, size), painter: ChordPainter());
  }
}

class ChordPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.blueAccent
      ..style = PaintingStyle.stroke
      ..strokeWidth = 3;

    final center = Offset(size.width / 2, size.height / 2);
    final radius = size.width * 0.35;

    // Çember
    canvas.drawCircle(center, radius, paint);

    // Kiriş çizgisi
    final chordPaint = Paint()
      ..color = Colors.red
      ..style = PaintingStyle.stroke
      ..strokeWidth = 3;
    canvas.drawLine(
      Offset(center.dx - radius * 0.7, center.dy + radius * 0.7),
      Offset(center.dx + radius * 0.7, center.dy + radius * 0.7),
      chordPaint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

// Analitik Geometri için özel ikonlar
class LineIcon extends StatelessWidget {
  final double size;
  const LineIcon({this.size = 48});
  @override
  Widget build(BuildContext context) {
    return CustomPaint(size: Size(size, size), painter: LinePainter());
  }
}

class LinePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.blueAccent
      ..style = PaintingStyle.stroke
      ..strokeWidth = 3;

    // Doğru çizgisi
    canvas.drawLine(
      Offset(size.width * 0.1, size.height * 0.8),
      Offset(size.width * 0.9, size.height * 0.2),
      paint,
    );

    // Ok uçları
    final arrowSize = size.width * 0.08;
    final endPoint = Offset(size.width * 0.9, size.height * 0.2);
    final direction = Offset(
      (size.width * 0.9 - size.width * 0.1) / size.width,
      (size.height * 0.2 - size.height * 0.8) / size.height,
    );
    final normal = Offset(-direction.dy, direction.dx);

    canvas.drawLine(
      endPoint,
      endPoint -
          Offset(
            (direction.dx - normal.dx * 0.5) * arrowSize,
            (direction.dy - normal.dy * 0.5) * arrowSize,
          ),
      paint,
    );
    canvas.drawLine(
      endPoint,
      endPoint -
          Offset(
            (direction.dx + normal.dx * 0.5) * arrowSize,
            (direction.dy + normal.dy * 0.5) * arrowSize,
          ),
      paint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class CircleAnalyticIcon extends StatelessWidget {
  final double size;
  const CircleAnalyticIcon({this.size = 48});
  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: Size(size, size),
      painter: CircleAnalyticPainter(),
    );
  }
}

class CircleAnalyticPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.blueAccent
      ..style = PaintingStyle.stroke
      ..strokeWidth = 3;

    final center = Offset(size.width / 2, size.height / 2);
    final radius = size.width * 0.3;
    canvas.drawCircle(center, radius, paint);

    // Koordinat eksenleri
    final axisPaint = Paint()
      ..color = Colors.red
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2;

    // x ekseni
    canvas.drawLine(
      Offset(center.dx - radius * 1.2, center.dy),
      Offset(center.dx + radius * 1.2, center.dy),
      axisPaint,
    );

    // y ekseni
    canvas.drawLine(
      Offset(center.dx, center.dy - radius * 1.2),
      Offset(center.dx, center.dy + radius * 1.2),
      axisPaint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class ParabolaIcon extends StatelessWidget {
  final double size;
  const ParabolaIcon({this.size = 48});
  @override
  Widget build(BuildContext context) {
    return CustomPaint(size: Size(size, size), painter: ParabolaPainter());
  }
}

class ParabolaPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.blueAccent
      ..style = PaintingStyle.stroke
      ..strokeWidth = 3;

    final center = Offset(size.width / 2, size.height * 0.7);
    final width = size.width * 0.6;
    final height = size.height * 0.4;

    final path = Path();
    for (int i = 0; i <= 100; i++) {
      final t = (i / 100.0) * 2 - 1; // -1 to 1
      final x = center.dx + t * width / 2;
      final y = center.dy - (t * t) * height;
      if (i == 0) {
        path.moveTo(x, y);
      } else {
        path.lineTo(x, y);
      }
    }
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class EllipseIcon extends StatelessWidget {
  final double size;
  const EllipseIcon({this.size = 48});
  @override
  Widget build(BuildContext context) {
    return CustomPaint(size: Size(size, size), painter: EllipsePainter());
  }
}

class EllipsePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.blueAccent
      ..style = PaintingStyle.stroke
      ..strokeWidth = 3;

    final center = Offset(size.width / 2, size.height / 2);
    final width = size.width * 0.6;
    final height = size.height * 0.4;

    final rect = Rect.fromCenter(center: center, width: width, height: height);
    canvas.drawOval(rect, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class HyperbolaIcon extends StatelessWidget {
  final double size;
  const HyperbolaIcon({this.size = 48});
  @override
  Widget build(BuildContext context) {
    return CustomPaint(size: Size(size, size), painter: HyperbolaPainter());
  }
}

class HyperbolaPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.blueAccent
      ..style = PaintingStyle.stroke
      ..strokeWidth = 3;

    final center = Offset(size.width / 2, size.height / 2);
    final width = size.width * 0.4;
    final height = size.height * 0.3;

    // Sol hiperbol
    final leftPath = Path();
    for (int i = 0; i <= 50; i++) {
      final t = (i / 50.0) * 2 - 1; // -1 to 1
      final x = center.dx - width / 2 - (t * t) * width / 4;
      final y = center.dy + t * height / 2;
      if (i == 0) {
        leftPath.moveTo(x, y);
      } else {
        leftPath.lineTo(x, y);
      }
    }
    canvas.drawPath(leftPath, paint);

    // Sağ hiperbol
    final rightPath = Path();
    for (int i = 0; i <= 50; i++) {
      final t = (i / 50.0) * 2 - 1; // -1 to 1
      final x = center.dx + width / 2 + (t * t) * width / 4;
      final y = center.dy + t * height / 2;
      if (i == 0) {
        rightPath.moveTo(x, y);
      } else {
        rightPath.lineTo(x, y);
      }
    }
    canvas.drawPath(rightPath, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

// Hesap Makinesi için özel ikonlar
class BasicOpsIcon extends StatelessWidget {
  final double size;
  const BasicOpsIcon({this.size = 48});
  @override
  Widget build(BuildContext context) {
    return CustomPaint(size: Size(size, size), painter: BasicOpsPainter());
  }
}

class BasicOpsPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.blueAccent
      ..style = PaintingStyle.stroke
      ..strokeWidth = 3;

    // Hesap makinesi çerçevesi
    final rect = Rect.fromLTWH(
      size.width * 0.1,
      size.height * 0.1,
      size.width * 0.8,
      size.height * 0.8,
    );
    canvas.drawRect(rect, paint);

    // Ekran
    final screenRect = Rect.fromLTWH(
      size.width * 0.15,
      size.height * 0.2,
      size.width * 0.7,
      size.height * 0.25,
    );
    canvas.drawRect(screenRect, paint);

    // Tuşlar
    final buttonPaint = Paint()
      ..color = Colors.blueAccent
      ..style = PaintingStyle.fill;

    // Sayı tuşları
    for (int i = 0; i < 3; i++) {
      for (int j = 0; j < 3; j++) {
        final buttonRect = Rect.fromLTWH(
          size.width * 0.2 + i * size.width * 0.2,
          size.height * 0.55 + j * size.height * 0.15,
          size.width * 0.15,
          size.height * 0.12,
        );
        canvas.drawRect(buttonRect, buttonPaint);
      }
    }

    // İşlem tuşları
    final opPaint = Paint()
      ..color = Colors.orange
      ..style = PaintingStyle.fill;

    final opRect = Rect.fromLTWH(
      size.width * 0.8,
      size.height * 0.55,
      size.width * 0.15,
      size.height * 0.12,
    );
    canvas.drawRect(opRect, opPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class TrigonometryIcon extends StatelessWidget {
  final double size;
  const TrigonometryIcon({this.size = 48});
  @override
  Widget build(BuildContext context) {
    return CustomPaint(size: Size(size, size), painter: TrigonometryPainter());
  }
}

class TrigonometryPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.blueAccent
      ..style = PaintingStyle.stroke
      ..strokeWidth = 3;

    final center = Offset(size.width / 2, size.height / 2);
    final radius = size.width * 0.3;

    // Birim çember
    canvas.drawCircle(center, radius, paint);

    // Koordinat eksenleri
    final axisPaint = Paint()
      ..color = Colors.red
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2;

    canvas.drawLine(
      Offset(center.dx - radius * 1.2, center.dy),
      Offset(center.dx + radius * 1.2, center.dy),
      axisPaint,
    );
    canvas.drawLine(
      Offset(center.dx, center.dy - radius * 1.2),
      Offset(center.dx, center.dy + radius * 1.2),
      axisPaint,
    );

    // Açı
    final anglePaint = Paint()
      ..color = Colors.green
      ..style = PaintingStyle.stroke
      ..strokeWidth = 3;

    final angle = 0.785; // 45 derece
    final endPoint = Offset(
      center.dx + radius * math.cos(angle),
      center.dy - radius * math.sin(angle),
    );

    canvas.drawLine(center, endPoint, anglePaint);

    // Açı yayı
    final arcRect = Rect.fromCenter(
      center: center,
      width: radius * 0.5,
      height: radius * 0.5,
    );
    canvas.drawArc(arcRect, 0, angle, false, anglePaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class LogarithmIcon extends StatelessWidget {
  final double size;
  const LogarithmIcon({this.size = 48});
  @override
  Widget build(BuildContext context) {
    return CustomPaint(size: Size(size, size), painter: LogarithmPainter());
  }
}

class LogarithmPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.blueAccent
      ..style = PaintingStyle.stroke
      ..strokeWidth = 3;

    // Logaritma eğrisi
    final path = Path();
    for (int i = 0; i <= 100; i++) {
      final x = size.width * 0.1 + (i / 100.0) * size.width * 0.8;
      final y =
          size.height * 0.8 -
          (math.log(i / 100.0 + 0.1) / math.log(10)) * size.height * 0.3;
      if (i == 0) {
        path.moveTo(x, y);
      } else {
        path.lineTo(x, y);
      }
    }
    canvas.drawPath(path, paint);

    // x ekseni
    final axisPaint = Paint()
      ..color = Colors.red
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2;

    canvas.drawLine(
      Offset(size.width * 0.1, size.height * 0.8),
      Offset(size.width * 0.9, size.height * 0.8),
      axisPaint,
    );

    // y ekseni
    canvas.drawLine(
      Offset(size.width * 0.1, size.height * 0.1),
      Offset(size.width * 0.1, size.height * 0.8),
      axisPaint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class StatisticsIcon extends StatelessWidget {
  final double size;
  const StatisticsIcon({this.size = 48});
  @override
  Widget build(BuildContext context) {
    return CustomPaint(size: Size(size, size), painter: StatisticsPainter());
  }
}

class StatisticsPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.blueAccent
      ..style = PaintingStyle.fill;

    final barWidth = size.width * 0.15;
    final maxHeight = size.height * 0.6;

    // Çubuk grafik
    final bars = [0.3, 0.7, 0.5, 0.9, 0.4, 0.6];
    for (int i = 0; i < bars.length; i++) {
      final barHeight = bars[i] * maxHeight;
      final barRect = Rect.fromLTWH(
        size.width * 0.1 + i * (barWidth + size.width * 0.02),
        size.height * 0.8 - barHeight,
        barWidth,
        barHeight,
      );
      canvas.drawRect(barRect, paint);
    }

    // x ekseni
    final axisPaint = Paint()
      ..color = Colors.red
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2;

    canvas.drawLine(
      Offset(size.width * 0.1, size.height * 0.8),
      Offset(size.width * 0.9, size.height * 0.8),
      axisPaint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
