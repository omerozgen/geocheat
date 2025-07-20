import '../../features/home/repositories/formula_repository.dart';

class ToggleFavoriteFormula {
  final IFormulaRepository repository;
  ToggleFavoriteFormula(this.repository);

  Future<void> call(String id) async {
    await repository.toggleFavorite(id);
  }
}
