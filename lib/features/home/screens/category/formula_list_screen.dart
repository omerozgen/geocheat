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
    final favorites = ref.watch(favoritesViewModelProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Formüller')),
      body: filteredFormulas.isEmpty
          ? const Center(child: Text('Bu kategoriye ait formül yok.'))
          : ListView.builder(
              itemCount: filteredFormulas.length,
              itemBuilder: (context, index) {
                final formula = filteredFormulas[index];
                final isFavorited = favorites.any((f) => f.id == formula.id);
                return Card(
                  margin: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 8,
                  ),
                  child: ListTile(
                    title: Text(formula.title),
                    subtitle: Math.tex(
                      formula.formulaText,
                      textStyle: const TextStyle(fontSize: 18),
                    ),
                    trailing: IconButton(
                      icon: Icon(
                        isFavorited ? Icons.favorite : Icons.favorite_border,
                        color: isFavorited ? Colors.red : null,
                      ),
                      onPressed: () async {
                        await ref
                            .read(favoritesViewModelProvider.notifier)
                            .toggleFavorite(formula.id);
                      },
                    ),
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (_) => FormulaDetailScreen(formula: formula),
                        ),
                      );
                    },
                  ),
                );
              },
            ),
    );
  }
}
