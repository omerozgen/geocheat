import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../viewmodels/favorites_viewmodel.dart';
import 'package:geocheat/core/constants/categories.dart';
import '../category/formula_detail_screen.dart';
import 'package:flutter_math_fork/flutter_math.dart';

class FavoritesScreen extends ConsumerWidget {
  const FavoritesScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final favoriteIds = ref.watch(favoritesProvider);
    final filteredFormulas = formulas
        .where((f) => favoriteIds.contains(f.id))
        .toList();
    return Scaffold(
      appBar: AppBar(title: const Text('Favorilerim')),
      body: filteredFormulas.isEmpty
          ? const Center(child: Text('Henüz favori formül yok.'))
          : ListView.builder(
              itemCount: filteredFormulas.length,
              itemBuilder: (context, index) {
                final formula = filteredFormulas[index];
                return ListTile(
                  title: Text(formula.title),
                  subtitle: Math.tex(
                    formula.formulaText,
                    textStyle: const TextStyle(fontSize: 18),
                  ),
                  trailing: IconButton(
                    icon: const Icon(Icons.favorite, color: Colors.red),
                    onPressed: () {
                      ref
                          .read(favoritesProvider.notifier)
                          .toggleFavorite(formula.id);
                    },
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => FormulaDetailScreen(formula: formula),
                      ),
                    );
                  },
                );
              },
            ),
    );
  }
}
