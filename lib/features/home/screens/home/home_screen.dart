import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../models/category.dart';
import '../../viewmodels/home_viewmodel.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../category/category_screen.dart';
import '../favorites/favorites_screen.dart';
import 'dart:math';
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
              const WidgetSpan(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 2),
                  child: Text(
                    '∆',
                    style: TextStyle(color: Colors.black54, fontSize: 20),
                  ),
                ),
              ),
              TextSpan(
                text: 'Cheat',
                style: TextStyle(
                  color: Colors.black87,
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
        centerTitle: true,
        backgroundColor: const Color(0xFFe3f0ff),
        foregroundColor: Colors.black87,
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
        ],
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFFe3f0ff), Color(0xFFf6f8fb)],
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
      iconWidget = const _TriangleIcon(size: 56);
    } else if (category.id == 'quadrilaterals') {
      iconWidget = const _SquareIcon(size: 56);
    } else if (category.id == 'polygons') {
      iconWidget = const _PentagonIcon(size: 56);
    } else if (category.id == 'circle') {
      iconWidget = const _CircleIcon(size: 56);
    } else if (category.id == 'solids') {
      iconWidget = const _CubeIcon(size: 56);
    } else if (category.id == 'analytic') {
      iconWidget = const _RulerIcon(size: 56);
    } else if (category.id == 'calculator') {
      iconWidget = const _CalculatorIcon(size: 56);
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
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (_) => CategoryScreen(category: category),
              ),
            );
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

class _TriangleIcon extends StatelessWidget {
  final double size;
  const _TriangleIcon({this.size = 48});
  @override
  Widget build(BuildContext context) {
    return CustomPaint(size: Size(size, size), painter: _TrianglePainter());
  }
}

class _TrianglePainter extends CustomPainter {
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

class _SquareIcon extends StatelessWidget {
  final double size;
  const _SquareIcon({this.size = 48});
  @override
  Widget build(BuildContext context) {
    return CustomPaint(size: Size(size, size), painter: _SquarePainter());
  }
}

class _SquarePainter extends CustomPainter {
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

// Yeni ikon widgetları:
class _PentagonIcon extends StatelessWidget {
  final double size;
  const _PentagonIcon({this.size = 48});
  @override
  Widget build(BuildContext context) {
    return CustomPaint(size: Size(size, size), painter: _PentagonPainter());
  }
}

class _PentagonPainter extends CustomPainter {
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
      final x = cx + r * 0.85 * cos(angle);
      final y = cy + r * 0.85 * sin(angle);
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

class _CircleIcon extends StatelessWidget {
  final double size;
  const _CircleIcon({this.size = 48});
  @override
  Widget build(BuildContext context) {
    return CustomPaint(size: Size(size, size), painter: _CirclePainter());
  }
}

class _CirclePainter extends CustomPainter {
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

class _CubeIcon extends StatelessWidget {
  final double size;
  const _CubeIcon({this.size = 48});
  @override
  Widget build(BuildContext context) {
    return CustomPaint(size: Size(size, size), painter: _CubePainter());
  }
}

class _CubePainter extends CustomPainter {
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

class _RulerIcon extends StatelessWidget {
  final double size;
  const _RulerIcon({this.size = 48});
  @override
  Widget build(BuildContext context) {
    return CustomPaint(size: Size(size, size), painter: _RulerPainter());
  }
}

class _RulerPainter extends CustomPainter {
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

class _CalculatorIcon extends StatelessWidget {
  final double size;
  const _CalculatorIcon({this.size = 48});
  @override
  Widget build(BuildContext context) {
    return CustomPaint(size: Size(size, size), painter: _CalculatorPainter());
  }
}

class _CalculatorPainter extends CustomPainter {
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
