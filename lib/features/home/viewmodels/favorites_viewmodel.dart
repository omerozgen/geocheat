import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive/hive.dart';

final favoritesProvider =
    StateNotifierProvider<FavoritesViewModel, Set<String>>((ref) {
      return FavoritesViewModel();
    });

class FavoritesViewModel extends StateNotifier<Set<String>> {
  static const String _boxName = 'favorites';
  late Box box;

  FavoritesViewModel() : super({}) {
    _init();
  }

  Future<void> _init() async {
    box = await Hive.openBox(_boxName);
    final ids = box.get('ids', defaultValue: <String>[]).cast<String>();
    state = Set<String>.from(ids);
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
