import 'package:atom_companies_app/app/data/bloc/company_bloc.dart';
import 'package:atom_companies_app/app/data/models/company_model.dart';
import 'package:atom_companies_app/app/presentation/widgets/company_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SearchPage extends ConsumerStatefulWidget {
  const SearchPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() {
    return _SearchPageState();
  }
}

class _SearchPageState extends ConsumerState<SearchPage>{
  late FocusNode focusNode;
  late TextEditingController controller;
  List<CompanyModel> companies = [];

  @override
  void initState() {
    controller = TextEditingController();
    focusNode = FocusNode()..requestFocus();
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    focusNode.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            IconButton(onPressed: () {
                  Navigator.of(context).pop();
                  controller.clear();
                }, icon: Icon(Icons.arrow_back)),
                const SizedBox(height: 30,),
            // TextField(
            //   controller: controller,
            //   focusNode:focusNode,
            //   onChanged: (value) async{
            //     if(value.trim().isEmpty || controller.text.trim().isEmpty){
            //       context.read<CompanyBloc>().add(RequestedResetState());
            //       return;
            //     }
            //     await Future.delayed(
            //       const Duration(milliseconds: 1200),
            //       () {
            //         context.read<CompanyBloc>().add(RequestedCompaniesSearch(controller.text.trim()));
            //       },
            //     );
            //   },
            //   decoration: InputDecoration(
            //     focusedBorder: OutlineInputBorder(
            //       borderRadius: BorderRadius.circular(20),
            //       borderSide: BorderSide(
            //         color: Colors.black
            //       )
            //     ),
            //     border: OutlineInputBorder(
            //       borderRadius: BorderRadius.circular(20),
            //       borderSide: BorderSide(
            //         color: Colors.black
            //       )
            //     )
            //   ),
            // ),
            
            SearchBar(
              backgroundColor: WidgetStatePropertyAll<Color>(Colors.white),
              focusNode: focusNode,
              controller: controller,
              onChanged: (value) async{
                await Future.delayed(
                  const Duration(seconds: 3),
                  () {
                    if(value.trim().isNotEmpty){
                      context.read<CompanyBloc>().add(RequestedCompaniesSearch(value.trim()));
                      return;
                    }
                    context.read<CompanyBloc>().add(RequestedResetState());
                  },
                );
              },
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [BlocBuilder<CompanyBloc, CompanyState>(
                  builder: (context, state) {
                    if(state is CompanyLoading){
                      return Center(child: CircularProgressIndicator(color: Colors.blueAccent,),);
                    }else if(state is CompanySearchSuccess && controller.text.trim().isNotEmpty){
                      if(state.companies.isEmpty) return Center(child: Text('Nothing Found'),);
                      return Expanded(child: CompanyList(companies: state.companies));
                    }else if(state is CompanyError){
                      return Center(child: Text(state.message),);
                    }
                    return Center(
                      child: Text('Search for something'),
                    );
                  },
                )],
              ),
            )
          ],
        ),
      ),
    );
  }
}