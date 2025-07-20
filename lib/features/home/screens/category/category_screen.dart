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
      appBar: AppBar(
        title: Text(category.name),
        backgroundColor: const Color(0xFFe3f0ff),
        foregroundColor: Colors.black87,
        elevation: 0.5,
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFFe3f0ff), Color(0xFFf6f8fb)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: ListView.separated(
            itemCount: subcategories.length,
            separatorBuilder: (context, index) => const SizedBox(height: 16),
            itemBuilder: (context, index) {
              final sub = subcategories[index];
              return Card(
                elevation: 4,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                shadowColor: Colors.blueAccent.withOpacity(0.10),
                child: InkWell(
                  borderRadius: BorderRadius.circular(20),
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (_) => CategoryScreen(category: sub),
                      ),
                    );
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      gradient: LinearGradient(
                        colors: [
                          Colors.blueAccent.withOpacity(0.06),
                          Colors.white,
                        ],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                    ),
                    padding: const EdgeInsets.symmetric(
                      vertical: 22,
                      horizontal: 18,
                    ),
                    child: Row(
                      children: [
                        if (sub.iconPath.endsWith('.svg'))
                          SizedBox(
                            width: 48,
                            height: 48,
                            child: Padding(
                              padding: const EdgeInsets.only(right: 12),
                              child: Icon(
                                Icons.category,
                                size: 40,
                                color: Colors.blueAccent,
                              ),
                            ),
                          )
                        else
                          Padding(
                            padding: const EdgeInsets.only(right: 12),
                            child: Icon(
                              Icons.category,
                              size: 40,
                              color: Colors.blueAccent,
                            ),
                          ),
                        Expanded(
                          child: Text(
                            sub.name,
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.black87,
                            ),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
