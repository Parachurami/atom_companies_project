import 'package:atom_companies_app/app/data/models/category_model.dart';
import 'package:atom_companies_app/app/presentation/widgets/category_card.dart';
import 'package:flutter/material.dart';

class CategoryList extends StatelessWidget {
  const CategoryList({super.key, required this.categories});
  final List<CategoryModel> categories;
  @override
  Widget build(BuildContext context) {
    return Wrap(
      runSpacing: 20,
      spacing: 10,
      children: categories.map(
        (e) => CategoryCard(category: e),
      ).toList(),
    );
  }
}