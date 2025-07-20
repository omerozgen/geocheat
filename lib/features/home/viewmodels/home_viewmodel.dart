import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/constants/categories.dart';
import '../models/category.dart';

final homeViewModelProvider =
    StateNotifierProvider<HomeViewModel, List<Category>>((ref) {
      return HomeViewModel();
    });

class HomeViewModel extends StateNotifier<List<Category>> {
  HomeViewModel() : super(categories);
}
