import 'package:flutter/material.dart';
import 'package:rick_and_morty/presentation/screens/discover/discover_screen.dart';

class MenuBottomItem {
  final String title;
  final IconData icon;
  final Widget widget;

  MenuBottomItem({
    required this.title,
    required this.icon,
    required this.widget,
  });
}

List<MenuBottomItem> menuBottomItems = [
  MenuBottomItem(
    title: DiscoverScreen.title,
    icon: DiscoverScreen.icon,
    widget: const DiscoverScreen(),
  ),
  MenuBottomItem(
    title: 'Favorite',
    icon: Icons.favorite,
    widget: const Center(
      child: Text('Favorite'),
    ),
  ),
  /* MenuBottomItem(
    title: 'Account',
    icon: Icons.account_circle,
    widget: const Center(
      child: Text('Account'),
    ),
  ),
  MenuBottomItem(
    title: 'Settings',
    icon: Icons.settings,
    widget: const Center(
      child: Text('Settings'),
    ),
  ),*/
];
