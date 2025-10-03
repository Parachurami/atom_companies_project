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