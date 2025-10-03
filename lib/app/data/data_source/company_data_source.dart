import 'dart:convert';

import 'package:http/http.dart' as http;

class CompanyDataSource{
  Future<List<dynamic>?>? getCompanies() async{
    try{
      final res = await http.get(
        Uri.https(
          'trustpilot-company-and-reviews-data.p.rapidapi.com', 
          '/category-company-list',
          {
            'category_id': 'software_company'
          }
        ),
        headers: {
          'x-rapidapi-key': '5a82044005mshdb8a19bd8d2b38ep1f2bb4jsn3949426ac5b8',
          'x-rapidapi-host': 'trustpilot-company-and-reviews-data.p.rapidapi.com'
        }
      );
      final result = jsonDecode(res.body)['data']['companies'];
      return result;
    }catch(err){
      rethrow;
    }
  }

  Future<List<dynamic>?>? searchCompanies(String query) async{
    try{
      final res = await http.get(
        Uri.https(
          'trustpilot-company-and-reviews-data.p.rapidapi.com', 
          '/company-search',
          {
            'query':query
          }
        ),
        headers: {
          'x-rapidapi-key': '5a82044005mshdb8a19bd8d2b38ep1f2bb4jsn3949426ac5b8',
          'x-rapidapi-host': 'trustpilot-company-and-reviews-data.p.rapidapi.com'
        }
      );
      if(query.isNotEmpty){
        final result = jsonDecode(res.body)['data']['companies'];
        return result;
      }
      return [];
    }catch(err){
      rethrow;
    }
  }

  Future<List<Map<String, dynamic>>?>? getCompanyDetail(String domain) async{
    try{
      final res = await http.get(
        Uri.https(
          'trustpilot-company-and-reviews-data.p.rapidapi.com', 
          '/company-details',
          {
            'company_domain':domain
          }
        ),
        headers: {
          'x-rapidapi-key': '5a82044005mshdb8a19bd8d2b38ep1f2bb4jsn3949426ac5b8',
          'x-rapidapi-host': 'trustpilot-company-and-reviews-data.p.rapidapi.com'
        }
      );
      return jsonDecode(res.body)['data']['companies'];
    }catch(err){
      rethrow;
    }
  }
}