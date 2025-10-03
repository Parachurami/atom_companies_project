part of './company_bloc.dart';

final class CompanyState {}

final class CompanyInitial extends CompanyState{}

final class CompanySuccess extends CompanyState{
  final List<CompanyModel> companies;
  CompanySuccess({required this.companies});
}

final class CompanySearchSuccess extends CompanyState{
  final List<CompanyModel> companies;
  CompanySearchSuccess({required this.companies});

}

final class CompanyLoading extends CompanyState{}

final class CompanyError extends CompanyState{
  final String message;

  CompanyError(this.message);

}