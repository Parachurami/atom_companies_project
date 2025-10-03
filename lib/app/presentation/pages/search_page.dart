import 'package:atom_companies_app/app/data/models/company_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SearchPage extends ConsumerStatefulWidget {
  const SearchPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() {
    return _SearchPageState();
  }
}

class _SearchPageState extends ConsumerState<SearchPage>{
  late FocusNode focusNode;
  late TextEditingController controller;

  @override
  void initState() {
    controller = TextEditingController();
    focusNode = FocusNode()..requestFocus();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    // List<CompanyModel> companies = [];
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          children: [
            TextField(
              controller: controller,
              focusNode:focusNode,
              decoration: InputDecoration(
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide(
                    color: Colors.black
                  )
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide(
                    color: Colors.black
                  )
                )
              ),
            ),

          ],
        ),
      ),
    );
  }
}