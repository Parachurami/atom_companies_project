import 'package:atom_companies_app/app/data/bloc/company_bloc.dart';
import 'package:atom_companies_app/app/data/models/company_model.dart';
import 'package:atom_companies_app/app/data/providers/bookmark_provider.dart';
import 'package:atom_companies_app/app/data/providers/company_provider.dart';
import 'package:atom_companies_app/app/presentation/widgets/category_list.dart';
import 'package:atom_companies_app/app/presentation/widgets/review_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CompanyDetailPage extends ConsumerStatefulWidget {
  const CompanyDetailPage({super.key, required this.company});
  final CompanyModel company;

  @override
  ConsumerState<CompanyDetailPage> createState() => _CompanyDetailPageState();
}

class _CompanyDetailPageState extends ConsumerState<CompanyDetailPage> {
  Color defaultColor = Colors.black54;
  Color defaultTextColor = Colors.white;
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback(
      (timeStamp) {
        context.read<CompanyBloc>().add(RequestedCompanyDetail(widget.company.domain));
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    // final companies = ref.watch(companyProvider);
    final bookmarks = ref.watch(bookmarkProvider);
    final isBookmarked = bookmarks.contains(widget.company);
    
    final state = context.watch<CompanyBloc>().state;
    final deviceHeight = MediaQuery.of(context).size.height;
    if(state is CompanyDetailLoaded){
      Future.delayed(
        const Duration(milliseconds: 800),
        () {
          ref.read(companyProvider.notifier).addDetail(state.company);
        },
      );
    }
    return Scaffold(
      body:Stack(
        children: [
          Container(
            height: double.infinity,
            width: double.infinity,
            decoration: BoxDecoration(
              // color: Colors.amber,
              
            ),
            clipBehavior: Clip.hardEdge,
            child: Stack(
              children: [
                Positioned(
                  left: 0,
                  right: 0,
                  top: 0,
                  child: Image.network(
                    fit: BoxFit.fill,
                    width: double.infinity,
                    height: 300,
                    widget.company.logo ?? 
                      'https://www.accountancyage.com/wp-content/themes/accountancy-age/img/company-placeholder.png'),
                ),
                Positioned(
                  top: 10,
                  left: 10,
                  right: 10,
                  child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        onPressed: (){
                          Navigator.pop(context);
                          // context.read<CompanyBloc>().add(RequestedResetState());
                        },
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
                          isBookmarked ? ref.read(bookmarkProvider.notifier).removeFromBookmark(widget.company.company_id) : ref.read(bookmarkProvider.notifier).addToBookmark(widget.company);
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
              ],
            ),
           
          ),
          Positioned(
            top: 250,
            left: 0,
            right: 0,
            child: Container(
              padding: const EdgeInsets.all(20),
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(topLeft: Radius.circular(15), topRight: Radius.circular(15))
              ),
              child: BlocBuilder<CompanyBloc, CompanyState>(
                builder: (context, state) {
                  if(state is CompanyLoading){
                    return Center(
                      child: CircularProgressIndicator(color: Colors.blueAccent,),
                    );
                  }else if(state is CompanyError){
                    return Center(
                      child: Text(state.message),
                    );
                  }
                  else if(state is CompanyDetailLoaded){
                    return SizedBox(
                      width: double.infinity,
                      height: deviceHeight * 0.6,
                      child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Text(state.company.name,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 32
                            ),
                          ),
                          const SizedBox(height: 5,),
                          ReviewWidget(company: state.company),
                          const SizedBox(height: 10,),
                          CategoryList(categories: state.company.categories!, bgColor: defaultColor, textColor: defaultTextColor,),
                          const SizedBox(height: 20,),
                          Text('About',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: Colors.grey.shade900
                            ),
                          ),
                          const SizedBox(height: 5,),
                          SizedBox(
                            width: double.infinity,
                            height: deviceHeight * 0.3,
                            child: SingleChildScrollView(
                            
                              child: Text(state.company.about_company ?? 'No information yet',
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.grey.shade600
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                                        ),
                    );
                  }

                  return Container();
                }
              ),
            ),
          )
        ],
      )
    );
  }
}