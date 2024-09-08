import 'package:flutter/material.dart';

import 'menu_data.dart';

class AppBottomBar extends StatelessWidget {
  final int currentIndex;
  final List<MenuData> menus;
  final ValueChanged<int>? onItemSelect;

  const AppBottomBar(
      {required this.currentIndex,
      required this.menus,
      required this.onItemSelect,
      super.key});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
        onTap: onItemSelect,
        currentIndex: currentIndex,
        elevation: 3,
        type: BottomNavigationBarType.fixed,
        iconSize: 22,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        selectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold),
        items: menus.map(_buildItemByMenuData).toList());
  }

  BottomNavigationBarItem _buildItemByMenuData(MenuData data) {
    return BottomNavigationBarItem(label: data.label, icon: Icon(data.icon));
  }
}
