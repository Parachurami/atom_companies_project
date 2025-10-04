import 'package:atom_companies_app/app/data/models/company_model.dart';
import 'package:flutter_riverpod/legacy.dart';


final companyProvider = StateNotifierProvider<CompanyNotifier, List<CompanyModel>>(
  (ref) => CompanyNotifier(),
);
class CompanyNotifier extends StateNotifier<List<CompanyModel>>{
  CompanyNotifier():super([]);
  void addDetail(CompanyModel company){
    if(!state.contains(company)) state = [...state, company];
  }
}