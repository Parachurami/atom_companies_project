import 'package:atom_companies_app/app/data/bloc/company_bloc.dart';
import 'package:atom_companies_app/app/data/data_source/company_data_source.dart';
import 'package:atom_companies_app/app/data/providers/bookmark_provider.dart';
import 'package:atom_companies_app/app/data/repository/company_repository.dart';
import 'package:atom_companies_app/app/presentation/pages/navigation_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MyApp extends ConsumerStatefulWidget {
  const MyApp({super.key});

  @override
  ConsumerState<MyApp> createState() => _MyAppState();
}

class _MyAppState extends ConsumerState<MyApp> {

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback(
      (timeStamp) {
        ref.read(bookmarkProvider.notifier).loadBookMarks();
      },
    );
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) => CompanyRepository(CompanyDataSource()),
      child: BlocProvider(
        create: (context) => CompanyBloc(context.read<CompanyRepository>()),
        child: SafeArea(child: MaterialApp(debugShowCheckedModeBanner: false ,home: NavigationContainer(), theme: ThemeData(scaffoldBackgroundColor: Colors.white),)),
      ),
    );
  }
}
