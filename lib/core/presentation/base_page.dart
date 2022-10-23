import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:ufood/core/presentation/widgets/bottom_navbar.dart';
import 'package:ufood/favorites/presentation/favorites_page.dart';
import 'package:ufood/recipes/presentation/recipes_page.dart';
import 'package:ufood/search/presentation/search_page.dart';

class BasePage extends ConsumerStatefulWidget {
  const BasePage({super.key});

  @override
  ConsumerState<BasePage> createState() => _TestScreenState();
}

class _TestScreenState extends ConsumerState<BasePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: bottomNavBar(
        _selectedIndex,
        (int index) {
          setState(() {
            _selectedIndex = index;
          });
        },
      ),
      body: _widgetOptions.elementAt(_selectedIndex),
    );
  }

  int _selectedIndex = 0;
  final List<Widget> _widgetOptions = [
    const RecipesPage(),
    const FavoritesPage(),
    const SearchPage(),
  ];
}
