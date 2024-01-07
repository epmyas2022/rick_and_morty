import 'package:flutter/material.dart';
import 'package:rick_and_morty/config/menu/app_menu_items.dart';

class AppMenuBottom {
  List<BottomNavigationBarItem> _getMenuBottomItems() => menuBottomItems
      .map((menu) => BottomNavigationBarItem(
            icon: Icon(menu.icon),
            label: menu.title,
          ))
      .toList();

  BottomNavigationBar getNavigationBar(
          {required int currentIndex, required Function(int index) onTap}) =>
      BottomNavigationBar(
        items: _getMenuBottomItems(),
        currentIndex: currentIndex,
        onTap: onTap,
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.grey[900],
        useLegacyColorScheme: false,
      );

  Widget getWidgetBodyIndex(int index) => menuBottomItems[index].widget;
}
