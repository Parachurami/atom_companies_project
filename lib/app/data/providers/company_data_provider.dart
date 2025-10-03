import 'package:atom_companies_app/app/data/models/company_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:hive_flutter/adapters.dart';

final _companyBoxProvider = Provider<Box<List<CompanyModel>>>(
  (ref) {
    return Hive.box('company_box');
  },
);

final companyDataProvider = StateNotifierProvider<CompanyDataNotifier, List<CompanyModel>>(
  (ref) {
    return CompanyDataNotifier(box: ref.watch(_companyBoxProvider));
  },
);

class CompanyDataNotifier extends StateNotifier<List<CompanyModel>> {
  final Box<List<CompanyModel>> box;
  CompanyDataNotifier({required this.box}):super([]);
  void getCompanies(List<CompanyModel> companies)async{
    // print('provider -> ${companies.runtimeType}');
    // final data = box.get('companies');
    // if(data == null){
    //   try{
    //     await box.put('companies', companies);
    //     state = companies;
    //   }catch(err){
    //     print('provider error -> ${err.toString()}');
    //   }
    // }
    state = companies;
  }
}