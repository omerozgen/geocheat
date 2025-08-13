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
    // Favorites are stored as a simple List<String> under key 'ids'
    await Hive.openBox<List>(favoritesBox);
    // Settings kutusunu tiplenmemiş aç: eski veriler Map<dynamic,dynamic> olabilir
    await Hive.openBox(settingsBox);
    await Hive.openBox<Formula>(formulasBox);
  }

  static Box<List> getFavoritesListBox() {
    return Hive.box<List>(favoritesBox);
  }

  static Box getSettingsBox() {
    return Hive.box(settingsBox);
  }

  static Box<Formula> getFormulasBox() {
    return Hive.box<Formula>(formulasBox);
  }
}
