import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import '../../models/category.dart';
import 'formula_list_screen.dart';
import '../home/home_screen.dart';

class CategoryScreen extends StatelessWidget {
  final Category category;
  const CategoryScreen({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    final subcategories = category.subcategories;
    if (subcategories.isEmpty) {
      // Alt kategori yoksa formül listesine yönlendir
      Future.microtask(() {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (_) => FormulaListScreen(categoryId: category.id),
          ),
        );
      });
      return const SizedBox.shrink();
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(
          tr('categories.${category.id}') == 'categories.${category.id}'
              ? category.name
              : tr('categories.${category.id}'),
        ),
        elevation: 0.5,
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
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: ListView.separated(
            itemCount: subcategories.length,
            separatorBuilder: (context, index) => const SizedBox(height: 16),
            itemBuilder: (context, index) {
              final sub = subcategories[index];
              return Card(
                elevation: 4,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                shadowColor: Colors.blueAccent.withOpacity(0.10),
                child: InkWell(
                  borderRadius: BorderRadius.circular(20),
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (_) => CategoryScreen(category: sub),
                      ),
                    );
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      gradient: LinearGradient(
                        colors: Theme.of(context).brightness == Brightness.dark
                            ? [
                                Colors.blueAccent.withOpacity(0.15),
                                const Color(0xFF3d3d3d),
                              ]
                            : [
                                Colors.blueAccent.withOpacity(0.06),
                                Colors.white,
                              ],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                    ),
                    padding: const EdgeInsets.symmetric(
                      vertical: 22,
                      horizontal: 18,
                    ),
                    child: Row(
                      children: [
                        if (category.id == 'triangles' &&
                            (sub.id == 'right_triangle' ||
                                sub.id == 'equilateral_triangle' ||
                                sub.id == 'isosceles_triangle'))
                          Padding(
                            padding: const EdgeInsets.only(right: 12),
                            child: _getTriangleIcon(sub.id),
                          )
                        else if (category.id == 'quadrilaterals' &&
                            (sub.id == 'square' ||
                                sub.id == 'rectangle' ||
                                sub.id == 'parallelogram' ||
                                sub.id == 'trapezoid' ||
                                sub.id == 'rhombus'))
                          Padding(
                            padding: const EdgeInsets.only(right: 12),
                            child: _getQuadrilateralIcon(sub.id),
                          )
                        else if (category.id == 'polygons' &&
                            (sub.id == 'pentagon' ||
                                sub.id == 'hexagon' ||
                                sub.id == 'ngon'))
                          Padding(
                            padding: const EdgeInsets.only(right: 12),
                            child: _getPolygonIcon(sub.id),
                          )
                        else if (category.id == 'circle' &&
                            (sub.id == 'circle_basic' ||
                                sub.id == 'disk' ||
                                sub.id == 'arc' ||
                                sub.id == 'chord'))
                          Padding(
                            padding: const EdgeInsets.only(right: 12),
                            child: _getCircleIcon(sub.id),
                          )
                        else if (category.id == 'analytic' &&
                            (sub.id == 'line' ||
                                sub.id == 'circle_analytic' ||
                                sub.id == 'parabola' ||
                                sub.id == 'ellipse' ||
                                sub.id == 'hyperbola'))
                          Padding(
                            padding: const EdgeInsets.only(right: 12),
                            child: _getAnalyticsIcon(sub.id),
                          )
                        else if (category.id == 'solids' &&
                            (sub.id == 'cube' ||
                                sub.id == 'rectangular_prism' ||
                                sub.id == 'cylinder' ||
                                sub.id == 'cone' ||
                                sub.id == 'sphere'))
                          Padding(
                            padding: const EdgeInsets.only(right: 12),
                            child: _getSolidIcon(sub.id),
                          )
                        else if (category.id == 'calculator' &&
                            (sub.id == 'basic_ops' ||
                                sub.id == 'trigonometry' ||
                                sub.id == 'logarithm' ||
                                sub.id == 'statistics'))
                          Padding(
                            padding: const EdgeInsets.only(right: 12),
                            child: _getCalculatorIcon(sub.id),
                          )
                        else if (sub.iconPath.endsWith('.svg'))
                          SizedBox(
                            width: 48,
                            height: 48,
                            child: Padding(
                              padding: const EdgeInsets.only(right: 12),
                              child: Icon(
                                Icons.category,
                                size: 40,
                                color: Colors.blueAccent,
                              ),
                            ),
                          )
                        else
                          Padding(
                            padding: const EdgeInsets.only(right: 12),
                            child: Icon(
                              Icons.category,
                              size: 40,
                              color: Colors.blueAccent,
                            ),
                          ),
                        Expanded(
                          child: Text(
                            tr('subcategories.${category.id}.${sub.id}') ==
                                    'subcategories.${category.id}.${sub.id}'
                                ? sub.name
                                : tr('subcategories.${category.id}.${sub.id}'),
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.black87,
                            ),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  Widget _getTriangleIcon(String subId) {
    switch (subId) {
      case 'right_triangle':
        return const RightTriangleIcon(size: 40);
      case 'equilateral_triangle':
        return const EquilateralTriangleIcon(size: 40);
      case 'isosceles_triangle':
        return const IsoscelesTriangleIcon(size: 40);
      default:
        return const TriangleIcon(size: 40); // Fallback
    }
  }

  Widget _getQuadrilateralIcon(String subId) {
    switch (subId) {
      case 'square':
        return const SquareIcon(size: 40);
      case 'rectangle':
        return const RectangleIcon(size: 40);
      case 'parallelogram':
        return const ParallelogramIcon(size: 40);
      case 'trapezoid':
        return const TrapezoidIcon(size: 40);
      case 'rhombus':
        return const RhombusIcon(size: 40);
      default:
        return const SquareIcon(size: 40); // Fallback
    }
  }

  Widget _getPolygonIcon(String subId) {
    switch (subId) {
      case 'pentagon':
        return const PentagonIcon(size: 40);
      case 'hexagon':
        return const HexagonIcon(size: 40);
      case 'ngon':
        return const NGonIcon(size: 40);
      default:
        return const PentagonIcon(size: 40); // Fallback
    }
  }

  Widget _getCircleIcon(String subId) {
    switch (subId) {
      case 'circle_basic':
        return const CircleBasicIcon(size: 40);
      case 'disk':
        return const DiskIcon(size: 40);
      case 'arc':
        return const ArcIcon(size: 40);
      case 'chord':
        return const ChordIcon(size: 40);
      default:
        return const CircleIcon(size: 40); // Fallback
    }
  }

  Widget _getAnalyticsIcon(String subId) {
    switch (subId) {
      case 'line':
        return const LineIcon(size: 40);
      case 'circle_analytic':
        return const CircleAnalyticIcon(size: 40);
      case 'parabola':
        return const ParabolaIcon(size: 40);
      case 'ellipse':
        return const EllipseIcon(size: 40);
      case 'hyperbola':
        return const HyperbolaIcon(size: 40);
      default:
        return const AnalitikIcon(size: 40); // Fallback
    }
  }

  Widget _getSolidIcon(String subId) {
    switch (subId) {
      case 'cube':
        return const CubeIcon(size: 40);
      case 'rectangular_prism':
        return const RectangularPrismIcon(size: 40);
      case 'cylinder':
        return const CylinderIcon(size: 40);
      case 'cone':
        return const ConeIcon(size: 40);
      case 'sphere':
        return const SphereIcon(size: 40);
      default:
        return const CubeIcon(size: 40); // Fallback
    }
  }

  Widget _getCalculatorIcon(String subId) {
    switch (subId) {
      case 'basic_ops':
        return const BasicOpsIcon(size: 40);
      case 'trigonometry':
        return const TrigonometryIcon(size: 40);
      case 'logarithm':
        return const LogarithmIcon(size: 40);
      case 'statistics':
        return const StatisticsIcon(size: 40);
      default:
        return const CalculatorIcon(size: 40); // Fallback
    }
  }
}
