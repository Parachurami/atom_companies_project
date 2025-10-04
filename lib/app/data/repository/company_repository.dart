import 'package:atom_companies_app/app/data/data_source/company_data_source.dart';
import 'package:atom_companies_app/app/data/models/company_model.dart';

class CompanyRepository {
  final CompanyDataSource dataSource;
  CompanyRepository(this.dataSource);
  Future<List<CompanyModel>?>? getCompanies() async{
    try{
      final data = await dataSource.getCompanies();
      if(data == null) throw 'Data is empty';
      print(data);
      return data.map(
        (e) {
          return CompanyModel.fromMap(e);
        },
      ).toList();
    }catch(err){
      print('from repo -> ${err.toString()}');
      rethrow;
    }finally{
      print('finally -> ${await dataSource.getCompanies()}');
    }
  }

  Future<List<CompanyModel>?>? searchCompanies(String query) async{
    try{
      final data = await dataSource.searchCompanies(query);
      if(data == null) return null;
      return data.map(
        (e) {
          print(e.runtimeType);
          return CompanyModel.fromMap(e);
        },
      ).toList();
    }catch(err){
      print(err.toString());
      rethrow;
    }
  }

  Future<CompanyModel?>? getCompanyDetails(String domain) async{
    try{
      final data = await dataSource.getCompanyDetail(domain);
      if(data == null) return null;
      return CompanyModel.fromMap(data);
    }catch(err){
      rethrow;
    }
  }
}
  
  

