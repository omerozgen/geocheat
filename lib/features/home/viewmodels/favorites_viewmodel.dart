import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive/hive.dart';
import 'package:geocheat/core/database/hive_boxes.dart';

final favoritesProvider =
    StateNotifierProvider<FavoritesViewModel, Set<String>>((ref) {
      return FavoritesViewModel();
    });

class FavoritesViewModel extends StateNotifier<Set<String>> {
  late Box<List> box;

  FavoritesViewModel() : super({}) {
    _init();
  }

  Future<void> _init() async {
    box = HiveBoxes.getFavoritesListBox();
    final List stored = box.get('ids', defaultValue: <String>[]) as List;
    state = Set<String>.from(stored.cast<String>());
  }

  void toggleFavorite(String formulaId) {
    final newState = Set<String>.from(state);
    if (newState.contains(formulaId)) {
      newState.remove(formulaId);
    } else {
      newState.add(formulaId);
    }
    state = newState;
    box.put('ids', state.toList());
  }

  bool isFavorite(String formulaId) {
    return state.contains(formulaId);
  }
}
