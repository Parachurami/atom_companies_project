import 'package:atom_companies_app/app/data/models/company_model.dart';
import 'package:atom_companies_app/app/presentation/pages/company_detail_page.dart';
import 'package:atom_companies_app/app/presentation/widgets/review_widget.dart';
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
        child: FadeInImage(
          placeholder: AssetImage('assets/images/company-placeholder.png'), 
          image: NetworkImage(company.logo?? ''),
          fit: BoxFit.cover,
        )
      ),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ReviewWidget(company: company)
        ],
      ),
      style: ListTileStyle.list,
    );
  }
}