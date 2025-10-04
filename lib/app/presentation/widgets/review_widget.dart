import 'package:atom_companies_app/app/data/models/company_model.dart';
import 'package:atom_companies_app/app/presentation/widgets/rating_builder.dart';
import 'package:flutter/material.dart';

class ReviewWidget extends StatelessWidget {
  const ReviewWidget({super.key, required this.company});
  final CompanyModel company;

  @override
  Widget build(BuildContext context) {
    return Row(
            children: [
              RatingBuilder(rating: company.rating),
              Text('(${company.review_count ?? ''} reviews)')
            ],
          );
  }
}