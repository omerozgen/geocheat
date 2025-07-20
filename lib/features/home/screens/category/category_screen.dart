import 'package:flutter/material.dart';
import '../../models/category.dart';
import 'formula_list_screen.dart';

class CategoryScreen extends StatelessWidget {
  final Category category;
  const CategoryScreen({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    final subcategories = category.subcategories;
    if (subcategories.isEmpty) {
      // Alt kategori yoksa formül listesine yönlendir
      Future.microtask(() {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (_) => FormulaListScreen(categoryId: category.id),
          ),
        );
      });
      return const SizedBox.shrink();
    }
    return Scaffold(
      appBar: AppBar(title: Text(category.name)),
      body: ListView.builder(
        itemCount: subcategories.length,
        itemBuilder: (context, index) {
          final sub = subcategories[index];
          return ListTile(
            title: Text(sub.name),
            leading: const Icon(Icons.category),
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (_) => CategoryScreen(category: sub),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
