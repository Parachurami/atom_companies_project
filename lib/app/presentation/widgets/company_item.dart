import 'package:atom_companies_app/app/data/models/company_model.dart';
import 'package:atom_companies_app/app/presentation/pages/company_detail_page.dart';
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
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) {
              return CompanyDetailPage(company: company);
            },
          )
        );
      },
      leading: Container(
        width: 50,
        height: 50,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50)
        ),
        child: Hero(
          tag: company.company_id,
          child: FadeInImage(
            placeholder: NetworkImage('https://www.accountancyage.com/wp-content/themes/accountancy-age/img/company-placeholder.png'), 
            image: NetworkImage(company.logo?? ''),
            fit: BoxFit.cover,
          )
        )
      ),
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