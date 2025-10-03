import 'package:atom_companies_app/app/presentation/pages/bookmarks_page.dart';
import 'package:atom_companies_app/app/presentation/pages/home_page.dart';
import 'package:atom_companies_app/app/presentation/widgets/bottom_navigation.dart';
import 'package:atom_companies_app/app/presentation/widgets/navbar_item.dart';
import 'package:flutter/material.dart';

class NavigationContainer extends StatefulWidget {
  const NavigationContainer({super.key});

  @override
  State<NavigationContainer> createState() => _NavigationContainerState();
}

class _NavigationContainerState extends State<NavigationContainer> {
  int currentPage = 0;
    final tabs = [
      HomePage(),
      BookmarksPage()
    ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigation(
        children: [
          NavbarItem(
            isSelected: currentPage == 0,
            onPress: () {
              setState(() {
                currentPage = 0;
              });
            },
            icon: Icon(
              currentPage == 0 ? Icons.home_rounded : Icons.home_outlined,
            ),
          ),
          NavbarItem(
            isSelected: currentPage == 1,
            onPress: () {
              setState(() {
                currentPage = 1;
              });
            },
            icon: Icon(
              currentPage == 1 ? Icons.bookmark_rounded : Icons.bookmark_outline_rounded,
            ),
          ),
          
        ],
      ),
      body: tabs[currentPage]
    );
  }
}