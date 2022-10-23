import 'package:flutter/material.dart';
import 'package:ufood/constants.dart';

SizedBox bottomNavBar(int selectedIndex, void Function(int) onItemTapped) {
  return SizedBox(
    height: 45,
    child: BottomNavigationBar(
      iconSize: 20,
      selectedFontSize: 10,
      unselectedFontSize: 10,
      selectedItemColor: primaryColor,
      unselectedItemColor: textColor,
      currentIndex: selectedIndex,
      onTap: onItemTapped,
      items: const [
        BottomNavigationBarItem(
          label: 'Home',
          icon: Icon(Icons.home),
        ),
        BottomNavigationBarItem(
          label: 'Favorites',
          icon: Icon(Icons.favorite),
        ),
        BottomNavigationBarItem(
          label: 'Search',
          icon: Icon(Icons.search),
        ),
      ],
    ),
  );
}
