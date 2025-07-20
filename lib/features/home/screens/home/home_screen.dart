import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../models/category.dart';
import '../../viewmodels/home_viewmodel.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../category/category_screen.dart';
import '../favorites/favorites_screen.dart';
// import 'package:auto_size_text/auto_size_text.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final categories = ref.watch(homeViewModelProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('GeoCheat'),
        centerTitle: true,
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
      body: LayoutBuilder(
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
    );
  }
}

class CategoryCard extends StatelessWidget {
  final Category category;
  const CategoryCard({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
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
                if (category.iconPath.endsWith('.svg'))
                  SvgPicture.asset(
                    category.iconPath,
                    width: 56,
                    height: 56,
                    placeholderBuilder: (context) =>
                        const Icon(Icons.category, size: 56),
                  )
                else
                  Icon(Icons.category, size: 56, color: Colors.blueAccent),
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
