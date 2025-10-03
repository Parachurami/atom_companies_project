import 'package:atom_companies_app/app/data/models/company_model.dart';
import 'package:atom_companies_app/app/presentation/widgets/rating_builder.dart';
import 'package:flutter/material.dart';

class CompanyItem extends StatelessWidget {
  final CompanyModel company;
  const CompanyItem({super.key, required this.company});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      key: ValueKey(company.company_id),
      title: Text(company.name),
      onTap: () {
        
      },
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              RatingBuilder(rating: company.rating),
              Text('(${company.review_count ?? ''})')
            ],
          ),
        ],
      ),
      style: ListTileStyle.list,
    );
  }
}