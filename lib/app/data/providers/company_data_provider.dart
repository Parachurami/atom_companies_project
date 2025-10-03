import 'package:atom_companies_app/app/data/models/company_model.dart';
import 'package:flutter_riverpod/legacy.dart';


final companyDataProvider = StateNotifierProvider<CompanyDataNotifier, List<CompanyModel>>(
  (ref) {
    return CompanyDataNotifier();
  },
);

class CompanyDataNotifier extends StateNotifier<List<CompanyModel>> {
  CompanyDataNotifier():super([]);
  void getCompanies(List<CompanyModel> companies)async{
    state = companies;
  }
}