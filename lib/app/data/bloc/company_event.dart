part of './company_bloc.dart';

class CompanyEvent {}

class RequestedCompaniesSearch extends CompanyEvent{
  final String query;
  RequestedCompaniesSearch(this.query);
}

class RequestedCompanyDetail extends CompanyEvent{
  final String domain;
  RequestedCompanyDetail(this.domain);

}

class RequestedCompaniesList extends CompanyEvent{}

class RequestedResetState extends CompanyEvent{}
