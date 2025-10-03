import 'package:atom_companies_app/app/data/models/company_model.dart';
import 'package:atom_companies_app/app/data/providers/bookmark_provider.dart';
import 'package:atom_companies_app/app/presentation/widgets/category_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CompanyDetailPage extends ConsumerWidget {
  const CompanyDetailPage({super.key, required this.company});
  final CompanyModel company;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bookmarks = ref.watch(bookmarkProvider);
    final isBookmarked = bookmarks.contains(company);
    return Scaffold(
      body:Stack(
        children: [
          Container(
            height: 300,
            width: double.infinity,
            padding: const EdgeInsets.all(5),
            decoration: BoxDecoration(
              // color: Colors.amber,
              image: DecorationImage(
                fit: BoxFit.fill,
                image: NetworkImage(
                  company.logo ?? 
                  'https://www.accountancyage.com/wp-content/themes/accountancy-age/img/company-placeholder.png',
                )
              )
            ),
            clipBehavior: Clip.hardEdge,
            child: Align(
              alignment: AlignmentGeometry.topCenter,
              child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    onPressed: () => Navigator.pop(context),
                    style: IconButton.styleFrom(
                      backgroundColor: Colors.black,
                      padding: const EdgeInsets.all(5),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(100)
                      )
                    ),
                    icon: Icon(
                      Icons.arrow_back, 
                      color: Colors.white,
                    )
                  ),
                  IconButton(
                    onPressed: (){
                      isBookmarked ? ref.read(bookmarkProvider.notifier).removeFromBookmark(company.company_id) : ref.read(bookmarkProvider.notifier).addToBookmark(company);
                    },
                    style: IconButton.styleFrom(
                      backgroundColor: Colors.black,
                      padding: const EdgeInsets.all(5),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(100)
                      )
                    ),
                    icon: isBookmarked ? Icon(Icons.star_rounded, color: Colors.amber,) : Icon(Icons.star_border_rounded, color: Colors.white,)
                  ),
                ],
              ),
            ),
           
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              padding: const EdgeInsets.all(20),
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(topLeft: Radius.circular(15), topRight: Radius.circular(15))
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(company.name,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 32
                    ),
                  ),
                  const SizedBox(height: 10,),
                  CategoryList(categories: company.categories!)
                ],
              ),
            ),
          )
        ],
      )
    );
  }
}