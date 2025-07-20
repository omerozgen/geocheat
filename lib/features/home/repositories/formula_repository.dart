import 'package:hive/hive.dart';
import '../models/formula.dart';


abstract class IFormulaRepository {
  Future<List<Formula>> getAllFormulas();
  Future<void> addOrUpdateFormula(Formula formula);
  Future<void> toggleFavorite(String id);
  Future<List<Formula>> getFavorites();
}

class FormulaRepository {
  static const String boxName = 'formulas';

  Future<Box<Formula>> _openBox() async {
    return await Hive.openBox<Formula>(boxName);
  }

  Future<List<Formula>> getAllFormulas() async {
    final box = await _openBox();
    return box.values.toList();
  }

  Future<void> addOrUpdateFormula(Formula formula) async {
    final box = await _openBox();
    await box.put(formula.id, formula);
  }

  Future<void> toggleFavorite(String id) async {
    final box = await _openBox();
    final formula = box.get(id);
    if (formula != null) {
      final updated = formula.copyWith(isFavorited: !formula.isFavorited);
      await box.put(id, updated);
    }
  }

  Future<List<Formula>> getFavorites() async {
    final box = await _openBox();
    return box.values.where((f) => f.isFavorited).toList();
  }
}
