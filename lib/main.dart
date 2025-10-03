import 'package:atom_companies_app/app/data/models/category_model.dart';
import 'package:atom_companies_app/app/data/models/company_model.dart';
import 'package:atom_companies_app/app/presentation/my_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(CategoryModelAdapter());
  Hive.registerAdapter(CompanyModelAdapter());
  await Hive.openBox<List<CompanyModel>>('company_box');
  runApp(ProviderScope(child: const MyApp()));
}
