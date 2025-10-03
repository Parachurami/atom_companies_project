import 'package:atom_companies_app/app/data/bloc/company_bloc.dart';
import 'package:atom_companies_app/app/data/models/company_model.dart';
import 'package:atom_companies_app/app/data/providers/company_data_provider.dart';
import 'package:atom_companies_app/app/presentation/pages/search_page.dart';
import 'package:atom_companies_app/app/presentation/widgets/company_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      context.read<CompanyBloc>().add(RequestedCompaniesList());
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context){
    final state = context.watch<CompanyBloc>().state;
    List<CompanyModel> companies = ref.watch(companyDataProvider);

    if (state is CompanySuccess) {
      Future.delayed(const Duration(milliseconds: 800),
        () {
          ref.read(companyDataProvider.notifier).getCompanies(state.companies);
        },
      );
    }
    return Scaffold(
      body: BlocConsumer<CompanyBloc, CompanyState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          if(state is CompanySuccess || companies.isNotEmpty){
          
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                GestureDetector(
                  onTap: () => Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) {
                        return SearchPage();
                      },
                    ),
                  ),
                  child: Container(
                    width: double.infinity,
                    padding: const EdgeInsets.only(
                      top: 10,
                      bottom: 10,
                      left: 20,
                      right: 20,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(width: 1, color: Colors.black),
                    ),
                    child: Text('Search...'),
                  ),
                ),
                Expanded(child: CompanyList(companies: companies)),
              ],
                        ),
            );
          }else if(state is CompanyLoading && companies.isEmpty){
            return Center(
              child: CircularProgressIndicator(color: Colors.blueAccent,),
            );
          }else if(state is CompanyError){

          return Center(child: Text(state.message),);
          }
          return Container();
        },
      ),
    );
  }
}
