import 'package:atom_companies_app/app/data/models/company_model.dart';
import 'package:atom_companies_app/app/data/repository/company_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part './company_event.dart';
part './company_state.dart';


class CompanyBloc extends Bloc<CompanyEvent, CompanyState> {
  final CompanyRepository repository;
  CompanyBloc(this.repository):super(CompanyInitial()){
    on<RequestedCompaniesList>(
      (event, emit) async{
        emit(CompanyLoading());
        try{
          final data = await repository.getCompanies();
          if(data == null) return emit(CompanyError('An error occured fetching data'));
          print(data);
          emit(CompanySuccess(companies: data));
        }catch(err){
          emit(CompanyError(err.toString()));
          print(err.toString());
        }
      },
    );
    on<RequestedCompaniesSearch>(
      (event, emit) async{
        emit(CompanyLoading());
        try{
          final data = await repository.searchCompanies(event.query);
          if(data == null) return emit(CompanyError('Error Searhing for users'));
          emit(CompanySearchSuccess(companies: data));
        }catch(err){
          emit(CompanyError(err.toString()));
          print(err.toString());
        }
      },
    );

    on<RequestedResetState>(
      (event, emit)async{
        emit(CompanyInitial());
        
      },
    );
  }



  @override
  void onTransition(Transition<CompanyEvent, CompanyState> transition) {
    print(transition);
    super.onTransition(transition);
  }

}