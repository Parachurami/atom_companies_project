import 'package:atom_companies_app/app/data/models/company_model.dart';
import 'package:atom_companies_app/app/presentation/widgets/company_item.dart';
import 'package:flutter/material.dart';

class CompanyList extends StatelessWidget {
  final List<CompanyModel> companies;
  const CompanyList({super.key, required this.companies});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: companies.length,
      itemBuilder: (context, index) {
        return CompanyItem(company: companies[index]);
      },
    );
  }
}