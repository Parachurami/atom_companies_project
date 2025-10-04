import 'package:atom_companies_app/app/data/models/category_model.dart';
import 'package:atom_companies_app/app/presentation/widgets/category_card.dart';
import 'package:flutter/material.dart';

class CategoryList extends StatelessWidget {
  const CategoryList({super.key, required this.categories, required this.bgColor, required this.textColor});
  final List<CategoryModel> categories;
  final Color bgColor;
  final Color textColor;
  @override
  Widget build(BuildContext context) {
    return Wrap(
      runSpacing: 20,
      alignment: WrapAlignment.start,
      spacing: 10,
      children: categories.map(
        (e) => CategoryCard(category: e, bgColor: bgColor, textColor: textColor,),
      ).toList(),
    );
  }
}