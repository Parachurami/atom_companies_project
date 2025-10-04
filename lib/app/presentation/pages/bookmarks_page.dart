import 'package:atom_companies_app/app/data/models/company_model.dart';
import 'package:atom_companies_app/app/data/providers/bookmark_provider.dart';
import 'package:atom_companies_app/app/presentation/widgets/company_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class BookmarksPage extends ConsumerStatefulWidget {
  const BookmarksPage({super.key});

  @override
  ConsumerState<BookmarksPage> createState() => _BookmarksPageState();
}

class _BookmarksPageState extends ConsumerState<BookmarksPage> {

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
    final bookmarks = ref.watch(bookmarkProvider);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text('Bookmarks'),
        centerTitle: true,
      ),
      body: CompanyList(companies: bookmarks.map(
        (e) => CompanyModel.fromDynamic(e),
      ).toList()),
    );
  }
}