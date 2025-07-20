import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_math_fork/flutter_math.dart';
import '../../../../core/constants/categories.dart';
import '../../models/formula.dart';
import 'formula_detail_screen.dart';
import '../../viewmodels/favorites_viewmodel.dart';

class FormulaListScreen extends ConsumerWidget {
  final String categoryId;
  const FormulaListScreen({super.key, required this.categoryId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final List<Formula> filteredFormulas = formulas
        .where((f) => f.categoryId == categoryId)
        .toList();
    final favorites = ref.watch(favoritesProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Formüller')),
      body: filteredFormulas.isEmpty
          ? const Center(child: Text('Bu kategoriye ait formül yok.'))
          : ListView.builder(
              itemCount: filteredFormulas.length,
              itemBuilder: (context, index) {
                final formula = filteredFormulas[index];
                final isFavorited = favorites.contains(formula.id);
                return Card(
                  elevation: 4,
                  margin: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 10,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  shadowColor: Colors.blueAccent.withOpacity(0.10),
                  child: InkWell(
                    borderRadius: BorderRadius.circular(20),
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (_) => FormulaDetailScreen(formula: formula),
                        ),
                      );
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        gradient: LinearGradient(
                          colors: [
                            Colors.blueAccent.withOpacity(0.06),
                            Colors.white,
                          ],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                      ),
                      padding: const EdgeInsets.symmetric(
                        vertical: 18,
                        horizontal: 16,
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  formula.title,
                                  style: const TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black87,
                                  ),
                                ),
                                const SizedBox(height: 8),
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 6,
                                    horizontal: 10,
                                  ),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(12),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black12,
                                        blurRadius: 4,
                                        offset: Offset(0, 1),
                                      ),
                                    ],
                                  ),
                                  child: Math.tex(
                                    formula.formulaText,
                                    textStyle: const TextStyle(fontSize: 18),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(width: 8),
                          AnimatedSwitcher(
                            duration: const Duration(milliseconds: 250),
                            transitionBuilder: (child, anim) =>
                                ScaleTransition(scale: anim, child: child),
                            child: IconButton(
                              key: ValueKey(isFavorited),
                              icon: Icon(
                                isFavorited
                                    ? Icons.favorite
                                    : Icons.favorite_border,
                                color: isFavorited
                                    ? Colors.red
                                    : Colors.grey[400],
                                size: 28,
                              ),
                              onPressed: () {
                                ref
                                    .read(favoritesProvider.notifier)
                                    .toggleFavorite(formula.id);
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
    );
  }
}
