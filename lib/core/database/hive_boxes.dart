import 'package:hive_flutter/hive_flutter.dart';
import '../../features/home/models/category.dart';
import '../../features/home/models/formula.dart';

class HiveBoxes {
  static const String favoritesBox = 'favorites';
  static const String settingsBox = 'settings';
  static const String formulasBox = 'formulas';

  static Future<void> init() async {
    // Type adapters'ları kaydet
    Hive.registerAdapter(FormulaAdapter());
    Hive.registerAdapter(CategoryAdapter());

    // Kutuları aç
    await Hive.openBox<Set<String>>(favoritesBox);
    await Hive.openBox<Map<String, dynamic>>(settingsBox);
    await Hive.openBox<Formula>(formulasBox);
  }

  static Box<Set<String>> getFavoritesBox() {
    return Hive.box<Set<String>>(favoritesBox);
  }

  static Box<Map<String, dynamic>> getSettingsBox() {
    return Hive.box<Map<String, dynamic>>(settingsBox);
  }

  static Box<Formula> getFormulasBox() {
    return Hive.box<Formula>(formulasBox);
  }
}
