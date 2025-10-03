import 'package:atom_companies_app/app/data/models/company_model.dart';
import 'package:flutter/material.dart';

class CompanyItem extends StatelessWidget {
  final CompanyModel company;
  const CompanyItem({super.key, required this.company});

  @override
  Widget build(BuildContext context) {
  //   return InkWell(
  //     child: Container(
  //       decoration: BoxDecoration(
  //         color: Colors.white,
  //         borderRadius: BorderRadius.circular(20),
  //         boxShadow: [
  //           BoxShadow(
  //             color: Colors.black,
  //             offset: Offset(0, 1),
  //             blurRadius: 1,
  //             spreadRadius: 2,
  //             blurStyle: BlurStyle.outer
  //           )
  //         ]
  //       ),
  //       child: Column(
  //         children: [
  //           Text(company.name),
  //           Row(
  //             children: [
  //               Text(company.email ?? '')
  //             ],
  //           )
  //         ],
  //       ),
  //     ),
  //   );
    return ListTile(
      title: Text(company.name),
      onTap: () {
        
      },
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              for(int i=0; i < int.parse(company.rating); i++)
                Icon(Icons.star_rounded, color: Colors.amber,),
          
              Text('(${company.review_count ?? ''}) reviews')
            ],
          ),
        ],
      ),
      style: ListTileStyle.list,
    );
  }
}