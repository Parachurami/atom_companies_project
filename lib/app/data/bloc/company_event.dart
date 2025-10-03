part of './company_bloc.dart';

class CompanyEvent {}

class RequestedCompaniesSearch extends CompanyEvent{
  final String query;
  RequestedCompaniesSearch(this.query);
}

class RequestedComapnyDetail extends CompanyEvent{}

class RequestedCompaniesList extends CompanyEvent{}

class RequestedResetState extends CompanyEvent{}
