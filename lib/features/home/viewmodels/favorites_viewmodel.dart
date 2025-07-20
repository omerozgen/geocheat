import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/formula.dart';
import '../repositories/formula_repository.dart';

final favoritesViewModelProvider =
    StateNotifierProvider<FavoritesViewModel, List<Formula>>((ref) {
      return FavoritesViewModel();
    });

class FavoritesViewModel extends StateNotifier<List<Formula>> {
  final FormulaRepository _repo = FormulaRepository();
  FavoritesViewModel() : super([]) {
    loadFavorites();
  }

  Future<void> loadFavorites() async {
    state = await _repo.getFavorites();
  }

  Future<void> toggleFavorite(String id) async {
    await _repo.toggleFavorite(id);
    await loadFavorites();
  }
}
