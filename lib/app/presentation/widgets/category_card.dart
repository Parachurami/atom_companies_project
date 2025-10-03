import 'package:atom_companies_app/app/data/models/category_model.dart';
import 'package:flutter/material.dart';

class CategoryCard extends StatelessWidget {
  const CategoryCard({super.key, required this.category});
  final CategoryModel category;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 7, right: 7, top: 5, bottom: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        color: const Color.fromARGB(208, 68, 137, 255)
      ),
      child: Text(category.name,
        style: TextStyle(
          color: Colors.white,
          fontSize: 15
        ),
      ),
    );
  }
}