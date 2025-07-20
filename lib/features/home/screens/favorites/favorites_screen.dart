import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../viewmodels/favorites_viewmodel.dart';
import '../category/formula_detail_screen.dart';

class FavoritesScreen extends ConsumerWidget {
  const FavoritesScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final favorites = ref.watch(favoritesViewModelProvider);
    return Scaffold(
      appBar: AppBar(title: const Text('Favorilerim')),
      body: favorites.isEmpty
          ? const Center(child: Text('Henüz favori formül yok.'))
          : ListView.builder(
              itemCount: favorites.length,
              itemBuilder: (context, index) {
                final formula = favorites[index];
                return Card(
                  margin: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 8,
                  ),
                  child: ListTile(
                    title: Text(formula.title),
                    subtitle: Text(formula.formulaText),
                    trailing: Icon(
                      formula.isFavorited
                          ? Icons.favorite
                          : Icons.favorite_border,
                      color: formula.isFavorited ? Colors.red : null,
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
