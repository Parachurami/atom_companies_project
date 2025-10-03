import 'package:atom_companies_app/app/data/models/company_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:hive_flutter/hive_flutter.dart';

final _bookmarkBoxProvider = Provider<Box<dynamic>>(
  (ref) {
    return Hive.box('companies');
  },
);

final bookmarkProvider = StateNotifierProvider<BookmarkNotifier, List<dynamic>>(
  (ref) {
    final myBox = ref.watch(_bookmarkBoxProvider);
    return  BookmarkNotifier(myBox);
  },
);

class BookmarkNotifier extends StateNotifier<List<dynamic>>{
  final Box box;
  BookmarkNotifier(this.box):super([]);

  void loadBookMarks() async{
    final data = await box.get('data');
    if(data != null){
      state = data.map(
        (e) {
          return CompanyModel.fromJson(e);
        },
      ).toList();
    }
    print('=======================');
    print(await box.get('data'));
    print('=======================');
    print('initial bookmarks -> ${state}');
  }

  void addToBookmark(CompanyModel company) async{
    final currentState = [...state, company];
    final storageData = currentState.map(
      (e) => e.toJson(),
    ).toList();
    await box.put('data', storageData);
    state = currentState;
    print('=======================');
    print(await box.get('data'));
    print('=======================');
    print(state);
  }

  void removeFromBookmark(String id) async{
    final currentState = state.where(
      (e) => e.company_id != id,
    ).toList();
    final storageData = currentState.map(
      (e) => e.toJson(),
    ).toList();
    await box.put('data', storageData);
    print('=======================');
    print(await box.get('data'));
    print('=======================');
    state = currentState;
  }

  bool isBookmarked(CompanyModel company){
    return state.contains(company);
  }
}